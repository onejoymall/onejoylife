package com.webapp.common.security.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.webapp.common.security.TokenUser;
import com.webapp.common.security.dao.UserInfoDao;
import com.webapp.common.security.model.UserInfo;

@Service
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    private UserInfoDao dao;

    public UserInfo findByUsrId(String usrId) throws Exception {
        if (!StringUtils.hasText(usrId)) {
            throw new Exception("Incorrect Parameter");
        }

        return dao.selectUserInfo(usrId);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        String usrId = username;
        UserInfo user = dao.selectUserInfo(username);

        if (user == null)
            throw new UsernameNotFoundException(String.format("User %s does not exist!", usrId));

        return new UserRepositoryUserDetails(user);
    }

    public UsernamePasswordAuthenticationToken getToken(UserInfo user) {

        List<GrantedAuthority> roles = getUserRoles(user);
        TokenUser tokenUser = new TokenUser();
        tokenUser.setUsrId(user.getUsrId());
        return new UsernamePasswordAuthenticationToken(user.getUsrId(), null, roles);
    }

    @SuppressWarnings("unchecked")
	private List<GrantedAuthority> getUserRoles(UserInfo user) {
        UserRepositoryUserDetails userDetails = new UserRepositoryUserDetails(user);
        return (List<GrantedAuthority>) userDetails.getAuthorities();
    }

    @SuppressWarnings("serial")
	private class UserRepositoryUserDetails implements UserDetails {

        private UserInfo user;

        public UserRepositoryUserDetails(UserInfo userInfo) {
            this.user = userInfo;
        }

        @Override
        public Collection<? extends GrantedAuthority> getAuthorities() {

            List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
            roles.add(new SimpleGrantedAuthority("ROLE_USER"));

            return roles;
        }

        @Override
        public String getUsername() {
            return user.getUsrId();
        }

        @Override
        public boolean isAccountNonExpired() {
            return true;
        }

        @Override
        public boolean isAccountNonLocked() {
            return true;
        }

        @Override
        public boolean isCredentialsNonExpired() {
            return true;
        }

        @Override
        public boolean isEnabled() {
            return true;
        }

		@Override
		public String getPassword() {
			// TODO Auto-generated method stub
			return null;
		}
    }
}
