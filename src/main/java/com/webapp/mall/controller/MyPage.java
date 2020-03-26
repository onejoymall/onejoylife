package com.webapp.mall.controller;

import autovalue.shaded.com.google$.common.collect.$ForwardingObject;
import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
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
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    DeliveryDAO deliveryDAO;
    @Autowired
    CartDAO cartDAO;
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    private NumberGender numberGender;
    //MyPage 해더
    @RequestMapping(value="/MyPage/RightHeader")
    public String RightHeader(Model model, HashMap params, HttpSession session) throws SQLException {

        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            Map<String,Object> coupon = couponDAO.getUserCouponListCount(params);
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            params.put("giveaway_play_user_id",userInfo.get("usr_id"));
            params.put("order_user_id",userInfo.get("usr_id"));
            //배송중
            params.put("delivery_status","D");

            Integer giveawayCnt = giveawayDAO.getUserGiveawayPlayListCount(params);
            Integer getDeliveryListCount = deliveryDAO.getDeliveryListCount(params);
            model.addAttribute("getDeliveryListCount",getDeliveryListCount);
            model.addAttribute("giveawayCnt",giveawayCnt);
            model.addAttribute("couponCnt", (Long)coupon.get("cnt"));
            model.addAttribute("point_amount",pointDAO.getPointAmount(params));

        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-1");
        return "layout/MyPageRightHeader";
    }
    //대시보드
    @RequestMapping(value="/MyPage/DashBoard")
    public String myPageDashBoard( Model model,@RequestParam HashMap params,HttpSession session,SearchVO searchVO) {
        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("payment_user_id",userInfo.get("usr_id"));
            //최근 구매내역
            searchVO.setDisplayRowCount(3);
            searchVO.setStaticRowEnd(3);
            searchVO.pageCalculate(paymentDAO.getPaymentListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);
            List<Map<String,Object>> paymentList = paymentDAO.getPaymentList(params);
            model.addAttribute("paymentList", paymentList);

            //경품참여
            params.put("giveaway_play_user_id",userInfo.get("usr_id"));
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(giveawayDAO.getUserGiveawayPlayListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());

            List<Map<String,Object>> giveawayList = giveawayDAO.getUserGiveawayPlayList(params);
            model.addAttribute("giveawayList", giveawayList);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 1);
        model.addAttribute("style", "mypage-1");
        return "mypage/DashBoard";
    }
    //이포인트
    @RequestMapping(value="/MyPage/ePoint")
    public String myPagePoint(Model model,HttpServletRequest request,HttpSession session,HashMap params,SearchVO searchVO) throws SQLException {
        try{
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(giveawayDAO.getUserGiveawayPlayListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);

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
    public String myPageShoppingBasket(Model model,HashMap params,HttpSession session,SearchVO searchVO) throws Exception{
        //사용자 아이디 확인 후 전달
        params.put("email",session.getAttribute("email"));
        Map<String,Object> userInfo = userDAO.getLoginUserList(params);
        try {

            if(isEmpty(userInfo)){
                params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("cart_user_id",userInfo.get("usr_id"));
            }
            //페이징
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getCartListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);
            //결제비용

            Map<String,Object> getCartSum = cartDAO.getCartSum(params);
            List<Map<String,Object>> list = cartDAO.getCartList(params);
            model.addAttribute("list", list);
            model.addAttribute("getCartSum", getCartSum);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-4");
        model.addAttribute("leftNavOrder", 4);
        return "mypage/ShoppingBasket";
    }
    //찜 목록
    @RequestMapping(value="/MyPage/ShoppingAddList")
    public String myPageShoppingAddList(Model model,HashMap params,HttpSession session,SearchVO searchVO) throws Exception{
        //사용자 아이디 확인 후 전달
        params.put("email",session.getAttribute("email"));
        Map<String,Object> userInfo = userDAO.getLoginUserList(params);
        try {

            if(isEmpty(userInfo)){
                params.put("user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("user_id",userInfo.get("usr_id"));
            }
            //페이징
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getFavoritesListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);
            //결제비용

            Map<String,Object> getCartSum = cartDAO.getFavoritesSum(params);
            List<Map<String,Object>> list = cartDAO.getFavoritesList(params);
            model.addAttribute("list", list);
            model.addAttribute("getCartSum", getCartSum);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-5");
        model.addAttribute("leftNavOrder", 5);
        return "mypage/ShoppingAddList";
    }
    //주문배송조회
    @RequestMapping(value="/MyPage/OrderAndDelivery")
    public String myPageOrderAndDelivery(Model model,@RequestParam HashMap params,HttpSession session,SearchVO searchVO) throws Exception{
        try{
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            params.put("payment_user_id",userInfo.get("usr_id"));
            //페이징
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(paymentDAO.getPaymentListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            model.addAttribute("searchVO", searchVO);



            params.put("order_user_id",userInfo.get("usr_id"));


            List<Map<String,Object>> paymentList = paymentDAO.getPaymentList(params);

            model.addAttribute("paymentList", paymentList);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-6");
        model.addAttribute("leftNavOrder", 6);
        return "mypage/OrderAndDelivery";
    }
    //주문상세
    @RequestMapping(value="/MyPage/OrderAndDeliveryDetail")
    public String myPageOrderAndDeliveryDetail(Model model,@RequestParam HashMap params) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1");
        return "mypage/OrderAndDeliveryDetail";
    }
    //주문상세
    @RequestMapping(value="/MyPage/OrderDetailGuest")
    public String myPageOrderAndDeliveryDetailGuest(Model model,@RequestParam HashMap params) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1");
        return "mypage/OrderAndDeliveryDetail";
    }

    //취소
    @RequestMapping(value="/MyPage/OrderCancel")
    public String myPageOrderChangeCancel(HttpSession session,Model model,HttpServletRequest request,@RequestParam HashMap params) {
        try{
            Map<String,Object> paymentDetail = paymentDAO.getPaymentDetail(params);
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            model.addAttribute("paymentDetail", paymentDetail);
            model.addAttribute("delivery", delivery);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("postUrl","/SavePaymentCancel");
        model.addAttribute("leftNavOrder", 6);
        model.addAttribute("style", "mypage-6-1-1");
        return "mypage/mypage-6-1-1";
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
    //반품신청
//    @RequestMapping(value="/MyPage/OrderCancel")
//    public String myPageOrderCancel(HttpSession session,Model model,HttpServletRequest request) {
//        model.addAttribute("leftNavOrder", 7);
//        model.addAttribute("style", "mypage-7-2");
//        return "mypage/OrderCancel";
//    }
    //반품
    @RequestMapping(value="/MyPage/OrderRollback")
    public String myPageOrderRollback(HttpSession session,Model model,HttpServletRequest request) {
        model.addAttribute("leftNavOrder", 7);
        model.addAttribute("style", "mypage-7-2");
        return "mypage/mypage-7-2";
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
    public String myPageGiveawayWinningList(Model model, SearchVO searchVO,HashMap params,HttpSession session) throws SQLException {

        params.put("email",session.getAttribute("email"));
        Map<String, Object> userInfo = userDAO.getLoginUserList(params);
        params.put("giveaway_play_user_id",userInfo.get("usr_id"));
        searchVO.setDisplayRowCount(5);
        searchVO.setStaticRowEnd(5);
        searchVO.pageCalculate(giveawayDAO.getUserGiveawayPlayListCount(params));
        params.put("rowStart",searchVO.getRowStart());
        params.put("staticRowEnd",searchVO.getStaticRowEnd());

        List<Map<String,Object>> giveawayList = giveawayDAO.getUserGiveawayPlayList(params);
        model.addAttribute("listCnt", giveawayDAO.getUserGiveawayPlayListCount(params));
        model.addAttribute("list", giveawayList);
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("leftNavOrder", 11);
        model.addAttribute("style", "mypage-11");
        return "mypage/GiveawayWinningList";
    }
    //경품 참여 정보입력
    @RequestMapping(value="/MyPage/giveawayform")
    public String giveawayform(Model model, HashMap params, HttpServletRequest request,HttpSession session) throws Exception {
        params.put("email",session.getAttribute("email"));
        Map<String, Object> userInfo = userDAO.getLoginUserList(params);
        try {
            if(!isEmpty(userInfo)){
                params.put("giveaway_cd",request.getParameter("giveaway_cd"));
                Map<String,Object> detail = giveawayDAO.getGiveawayDetail(params);
                //배송정보
                params.put("delivery_class",detail.get("giveaway_delivery_class"));
                //배송밥법
                params.put("delivery_type",detail.get("giveaway_delivery_type"));
                //배송비구분
                params.put("delivery_payment_class",detail.get("giveaway_delivery_payment_class"));
                //배송비 구분별 값
                params.put("delivery_payment",detail.get("giveaway_delivery_payment"));
                Map<String,Object> delivery = giveawayDelivery(params);
                //주문번호 생성
                model.addAttribute("order_no","GW-ORDER-"+numberGender.numberGen(6,1) );
                //최근 배송지 불러오기
                params.put("order_user_id",userInfo.get("usr_id"));
                Map<String,Object> latestDelivery = deliveryDAO.getDeliveryLatest(params);
                model.addAttribute("userInfo",userInfo );
                model.addAttribute("postUrl","/SaveDeliveInfo" );
                model.addAttribute("delivery",delivery );
                model.addAttribute("latestDelivery",latestDelivery );
                model.addAttribute("detail",detail );
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("style", "mypage-4-2-1");
        return "giveaway/giveawayform";
    }
    //경품 결제
    @RequestMapping(value="/MyPage/giveawaypayment")
    public String giveawaypayment(Model model, HashMap params, HttpServletRequest request,HttpSession session) throws Exception {

        try{
            params.put("order_no",request.getParameter("order_no"));
            Map<String,Object> delivery = deliveryDAO.getDeliveryDetail(params);
            params.put("giveaway_cd",delivery.get("giveaway_cd"));
            params.put("product_cd",delivery.get("product_cd"));
            Map<String,Object> detail = giveawayDAO.getGiveawayDetail(params);
            //공급가
            Integer texPayment = (Integer) detail.get("giveaway_user_payment");
            //부가세
            double texD = Math.round((texPayment/1.1)-((texPayment/1.1)/1.1));

            //기타소득세
            double texE = Math.round(((texPayment/1.1)/1.1)*0.22);
            //주민세
            double texF= Math.round(((texPayment/1.1)/1.1)*0.022);

            double Sum=texD+texE+texF;
            String texSum = Double.toString(Sum);
//            Integer texSumOut = Integer.parseInt(texSum);

            model.addAttribute("postUrl", "/SavePayment");
            model.addAttribute("texSum", texSum);
            model.addAttribute("delivery", delivery);
            model.addAttribute("detail", detail);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "mypage-4-2-2");
        return "mypage/GiveawayPayment";
    }
    //회원정보 변경 비번확인
    @RequestMapping(value="/MyPage/ModifyUserInfo")
    public String myPageModifyUserInfo(Model model) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12");
        return "mypage/ModifyUserInfo";
    }
    //회원정보 변경
    @RequestMapping(value="/MyPage/ModifyUserInfoForm")
    public String myPageModifyUserInfoForm(Model model) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12-1");
        return "mypage/ModifyUserInfoForm";
    }
    //회원정보 탈퇴
    @RequestMapping(value="/MyPage/ModifyUserInfoExit")
    public String myPageModifyUserInfoExit(Model model) {
        model.addAttribute("leftNavOrder", 12);
        model.addAttribute("style", "mypage-12-1-1");
        return "mypage/ModifyUserInfoExit";
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

    //배송정보 출력
    public Map<String ,Object> giveawayDelivery(HashMap params)throws SQLException {

        //배송방법이 없으면 입력값 고정 출력
        if (params.get("delivery_class").equals("F")) {
            //관리자가 설정한 기본 배송방법
            params.put("selector", "기본배송");
        } else {
            //배송방법이 개별이면 사용자 선택
            String splitString = (String) params.get("delivery_type");//배송방법
            String[] splitArray = splitString.split("\\|");
            //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
            params.put("code", "product_delivery_type");
            params.put("code_values", splitArray);
            List<Map<String, Object>> selector = selectorDAO.getSelector(params);
            params.put("selector", selector);
        }

        return params;
    }
}
