package com.webapp.common.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;

import com.webapp.common.security.model.UserInfo;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CustomUserDetailService userDetailService;

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

    private boolean isValidAccount(Authentication authentication, UserInfo user, String inputPassword) {
      
    	logger.info("[자체 로그인] user id is {}", user.getUsrId());
    	logger.info("[자체 로그인] user inputPassword is {}", passwordEncoder.encode(inputPassword));
    	
    	return passwordEncoder.matches(inputPassword, user.getUsrPw());
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = (String) authentication.getCredentials();

        logger.info("로그인 시도 - username : {} / password : {}", username, password);

        if (!StringUtils.hasText(username)) {
            throw new UsernameNotFoundException("Incorrect Parameter");
        }

        UserInfo userInfo = null;
        try {
        	userInfo = userDetailService.findByUsrId(username);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (userInfo == null) {
            throw new UsernameNotFoundException("계정정보가 존재하지 않습니다.");
        }

        if (!isValidAccount(authentication, userInfo, password)) {
            throw new BadCredentialsException("계정정보가 일치하지 않습니다.");

        }

        return userDetailService.getToken(userInfo);
    }
}
