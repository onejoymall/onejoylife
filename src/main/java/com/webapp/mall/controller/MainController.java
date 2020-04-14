package com.webapp.mall.controller;

//import com.sun.org.apache.xerces.internal.xs.datatypes.ObjectList;
import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.mall.dao.CartDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.TodayVO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.ConfigDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.*;

import static org.springframework.util.CollectionUtils.isEmpty;
@Controller
@RequestMapping("/")
public class MainController {
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    CartDAO cartDAO;
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    ConfigDAO configDAO;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    public String mallMain(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, GiveawayVO giveawayVO) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        try{
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("login");
//            param.put("USR_ID","") //사용자조회시 사용
//            userList = userDAO.getUserList(params);

            model.addAttribute("style", "index");
            model.addAttribute("footerScript", "main");
            model.addAttribute("loginStatus",obj);


            searchVO.setProduct_sale_yn("Y");
            searchVO.setProduct_use_yn("Y");

            //경품목록

            giveawayVO.setDisplayRowCount(3);
            giveawayVO.setStaticRowEnd(3);
            giveawayVO.pageCalculate(giveawayDAO.getGiveawayListCount(giveawayVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = giveawayDAO.getGiveawayList(giveawayVO);
            model.addAttribute("giveawaylist", list);

            //상품목록

            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);

            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            searchVO.setProduct_sale_yn("Y");
            List<Map<String,Object>> productList = productDAO.getProductList(searchVO);
            model.addAttribute("productList", productList);
            model.addAttribute("searchVO", searchVO);

            //특가 상품목록
            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);

            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            searchVO.setProduct_sale_yn("Y");
            searchVO.setMainViewType("product_sp_class");
            List<Map<String,Object>> productSpList = productDAO.getProductList(searchVO);
            model.addAttribute("productSpList", productSpList);
            model.addAttribute("searchVO", searchVO);


            //카테고리 목록
            params.put("pd_category_main_view","Y");
            params.put("limit",12);
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            model.addAttribute("categoryList",categoryList);

            //기획전 목록 1
            params.put("pd_category_event_use_yn","Y");
            //몇번째부터 몇개
            params.put("limitTo",0);
            params.put("limitBe",2);
            params.put("pd_category_event_end","now()");
            List<Map<String,Object>> categoryEventList = categoryDAO.getCategoryEventList(params);
            model.addAttribute("categoryEventList",categoryEventList);

            //기획전 목록 2
            params.put("pd_category_event_use_yn","Y");
            //몇번째부터 몇개
            params.put("limitTo",2);
            params.put("limitBe",3);
            params.put("pd_category_event_end","now()");
            List<Map<String,Object>> categoryEventListSub = categoryDAO.getCategoryEventList(params);
            model.addAttribute("categoryEventListSub",categoryEventListSub);

            //매인 배너
            params.put("pd_category_event_use_yn","");
            params.put("banner_use_yn","Y");
            //몇번째부터 몇개
            params.put("limitTo",0);
            params.put("limitBe",3);
            params.put("pd_category_event_end","");
            List<Map<String,Object>> categoryBannerList = categoryDAO.getCategoryEventList(params);
            model.addAttribute("categoryBannerList",categoryBannerList);

            params.put("market_config_code","info-main");
            Map<String,Object> configMain = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain", configMain);
            params.put("market_config_code","info-privacy");
            Map<String,Object> configMain2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy", configMain2);
            //공지사항
            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used("8");
            searchVO.setBgno("8");
            searchVO.setDisplayRowCount(4);
            searchVO.setStaticRowEnd(4);
            searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

            List<?> listview  = boardSvc.selectBoardList(searchVO);

            model.addAttribute("noticeListView", listview);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("bgInfo", bgInfo);

        }catch(Exception e){
            e.printStackTrace();
        }
        return "mall/main";
    }
    @RequestMapping(value = "/layout/mainTopNav")
    public String mainTopNav(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session, TodayVO todayVO) throws Exception{
        try{
            // 카테고리 출력
            params.put("pd_category_upper_code","T");
            params.put("pd_category_main_view","Y");
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            params.put("pd_category_upper_code",null);
            List<Map<String,Object>> subList = categoryDAO.getCategorySubList(params);
            List<Map<String,Object>> thirdList = categoryDAO.getCategoryThirdList(params);
            model.addAttribute("categoryList",categoryList);
            model.addAttribute("subList",subList);
            model.addAttribute("thirdList",thirdList);

            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);

            if(isEmpty(userInfo)){
                params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("cart_user_id",userInfo.get("usr_id"));
            }

            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getCartListCount(params));

            //오늘 본 상품 출력시 적용
            if(isEmpty((List<String>)session.getAttribute("today"))){

            }else{
                todayVO.setProduct_cd_array((List<String>)session.getAttribute("today"));
                List<Map<String,Object>> todayList = productDAO.getProductTodayList(todayVO);
                model.addAttribute("todayList", todayList);
            }

//            todayVO.setProduct_cd_array(new String[]{"string1"});


            model.addAttribute("searchVO", searchVO);

        }catch (Exception e){
            e.printStackTrace();
        }
        return "layout/mainTopNav";
    }
    @RequestMapping(value = "/mall/today", method = RequestMethod.GET, produces = "application/json")
    public String mallTody(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        try{

            //카테고리 목록
            params.put("pd_category_main_view","Y");
            params.put("pd_category_main_view_sp","Y");
//            params.put("limit",12);
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            model.addAttribute("categoryList",categoryList);



            //특가 상품목록
            if(searchVO.getDisplayRowCount()==null || searchVO.getDisplayRowCount() < 16){
                searchVO.setDisplayRowCount(16);
            }
            if(searchVO.getOrderByValue()==null || searchVO.getOrderByKey()==null){
                searchVO.setOrderByKey("product_id");
                searchVO.setOrderByValue("DESC");
            }
            searchVO.setProduct_sale_yn("Y");
            searchVO.setMainViewType("product_sp_class");
            searchVO.setPd_category_id(searchVO.getProduct_ct());
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> productSpList = productDAO.getProductList(searchVO);
            model.addAttribute("list", productSpList);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("style", "today-sale");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "mall/today";
    }
    @RequestMapping(value = "/mall/live-shopping", method = RequestMethod.GET, produces = "application/json")
    public String mallLiveShopping(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        try{

            //카테고리 목록
            params.put("pd_category_main_view","Y");
//            params.put("limit",12);
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            model.addAttribute("categoryList",categoryList);



            //특가 상품목록
            if(searchVO.getDisplayRowCount()==null){
                searchVO.setDisplayRowCount(16);
            }
            searchVO.setProduct_sale_yn("Y");
            searchVO.setMainViewType("product_sp_class");
            searchVO.setPd_category_id(searchVO.getProduct_ct());
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> productSpList = productDAO.getProductList(searchVO);
            model.addAttribute("list", productSpList);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("style", "live-shopping");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "mall/live-shopping";
    }
    //라이브 쇼핑 상세
    @RequestMapping(value = "/mall/live-view")
    public String mallLiveShoppingView(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{
            Map<String,Object> list = productDAO.getProductViewDetail(params);
            model.addAttribute("style","live-view");
            model.addAttribute("list",list);
            //배송정보
            params.put("delivery_class",list.get("product_delivery_class"));
            //배송밥법
            params.put("delivery_type",list.get("product_delivery_type"));
            //배송비구분
            params.put("delivery_payment_class",list.get("product_delivery_payment_class"));
            //배송비 구분별 값
            params.put("delivery_payment",list.get("product_delivery_payment"));
//            Map<String,Object> delivery = giveawayDelivery(params);

//            model.addAttribute("delivery",delivery);
//            model.addAttribute("delivery_type_list", delivery.get("selector"));
//            model.addAttribute("productList",productList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mall/live-view";
    }
    //modal
    @RequestMapping(value = "/layout/modal", method = RequestMethod.GET, produces = "application/json")
    public String mallModal(@RequestParam HashMap params, ModelMap model) throws Exception {

        try{

            params.put("market_config_code","info-main");
            Map<String,Object> configMain = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain", configMain);
            params.put("market_config_code","info-privacy");
            Map<String,Object> configMain2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy", configMain2);

        }catch(Exception e){
            e.printStackTrace();
        }
        return "layout/modal";
    }
}
