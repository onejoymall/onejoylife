package com.webapp.mall.controller;

import autovalue.shaded.com.google$.common.collect.$ForwardingObject;
import com.webapp.common.support.MessageSource;
import com.webapp.mall.dao.CouponDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.springframework.util.CollectionUtils.isEmpty;
@Controller
public class MyPage {
    @Autowired
    MessageSource messageSource;
    @Autowired
    CouponDAO couponDAO;
    @Autowired
    PointDAO pointDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    UserDAO userDAO;
    //MyPage 해더
    @RequestMapping(value="/MyPage/RightHeader")
    public String RightHeader(Model model, HashMap params, HttpSession session) throws SQLException {

        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            Map<String,Object> coupon = couponDAO.getUserCouponListCount(params);
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            Map<String ,Object> point = pointDAO.getPointAmount(params);
            model.addAttribute("couponCnt", (Long)coupon.get("cnt"));
            model.addAttribute("point_amount",point.get("point_amount").toString());

        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-1");
        return "layout/MyPageRightHeader";
    }
    //대시보드
    @RequestMapping(value="/MyPage/DashBoard")
    public String myPageDashBoard( Model model) {
        model.addAttribute("leftNavOrder", 1);
        model.addAttribute("style", "mypage-1");
        return "mypage/DashBoard";
    }
    //이포인트
    @RequestMapping(value="/MyPage/ePoint")
    public String myPagePoint(Model model,HttpServletRequest request,HttpSession session,HashMap params) throws SQLException {
        try{
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            List<Map<String,Object>> list = pointDAO.getPointList(params);
            model.addAttribute("list", list);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 2);
        model.addAttribute("style", "mypage-2");
        return "mypage/ePoint";
    }
    //쿠폰
    @RequestMapping(value="/MyPage/Coupon")
    public String myPageCoupon(HttpSession session, Model model, HashMap params) {

        try{
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("coupon_paid_user_id",userInfo.get("usr_id"));
            List<Map<String,Object>> userCouponList = couponDAO.getUserCouponList(params);
            model.addAttribute("message_coupon_payment_condition",messageSource.getMessage("coupon.coupon_payment_condition","ko"));
            model.addAttribute("userCouponList", userCouponList);
            model.addAttribute("style", "mypage-3");
            model.addAttribute("leftNavOrder", 3);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mypage/Coupon";
    }
    //장바구니
    @RequestMapping(value="/MyPage/ShoppingBasket")
    public String myPageShoppingBasket(Model model) {
        model.addAttribute("style", "mypage-4");
        model.addAttribute("leftNavOrder", 4);
        return "mypage/ShoppingBasket";
    }
    //찜 목록
    @RequestMapping(value="/MyPage/ShoppingAddList")
    public String myPageShoppingAddList(Model model) {
        model.addAttribute("style", "mypage-5");
        model.addAttribute("leftNavOrder", 5);
        return "mypage/ShoppingAddList";
    }
    //주문배송조회
    @RequestMapping(value="/MyPage/OrderAndDelivery")
    public String myPageOrderAndDelivery(Model model) {
        model.addAttribute("style", "mypage-6");
        model.addAttribute("leftNavOrder", 6);
        return "mypage/OrderAndDelivery";
    }
    //주문상세
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetail")
    public String myPageOrderAndDeliveryDetail(Model model) {
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1");
        return "mypage/OrderAndDeliveryDetail";
    }
    //취소
    @RequestMapping(value="/MyPage/OrderChangeCancel")
    public String myPageOrderChangeCancel(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1-1");
        return "mypage/OrderChangeCancel";
    }
    //주문상세 무통장
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetailVA")
    public String myPageOrderAndDeliveryDetailVA(Model model) {
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-");
        return "mypage/OrderAndDeliveryDetailVA";
    }
    //취소,재결제,교환,반품
    @RequestMapping(value="/MyPage/OrderCancels")
    public String myPageOrderCancels(Model model) {
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7");
        return "mypage/OrderCancels";
    }
    //교환신청
    @RequestMapping(value="/MyPage/OrderChange")
    public String myPageOrderChange(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7-1");
        return "mypage/OrderChange";
    }
    //반품
    @RequestMapping(value="/MyPage/OrderRollback")
    public String myPageOrderRollback(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7-2");
        return "mypage/OrderRollback";
    }
    //리뷰
    @RequestMapping(value="/MyPage/Reviews")
    public String myPageReviews(Model model) {
        model.addAttribute("leftNavOrder", 8);
        model.addAttribute("style", "mypage-8");
        return "mypage/Reviews";
    }
    //자주 구매하는 상품
    @RequestMapping(value="/MyPage/Favorites")
    public String myPageFavorites(Model model) {
        model.addAttribute("leftNavOrder", 9);
        model.addAttribute("style", "mypage-9");
        return "mypage/Favorites";
    }
    //경품 체험
    @RequestMapping(value="/MyPage/GiveawayExperience")
    public String myPageGiveawayExperience(Model model) {
        model.addAttribute("leftNavOrder", 10);
        model.addAttribute("style", "mypage-10");
        return "mypage/GiveawayExperience";
    }
    //경품담청내역
    @RequestMapping(value="/MyPage/GiveawayWinningList")
    public String myPageGiveawayWinningList(Model model) {
        model.addAttribute("leftNavOrder", 11);
        model.addAttribute("style", "mypage-11");
        return "mypage/GiveawayWinningList";
    }
    //경품 참여 정보입력
    @RequestMapping(value="/MyPage/giveawayform")
    public String giveawayform(Model model, HashMap params, HttpServletRequest request,HttpSession session) throws SQLException {
        params.put("email",session.getAttribute("email"));
        Map<String, Object> userInfo = userDAO.getLoginUserList(params);
        if(!isEmpty(userInfo)){
            model.addAttribute("userInfo",userInfo );
        }
        model.addAttribute("style", "mypage-4-2-1");
        return "giveaway/giveawayform";
    }
    //회원정보 변경
    @RequestMapping(value="/MyPage/ModifyUserInfo")
    public String myPageModifyUserInfo(Model model) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12");
        return "mypage/ModifyUserInfo";
    }
    //배송지 변경
    @RequestMapping(value="/MyPage/DeliveryAddress")
    public String myPageDeliveryAddress(Model model) {
        model.addAttribute("leftNavOrder", 13);
        model.addAttribute("style", "mypage-13");
        return "mypage/DeliveryAddress";
    }
    //교환권 상세
    @RequestMapping(value="/MyPage/OrderChangeDetail")
    public String myPageOrderChangeDetail(Model model) {
        model.addAttribute("style", "mypage-6");
        return "mypage/OrderChangeDetail";
    }
}
