package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.mall.vo.TodayVO;
import com.webapp.manager.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.Contended;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.springframework.util.CollectionUtils.isEmpty;
@Controller
public class ProductController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    DeliveryDAO deliveryDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private CartDAO cartDAO;
    //상품 검색
    @RequestMapping(value="/product/search-page")
    public String productSearch(Model model, HttpSession session, HashMap params, SearchVO searchVO,HttpServletRequest request) throws Exception {
        try{
            if(searchVO.getDisplayRowCount()==null || searchVO.getDisplayRowCount() < 12){
                searchVO.setDisplayRowCount(12);
            }
            // 기본정렬
            if(searchVO.getOrderByValue()==null || searchVO.getOrderByKey()==null){
                searchVO.setOrderByKey("product_id");
                searchVO.setOrderByValue("DESC");
            }
            searchVO.setProduct_sale_yn("Y");
            searchVO.setProduct_use_yn("Y");
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            searchVO.setPd_category_id(searchVO.getProduct_ct());
            List<Map<String,Object>> list = productDAO.getProductList(searchVO);
            Map<String,Object> categoryRowData = categoryDAO.getCategoryDetail(searchVO);
            model.addAttribute("list", list);
            model.addAttribute("categoryRowData",categoryRowData);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "category-sub");
        return "product/search-page";
    }
    //상품 목록
    @RequestMapping(value="/product")
    public String productList(Model model, HttpSession session, HashMap params, SearchVO searchVO,HttpServletRequest request) throws Exception {
        try{
            //사용자 아이디 확인 후 전달
//            params.put("email",session.getAttribute("email"));
//            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
//            params.put("point_paid_user_id",userInfo.get("usr_id"));
            if(searchVO.getDisplayRowCount()==null || searchVO.getDisplayRowCount() < 12){
                searchVO.setDisplayRowCount(12);
            }
            // 기본정렬
            if(searchVO.getOrderByValue()==null || searchVO.getOrderByKey()==null){
                searchVO.setOrderByKey("product_id");
                searchVO.setOrderByValue("DESC");
            }
            searchVO.setProduct_sale_yn("Y");
            searchVO.setProduct_use_yn("Y");
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            searchVO.setPd_category_id(searchVO.getProduct_ct());
            List<Map<String,Object>> list = productDAO.getProductList(searchVO);
            Map<String,Object> categoryRowData = categoryDAO.getCategoryDetail(searchVO);
            model.addAttribute("list", list);
            model.addAttribute("categoryRowData",categoryRowData);
            model.addAttribute("searchVO", searchVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "category-sub");
        return "product/productList";
    }
    //상품 상세
    @RequestMapping(value = "/product/productDetail")
    public String ProductDetail(@RequestParam HashMap params, ModelMap model, SearchVO searchVO, HttpSession session, TodayVO todayVO, HttpServletRequest request) throws Exception {
        try{

            //상품 상세페이지 로드시 최근 본 상품 세션에 적용
            if(isEmpty((List<String>)session.getAttribute("today"))){
                todayVO.setProduct_cd_array_string((String)params.get("product_cd"));
                session.setAttribute("today",todayVO.getProduct_cd_array());
            }else{
                todayVO.setProduct_cd_array((List<String>) session.getAttribute("today"));
                todayVO.setProduct_cd_array_string((String)params.get("product_cd"));
                session.setAttribute("today",todayVO.getProduct_cd_array());
            }


            params.put("email",session.getAttribute("email"));
            Map<String, Object> userInfo = userDAO.getLoginUserList(params);
            Map<String,Object> list = productDAO.getProductViewDetail(params);
            model.addAttribute("style","goods-view");
            model.addAttribute("list",list);
            //찜한 상품 표기
            // 비회원 처리 로직 변경필요
            if(isEmpty(userInfo)){
                params.put("user_id", session.getAttribute("nonMembersUserId"));
            }else{
                params.put("user_id", userInfo.get("usr_id"));
            }
            searchVO.setDisplayRowCount(1);
            searchVO.pageCalculate(cartDAO.getFavoritesListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());

            List<Map<String,Object>> heart = cartDAO.getFavoritesList(params);
            if(!isEmpty(heart)){
                model.addAttribute("heart",true);
            }
            //배송정보
            params.put("delivery_class",list.get("product_delivery_class"));
            //배송밥법
            params.put("delivery_type",list.get("product_delivery_type"));
            //배송비구분
            params.put("delivery_payment_class",list.get("product_delivery_payment_class"));
            //배송비 구분별 값
            params.put("delivery_payment",list.get("product_delivery_payment"));
            Map<String,Object> delivery = giveawayDelivery(params);

            model.addAttribute("delivery",delivery);
            model.addAttribute("delivery_type_list", delivery.get("selector"));
//            model.addAttribute("productList",productList);
            //옵션
            params.put("product_option_style",list.get("product_option_style"));
            params.put("product_option_input",list.get("product_option_input"));
            String option = getOption(params);
            model.addAttribute("option",option);
        }catch (Exception e){
            e.printStackTrace();
        }
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/goods-view";
        } else {
            return "product/productdetail";
        }
    }
    //결제
    @RequestMapping(value = "/product/productPaymentCart")
    public String productPaymentCart(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, HttpSession session, CommonVO commonVO,SearchVO searchVO) throws Exception{
        try{
            params.put("email",session.getAttribute("email"));
            Map<String, Object> userInfo = userDAO.getLoginUserList(params);
            if(commonVO.getChk().length!=0){
                if(isEmpty(userInfo)){
                    params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
                }else{
                    params.put("cart_user_id",userInfo.get("usr_id"));
                }

                model.addAttribute("searchVO", searchVO);
                //결제비용
                Map<String,Object> getCartSum = cartDAO.getCartSum(params);
                List<Map<String,Object>> cartList = cartDAO.getCartPaymentList(params);
                model.addAttribute("cartList", cartList);
                model.addAttribute("getCartSum", getCartSum);

                if(!isEmpty(userInfo)){

                    //최근 배송지 불러오기
                    params.put("product_cd",null);
                    params.put("giveaway_cd",null);
                    params.put("order_user_id",userInfo.get("usr_id"));
                    params.put("order_no",null);
                    Map<String,Object> latestDelivery = deliveryDAO.getDeliveryLatest(params);
                    model.addAttribute("userInfo",userInfo );
                    model.addAttribute("latestDelivery",latestDelivery );
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style","mypage-4-1-1");
        return "product/cartpayment";
    }
    @RequestMapping(value = "/product/productPayment")
    public String productPayment(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, HttpSession session, CommonVO commonVO,SearchVO searchVO) throws Exception{

        try{

            params.put("email",session.getAttribute("email"));
            Map<String, Object> userInfo = userDAO.getLoginUserList(params);
            String order_no = "PD-ORDER-"+numberGender.numberGen(6,1);
            params.put("product_cd",request.getParameter("product_cd"));
            Map<String,Object> detail = productDAO.getProductViewDetail(params);
            //상품 금액
            params.put("product_payment",detail.get("product_payment"));
            //배송정보
            params.put("delivery_class",detail.get("product_delivery_class"));
            //배송밥법
            params.put("delivery_type",detail.get("product_delivery_type"));
            //배송비구분
            params.put("delivery_payment_class",detail.get("product_delivery_payment_class"));
            //배송비 구분별 값
            params.put("delivery_payment",detail.get("product_delivery_payment"));
            Map<String,Object> delivery = giveawayDelivery(params);
            model.addAttribute("delivery",delivery );
            //옵션
            params.put("product_option_input",detail.get("product_option_input"));
            String option = getOption(params);

            detail.put("payment_order_quantity",params.get("payment_order_quantity"));
            Integer deliveryPayment = deliveryPayment(detail);
            model.addAttribute("option",option );
            model.addAttribute("deliveryPayment",deliveryPayment );
            if(!isEmpty(userInfo)){

                //최근 배송지 불러오기
                params.put("product_cd",null);
                params.put("giveaway_cd",null);
                params.put("order_user_id",userInfo.get("usr_id"));
                params.put("order_no",null);
                Map<String,Object> latestDelivery = deliveryDAO.getDeliveryLatest(params);
                model.addAttribute("userInfo",userInfo );
                model.addAttribute("latestDelivery",latestDelivery );
            }

            model.addAttribute("postUrl","/SaveDeliveInfo" );
            model.addAttribute("detail",detail );
            model.addAttribute("style","mypage-4-1-1");
            model.addAttribute("order_no",order_no);

        }catch (Exception e){
            e.printStackTrace();
        }
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/mypage-4-1-1";
        } else {
            return "product/productpayment";
        }
    }
    //배송비
    public Integer deliveryPayment( Map<String,Object> params)throws IOException {
        Integer deliveryPayment=0;
        try{
            //배송방법이 없으면 입력값 고정 출력
            if(params.get("delivery_class").equals("F") ){
                deliveryPayment=0;
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
            String delivery_payment_class = (String) params.get("delivery_payment_class");
            Integer product_payment = Integer.parseInt((String)params.get("product_payment"));
            Integer product_kg = Integer.parseInt((String)params.get("product_kg"));
            Integer payment_order_quantity = Integer.parseInt((String)params.get("payment_order_quantity"));
            if ("T".equals(delivery_payment_class)) {
                deliveryPayment=0;
            } else if ("R".equals(delivery_payment_class)) {
                deliveryPayment = Integer.parseInt(splitDeliveryPaymentString);
            } else if ("M".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeM = splitDeliveryPaymentString.split("\\|");
                if(product_payment>=Integer.parseInt(splitDeliveryTypeM[0])){
                    deliveryPayment = Integer.parseInt(splitDeliveryTypeM[1]);
                }
            } else if ("D".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeD = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeD.length; i++) {
                    if(product_payment >= Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0]) && product_payment > Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2]);
                    }
                }
            } else if ("W".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeW = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeW.length; i++) {
                    if(product_kg >= Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0]) && product_kg > Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2]);
                    }
                }

            } else if ("C".equals(delivery_payment_class)) {
                String[] splitDeliveryTypeC = splitDeliveryPaymentString.split("\\//");

                for (int i = 0; i < splitDeliveryTypeC.length; i++) {
                    if(payment_order_quantity >= Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0]) && payment_order_quantity > Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1]) ){
                        deliveryPayment += Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2]);
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return deliveryPayment;
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
        String delivery_payment_class = (String) params.get("delivery_payment_class");
        if ("T".equals(delivery_payment_class)) {
            params.put("delivery_payment", "배송비 무료");
        } else if ("R".equals(delivery_payment_class)) {
            params.put("delivery_payment", "배송비 " + String.format("%,d", Integer.parseInt(splitDeliveryPaymentString)) + "원");
        } else if ("M".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeM = splitDeliveryPaymentString.split("\\|");
            params.put("delivery_payment", "결재금액 "
                    + String.format("%,d", Integer.parseInt(splitDeliveryTypeM[0])) + "원 이하 / 배송비"
                    + String.format("%,d", Integer.parseInt(splitDeliveryTypeM[1])) + " 원");
        } else if ("D".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeD = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeD.length; i++) {
                deliveryPutString += "결재금액 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[0])) + "원 ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[1])) + "원 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeD[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        } else if ("W".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeW = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeW.length; i++) {
                deliveryPutString += ""
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[0])) + "kg ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[1])) + "kg 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeW[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        } else if ("C".equals(delivery_payment_class)) {
            String[] splitDeliveryTypeC = splitDeliveryPaymentString.split("\\//");

            for (int i = 0; i < splitDeliveryTypeC.length; i++) {
                deliveryPutString += ""
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[0])) + "ea ~ "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[1])) + "ea 미만 / 배송비 "
                        + String.format("%,d", Integer.parseInt(splitDeliveryTypeC[i].split("\\|")[2])) + "원</br>";
            }
            params.put("delivery_payment", deliveryPutString);
        }
        return params;
    }
    //옵션
    public String getOption(HashMap params)throws Exception{
        String outText="";
        try{
//            String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
//             .replaceAll(" " , "")
//             .replaceAll("\\p{Z}", "")
//             .replaceAll(match, "")
            String product_option_style = (String) params.get("product_option_style");
            String splitString = (String) params.get("product_option_input");//배송방법
            String[] splitStyleArray =product_option_style.split("\\,");
            String[] splitArray =splitString.split("\\/\\/");

            if(splitArray.length > 0){
                outText += "" +
                        "<div class=\"goods-point-row\">\n" +
                        "   <div class=\"point-title\">옵션선택</div>\n" +
                        "</div>";
                outText += "" +
                        "<div class=\"goods-point-row\">\n" +
                        "   <div class=\"point-title\">&nbsp;</div>\n" +
                        "</div>";
            }
            for(int z=0;z < splitArray.length;z++){

                String[] splitNextArray =splitArray[z]
                        .split("\\{");
                String[] splitThirdArray = splitNextArray[1]
                        .replaceAll("\\}", "")
                        .split("\\|");
                if(splitStyleArray[z].equals("P") || splitStyleArray[z].isEmpty()){
                    outText += "" +
                            "<select name=\"select_option_value\" class=\"option-box width-100 my-1\">"
                            + "<option selected>옵션 선택</option>";
                    //오션스타일 에따라 다르게
                    for (int i = 0; i < splitThirdArray.length; i++) {
                        outText += "" +
                                "   <option value=\""+splitThirdArray[i]+"\">"+splitThirdArray[i]+"</option>\n";
                    }
                    outText += "" +
                            "</select>";
                }
                if(splitStyleArray[z].equals("B")){
                    outText += "" +
                            "<div class=\"option-box2 mb-1\">" +
                            "<div class=\"point-title text-gray\">" + splitNextArray[0] + " 선택 </div>\n" +
                            "<div class=\"optionBtn-wrap\">\n";

                    for (int i = 0; i < splitThirdArray.length; i++) {
                        outText += ""  +
                                "   <button type=\"button\" class=\"optionBtn\" >"+splitThirdArray[i]+"</button>";
                    }
                    outText += "" +
                                "</div>\n" +
                            " </div>";
                }
                if(splitStyleArray[z].equals("R")){
                    outText += "" +
                            "<div class=\"option-box2 mb-1\">" +
                            " <div class=\"point-title text-gray\">" +
                            ""+splitNextArray[0]+" 선택 </div>"
                            + "<div class=\"optionBtn-wrap\">\n";

                    for (int i = 0; i < splitThirdArray.length; i++) {
                        outText += "" +
                            "<input type=\"radio\" id=\"rdOption"+i+"\" name=\"rdOption\"><label for=\"rdOption"+i+"\" class=\"ra-icon\">"+splitThirdArray[i]+"</label>";
                    }
                    outText += "" +
                                "</div></div>\n" ;
                }
            }



        }catch (Exception e){
            e.printStackTrace();
        }
        return outText;
    }

}

