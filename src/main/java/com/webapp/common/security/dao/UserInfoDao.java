package com.webapp.common.security.dao;

import com.webapp.common.security.model.UserInfo;

public interface UserInfoDao {

    public UserInfo selectUserInfo(String usrId);
    
}
