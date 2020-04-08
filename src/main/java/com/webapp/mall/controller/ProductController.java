package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.TodayVO;
import com.webapp.manager.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.Contended;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public String ProductDetail(@RequestParam HashMap params, ModelMap model, SearchVO searchVO, HttpSession session, TodayVO todayVO) throws Exception {
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
            params.put("user_id", userInfo.get("usr_id"));

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
        return "product/productdetail";
    }
    //결제
    @RequestMapping(value = "/product/productPayment")
    public String productPayment(@RequestParam HashMap params, ModelMap model, HttpServletRequest request,HttpSession session) throws Exception{
        params.put("email",session.getAttribute("email"));
        try{
            String order_no = "PD-ORDER-"+numberGender.numberGen(6,1);
            Map<String, Object> userInfo = userDAO.getLoginUserList(params);
            params.put("product_cd",request.getParameter("product_cd"));
            Map<String,Object> detail = productDAO.getProductViewDetail(params);
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
        return "product/productpayment";
    }
    //배송정보 출력
    public Map<String ,Object> giveawayDelivery(HashMap params)throws Exception {

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
    //옵션
    public String getOption(HashMap params)throws Exception{
        String outText="";
        try{
//            String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
//             .replaceAll(" " , "")
//             .replaceAll("\\p{Z}", "")
//             .replaceAll(match, "")

            String splitString = (String) params.get("product_option_input");//배송방법
            String[] splitArray =splitString.split("\\/\\/");
            for(int z=0;z < splitArray.length;z++){
                String[] splitNextArray =splitArray[z]
                        .split("\\{");
                String[] splitThirdArray = splitNextArray[1]
                        .replaceAll("\\}", "")
                        .split("\\|");
                outText += "" +
                        "<div class=\"option-box\">\n" +
                        "    <button type=\"button\">\n" +
                        "        "+splitNextArray[0]+" 선택\n" +
                        "        <i class=\"arrow-down\"></i>\n" +
                        "    </button>\n" +
                        "    <ul class=\"option-list\">\n" ;
                //오션스타일 에따라 다르게
                for (int i = 0; i < splitThirdArray.length; i++) {
                    outText += "" +

                            "   <li><a href=\"#none\">"+splitThirdArray[i]+"</a></li>\n";

                }
                outText += "" +

                        "    </ul>\n" +
                        "</div>";
            }



        }catch (Exception e){

        }
        return outText;
    }

}

