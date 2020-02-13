package com.webapp.mall.vo;

public class GiveawayVO {
    public Integer giveaway_payment_epoint;
    public String giveaway_cd;
    public Integer giveaway_play_user_id;
    public String giveaway_play_cd;

    public String getGiveaway_play_cd() {
        return giveaway_play_cd;
    }

    public void setGiveaway_play_cd(String giveaway_play_cd) {
        this.giveaway_play_cd = giveaway_play_cd;
    }

    public Integer getGiveaway_payment_epoint() {
        return giveaway_payment_epoint;
    }

    public Integer getGiveaway_play_user_id() {
        return giveaway_play_user_id;
    }

    public String getGiveaway_cd() {
        return giveaway_cd;
    }

    public void setGiveaway_cd(String giveaway_cd) {
        this.giveaway_cd = giveaway_cd;
    }

    public void setGiveaway_payment_epoint(Integer giveaway_payment_epoint) {
        this.giveaway_payment_epoint = giveaway_payment_epoint;
    }

    public void setGiveaway_play_user_id(Integer giveaway_play_user_id) {
        this.giveaway_play_user_id = giveaway_play_user_id;
    }
}
