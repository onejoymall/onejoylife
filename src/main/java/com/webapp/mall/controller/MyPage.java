package com.webapp.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MyPage {
    //대시보드
    @RequestMapping(value="/MyPage/DashBoard")
    public String myPageDashBoard(HttpSession session, Model model, HttpServletRequest request) {
        Object requestUri=request.getRequestURI();
        model.addAttribute("style", "mypage-1");
        model.addAttribute("leftNavUri", requestUri);
        return "mypage/DashBoard";
    }
    //주문배송조회
    @RequestMapping(value="/MyPage/OrderAndDelivery")
    public String myPageOrderAndDelivery(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-3");

        return "mypage/OrderAndDelivery";
    }
    //주문상세
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetail")
    public String myPageOrderAndDeliveryDetail(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-5");
        return "mypage/OrderAndDeliveryDetail";
    }
    //교환권 상세
    @RequestMapping(value="/MyPage/OrderChangeDetail")
    public String myPageOrderChangeDetail(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-6");
        return "mypage/OrderChangeDetail";
    }
    //주문상세 무통장
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetailVA")
    public String myPageOrderAndDeliveryDetailVA(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-8");
        return "mypage/OrderAndDeliveryDetailVA";
    }
    //교환취소
    @RequestMapping(value="/MyPage/OrderChangeCancel")
    public String myPageOrderChangeCancel(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-7");
        return "mypage/OrderChangeCancel";
    }
    //교환신청
    @RequestMapping(value="/MyPage/OrderChange")
    public String myPageOrderChange(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-9");
        return "mypage/OrderChange";
    }
    //취소,재결제,교환,반품
    @RequestMapping(value="/MyPage/OrderCancels")
    public String myPageOrderCancels(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-10");
        return "mypage/OrderCancels";
    }
    //반품
    @RequestMapping(value="/MyPage/OrderCancel")
    public String myPageOrderCancel(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-10");
        return "mypage/OrderCancel";
    }
    //이포인트
    @RequestMapping(value="/MyPage/ePoint")
    public String myPagePoint(Model model,HttpServletRequest request) {
        Object requestUri=request.getRequestURI();
        model.addAttribute("leftNavOrder", 1);
        model.addAttribute("style", "mypage-11");
        return "mypage/ePoint";
    }
    //쿠폰
    @RequestMapping(value="/MyPage/Coupon")
    public String myPageCoupon(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-12");
        return "mypage/Coupon";
    }
    //경품 체험
    @RequestMapping(value="/MyPage/GiveawayExperience")
    public String myPageGiveawayExperience(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-");
        return "mypage/GiveawayExperience";
    }
    //경품담청내역
    @RequestMapping(value="/MyPage/GiveawayWinningList")
    public String myPageGiveawayWinningList(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-13");
        return "mypage/GiveawayWinningList";
    }
    //장바구니
    @RequestMapping(value="/MyPage/ShoppingBasket")
    public String myPageShoppingBasket(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-13");
        return "mypage/ShoppingBasket";
    }
    //찜 목록
    @RequestMapping(value="/MyPage/ShoppingAddList")
    public String myPageShoppingAddList(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-13");
        return "mypage/ShoppingAddList";
    }
    //리뷰
    @RequestMapping(value="/MyPage/Reviews")
    public String myPageReviews(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-13");
        return "mypage/Reviews";
    }
    //자주 구매하는 상품
    @RequestMapping(value="/MyPage/Favorites")
    public String myPageFavorites(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-13");
        return "mypage/Favorites";
    }
    //회원정보 변경
    @RequestMapping(value="/MyPage/ModifyUserInfo")
    public String myPageModifyUserInfo(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-");
        return "mypage/ModifyUserInfo";
    }
    //배송지 변경
    @RequestMapping(value="/MyPage/DeliveryAddress")
    public String myPageDeliveryAddress(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("style", "mypage-");
        return "mypage/DeliveryAddress";
    }
}
