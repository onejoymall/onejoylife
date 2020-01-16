package com.webapp.common.security;

import java.io.Serializable;

public class TokenUser implements Serializable {

    private static final long serialVersionUID = 1604548230417139917L;

    private String usrId;

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
}
