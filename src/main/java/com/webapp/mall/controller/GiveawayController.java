package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PointDAO;
import com.webapp.mall.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Arrays;
import static org.springframework.util.CollectionUtils.isEmpty;
@Controller
public class GiveawayController {
    @Autowired
    UserDAO userDAO;
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    PointDAO pointDAO;
    //경품 목록
    @RequestMapping(value="/giveaway")
    public String giveawayList(Model model, HttpSession session, HashMap params, SearchVO searchVO) {
        try{
            //사용자 아이디 확인 후 전달
//            params.put("email",session.getAttribute("email"));
//            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
//            params.put("point_paid_user_id",userInfo.get("usr_id"));

            searchVO.setStaticRowEnd(9);

            searchVO.pageCalculate(giveawayDAO.getGiveawayListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = giveawayDAO.getGiveawayList(params);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "epoint-gift");
        return "giveaway/giveawaylist";
    }
    //경품 상세333
    @RequestMapping(value="/giveaway/giveawaydetail",method = RequestMethod.GET)
    public String giveawayDetail(Model model, HashMap params, HttpServletRequest request,HttpSession session) throws SQLException {
        params.put("email",session.getAttribute("email"));
        //로그인 확인
        Map<String,Object> userInfo = userDAO.getLoginUserList(params);
        if(!isEmpty(userInfo)){
            params.put("point_paid_user_id",userInfo.get("usr_id"));
            Integer point = pointDAO.getPointAmount(params);
            model.addAttribute("point_amount",point);
        }

        params.put("giveaway_id",request.getParameter("giveaway_id"));
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

        model.addAttribute("delivery",delivery);
        model.addAttribute("delivery_type_list", delivery.get("selector"));
        model.addAttribute("style", "gift-view");
        model.addAttribute("detail", detail);
        //포인트 확인 url
        model.addAttribute("postUrl", "/giveaway/PointAmountCheckProc");
        return "giveaway/giveawaydetail";
    }

    //배송정보 출력
    public Map<String ,Object> giveawayDelivery(HashMap params)throws SQLException {

        //배송방법이 없으면 입력값 고정 출력
        if(params.get("delivery_class").equals("F") ){
            params.put("selector","기본배송");
        }else {
            //배송방법이 개별이면 사용자 선택
            String splitString = (String)params.get("delivery_type");//배송방법
            String[] splitArray = splitString.split( "\\|");
            //관리자가 지정한 배송방법을 출력해준다 경품 상품 모두 동일한 코드사용
            params.put("code","product_delivery_type");
            params.put("code_values",splitArray);
            List<Map<String,Object>> selector = selectorDAO.getSelector(params);
            params.put("selector",selector);
        }

        //관리자가 지정한 배송구분별 배송비용을 출력한다.
        String splitDeliveryPaymentString=(String)params.get("delivery_payment");//구분별 배송비
        String deliveryPutString="";
        switch((String)params.get("delivery_payment_class")){
            case "T":
                params.put("delivery_payment","배송비 무료");
                break;
            case "R":
                params.put("delivery_payment","배송비 "+String.format("%,d", Integer.parseInt(splitDeliveryPaymentString)) + "원");
                break;
            case "M":
                String[] splitDeliveryTypeM = splitDeliveryPaymentString.split( "\\|");
                params.put("delivery_payment","결재금액 "
                        +String.format("%,d", Integer.parseInt(splitDeliveryTypeM[0])) +"원 이하 / 배송비"
                        +String.format("%,d", Integer.parseInt(splitDeliveryTypeM[1]))+" 원");
                break;
            case "D":
                String[] splitDeliveryTypeD = splitDeliveryPaymentString.split( "\\//");

                for (int i=0;i<splitDeliveryTypeD.length; i++){
                    deliveryPutString += "결재금액 "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0])) +"원 ~ "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1])) +"원 미만 / 배송비 "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2])) +"원</br>";
                }
                params.put("delivery_payment",deliveryPutString);
                break;
            case "W":
                String[] splitDeliveryTypeW = splitDeliveryPaymentString.split( "\\//");

                for (int i=0;i<splitDeliveryTypeW.length; i++){
                    deliveryPutString += ""
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0])) +"kg ~ "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1])) +"kg 미만 / 배송비 "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2])) +"원</br>";
                }
                params.put("delivery_payment",deliveryPutString);
                break;
            case "C":
                String[] splitDeliveryTypeC = splitDeliveryPaymentString.split( "\\//");

                for (int i=0;i<splitDeliveryTypeC.length; i++){
                    deliveryPutString += ""
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0])) +"ea ~ "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1])) +"ea 미만 / 배송비 "
                            +String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2])) +"원</br>";
                }
                params.put("delivery_payment",deliveryPutString);
                break;
        }
        return params;
    }
}
