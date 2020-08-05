package com.webapp.mall.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webapp.mall.dao.*;
import com.webapp.manager.vo.CompanyInfoVO;
import com.webapp.manager.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import com.sun.org.apache.xerces.internal.xs.datatypes.ObjectList;
import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardSvc;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.TodayVO;
import com.webapp.manager.dao.BannerDAO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.CompanyInfoDAO;
import com.webapp.manager.dao.ConfigDAO;
@Controller
@RequestMapping("/")
public class MainController {
    @Autowired
    private MainPageDAO mainPageDAO;
	@Autowired
    private NumberGender numberGender;
	@Autowired
	private PaymentDAO paymentDAO;
    @Autowired
    private GiveawayDAO giveawayDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private BannerDAO bannerDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private BoardSvc boardSvc;
    @Autowired
    private ConfigDAO configDAO;
    @Autowired
    private BoardGroupSvc boardGroupSvc;
    @Autowired
    private CompanyInfoDAO companyInfoDAO;
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    public String mallMain(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, GiveawayVO giveawayVO, BoardVO boardVO, ProductVO productVO) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();

        Device device = DeviceUtils.getCurrentDevice(request);
        try{
            HttpSession session = request.getSession();

            //회원전용상품 노출
            Object obj = session.getAttribute("login");
            if(obj!=null){
                if((Boolean)obj){
                    searchVO.setProduct_use_member_yn(null);
                }
            }else{
                searchVO.setProduct_use_member_yn("N");
            }
//            param.put("USR_ID","") //사용자조회시 사용
//            userList = userDAO.getUserList(params);

            model.addAttribute("style", "index");
            model.addAttribute("footerScript", "main");
            model.addAttribute("loginStatus",obj);


            searchVO.setProduct_sale_yn("Y");
            searchVO.setProduct_use_yn("Y");
            searchVO.setProduct_approval_yn("Y");

            //경품목록
            if(device.isMobile()){
                giveawayVO.setDisplayRowCount(4);
            } else {
                giveawayVO.setDisplayRowCount(3);
            }
            giveawayVO.setParti_rate(1);
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = mainPageDAO.getMainGiveawayList(giveawayVO);

            model.addAttribute("giveawaylist", list);

            //상품공통
            productVO.setProduct_use_yn("Y");
            productVO.setProduct_sale_yn("Y");
            productVO.setProduct_approval_yn("Y");

            //카테고리 상품목록
            productVO.setDisplayRowCount(8);
            List<Map<String,Object>> productList = mainPageDAO.getMainProductList(productVO);
            model.addAttribute("productList", productList);

            //MD추천 상품목록
            productVO.setDisplayRowCount(8);
            productVO.setMainViewType("product_md_class");//추천 영역 노출여부
            List<Map<String,Object>> productMDList = mainPageDAO.getMainProductList(productVO);
            model.addAttribute("productMDList", productMDList);
            
            //신상품 상품목록
            productVO.setDisplayRowCount(8);
            searchVO.setMainViewType("product_new_class");
            List<Map<String,Object>> productNewList = mainPageDAO.getMainProductList(productVO);
            model.addAttribute("productNewList", productNewList);
            
            //인기상품 상품목록
            productVO.setDisplayRowCount(8);

            productVO.setOrderByKey("sales_count");
            productVO.setOrderByValue("DESC");
            productVO.setMainViewType(null);
            List<Map<String,Object>> productPopularList = mainPageDAO.getMainProductList(productVO);
            model.addAttribute("productPopularList", productPopularList);


            //특가 상품목록
            productVO.setDisplayRowCount(8);
            productVO.setOrderByKey(null);
            productVO.setMainViewType("product_sp_class");
            List<Map<String,Object>> productSpList = mainPageDAO.getMainProductList(productVO);
            model.addAttribute("productSpList", productSpList);

            //카테고리 목록
            params.put("pd_category_main_view","Y");
            params.put("limit",12);
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            model.addAttribute("categoryList",categoryList);

            //기획전 목록 1
            params.put("pd_category_event_use_yn","Y");
            //몇번째부터 몇개
            params.put("limitTo",0);
            params.put("limitBe",3);
            params.put("pd_category_event_end","now()");
            List<Map<String,Object>> categoryEventList = categoryDAO.getCategoryEventList(params);
            model.addAttribute("categoryEventList",categoryEventList);

            //기획전 목록 2
            params.put("pd_category_event_use_yn","Y");
            //몇번째부터 몇개
            params.put("limitTo",3);
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

            //서브배너
            params.put("banner_type","main_sub");
            List<Map<String,Object>> bannerList = bannerDAO.getBannerList(params);
            for(Map<String,Object> banner:bannerList) {
            	if("H".equals(banner.get("banner_event_type"))) {
            		banner.put("url",banner.get("banner_href"));
            	}else if("P".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product/productDetail?product_cd="+banner.get("banner_product_cd"));
            	}else if("C".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product?product_ct="+banner.get("banner_product_ct"));
            	}
            }
            model.addAttribute("subSlider", bannerList);

            //경품띠배너
            params.put("banner_type","main_giveaway_line");
            List<Map<String,Object>> giveawayLineBannerList = bannerDAO.getBannerList(params);
            for(Map<String,Object> banner:giveawayLineBannerList) {
            	if("H".equals(banner.get("banner_event_type"))) {
            		banner.put("url",banner.get("banner_href"));
            	}else if("P".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product/productDetail?product_cd="+banner.get("banner_product_cd"));
            	}else if("C".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product?product_ct="+banner.get("banner_product_ct"));
            	}
            }
            model.addAttribute("giveawayLineBanner", giveawayLineBannerList.get(0));
            
            //띠배너
            params.put("banner_type","main_line");
            List<Map<String,Object>> lineBannerList = bannerDAO.getBannerList(params);
            for(Map<String,Object> banner:lineBannerList) {
            	if("H".equals(banner.get("banner_event_type"))) {
            		banner.put("url",banner.get("banner_href"));
            	}else if("P".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product/productDetail?product_cd="+banner.get("banner_product_cd"));
            	}else if("C".equals(banner.get("banner_event_type"))) {
            		banner.put("url","/product?product_ct="+banner.get("banner_product_ct"));
            	}
            }
            model.addAttribute("lineBannerList1", lineBannerList.get(0));
            model.addAttribute("lineBannerList2", lineBannerList.get(1));
            model.addAttribute("lineBannerList3", lineBannerList.get(2));
            model.addAttribute("lineBannerList4", lineBannerList.get(3));
            model.addAttribute("lineBannerList5", lineBannerList.get(4));
            model.addAttribute("lineBannerList6", lineBannerList.get(5));
            model.addAttribute("lineBannerList7", lineBannerList.get(6));
            
            //이벤트 목록
            params.put("pd_category_event_use_yn","");
            params.put("banner_use_yn","");
            params.put("event_use_yn","Y");
            params.put("limitTo",0);
            params.put("limitBe",4);
            List<Map<String,Object>> eventList = categoryDAO.getCategoryEventList(params);
            model.addAttribute("eventList",eventList);

            params.put("market_config_code","info-main");
            Map<String,Object> configMain = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain", configMain);
            params.put("market_config_code","info-privacy");
            Map<String,Object> configMain2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy", configMain2);
            //공지사항
            BoardGroupVO bgInfo = boardGroupSvc.selectBoardGroupOne4Used("8");
            boardVO.setBgno("8");
            boardVO.setDisplayRowCount(4);
            boardVO.setStaticRowEnd(4);
            boardVO.pageCalculate( boardSvc.selectBoardCount(boardVO) ); // startRow, endRow

            List<?> listview  = boardSvc.selectBoardList(boardVO);

            model.addAttribute("noticeListView", listview);
            model.addAttribute("searchVO", boardVO);
            model.addAttribute("bgInfo", bgInfo);

        }catch(Exception e){
            e.printStackTrace();
        }

        if(device.isMobile()){
            return "mobile/index-mobile";
        } else {
            return "mall/main";
        }
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
            	String cart_user_id = numberGender.numberGen(6,1);
            	if ( session.getAttribute("nonMembersUserId") == null ){
            		session.setAttribute("nonMembersUserId",cart_user_id);
            	}
            	params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
            }else{
                params.put("cart_user_id",userInfo.get("usr_id"));
            }
            if(session.getAttribute("locale") == null) {
    			session.setAttribute("locale", "ko");
    		}

            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getTopCartListCount(params));

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
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/layout/footer-left-Nav";
        } else {
            return "layout/mainTopNav";
        }
    }
    
    
    @RequestMapping(value = "/layout/footer")
    public String footer(ModelMap model, HttpServletRequest request,  HttpSession session,CompanyInfoVO companyInfoVO) throws Exception{
        try{
        	 Map<String,Object> info = companyInfoDAO.getCompanyInfo(companyInfoVO);
            model.addAttribute("info", info);
        }catch (Exception e){
            e.printStackTrace();
        }
        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/layout/footer";
        } else {
            return "layout/footer";
        }
    }
    
    @RequestMapping(value = "/layout/scrollRight")
    public String scrollRight(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session, TodayVO todayVO) throws Exception{
        try{
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getTopCartListCount(params));

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

            return "layout/scrollRight";
    }
    @RequestMapping(value = "/mobile/layout/main-header")
    public String MmainTopNav(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session, TodayVO todayVO) throws Exception{
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
            searchVO.pageCalculate(cartDAO.getTopCartListCount(params));

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
        return "mobile/layout/main-header";

    }
    @RequestMapping(value = "/mobile/layout/sub-header")
    public String MsubTopNav(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, SearchVO searchVO, HttpSession session, TodayVO todayVO) throws Exception{
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
                params.put("payment_user_id",userInfo.get("usr_id"));
            }
            //배송현황 카운트
            Map<String,Object> paymentCnt = paymentDAO.getUserPaymentStatusCount(params);
            model.addAttribute("paymentCnt", paymentCnt);
            
            searchVO.setDisplayRowCount(5);
            searchVO.setStaticRowEnd(5);
            searchVO.pageCalculate(cartDAO.getTopCartListCount(params));

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
        return "mobile/layout/sub-header";

    }

    @RequestMapping(value = "/mall/today", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
    public String mallTody(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();
        Device device = DeviceUtils.getCurrentDevice(request);
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
            if(device.isMobile()){
                searchVO.setDisplayRowCount(16);
                //표시항 페이징 수
                searchVO.setDisplayPagingCount(5);
            }
            if(searchVO.getOrderByValue()==null || searchVO.getOrderByKey()==null){
                searchVO.setOrderByKey("product_id");
                searchVO.setOrderByValue("DESC");
            }
            searchVO.setProduct_sale_yn("Y");
            searchVO.setProduct_use_yn("Y");
            searchVO.setProduct_approval_yn("Y");
            searchVO.setMainViewType("product_sp_class");
            if(searchVO.getProduct_ct()!=null){
                searchVO.setPd_category_id(Integer.parseInt(searchVO.getProduct_ct()));
            }

            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> productSpList = productDAO.getProductList(searchVO);
            model.addAttribute("list", productSpList);
            model.addAttribute("searchVO", searchVO);
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "today-sale");

        if(device.isMobile()){
            return "mobile/today";
        } else {
            return "mall/today";
        }
    }
    //이벤트 리스트
    @RequestMapping(value="/mall/eventList")
    public String eventList(Model model, HttpSession session, HashMap params, SearchVO searchVO, HttpServletRequest request) throws Exception {
        Device device = DeviceUtils.getCurrentDevice(request);
        try{
            if(searchVO.getDisplayRowCount()==null || searchVO.getDisplayRowCount() < 12){
                searchVO.setDisplayRowCount(12);
            }
            if(device.isMobile()){
                searchVO.setDisplayRowCount(1000);
            }
            searchVO.pageCalculate(categoryDAO.getCategoryListCount(searchVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());

            //카테고리 목록
            params.put("pd_category_event_use_yn","");
            params.put("banner_use_yn","");
            params.put("event_use_yn","Y");
//            params.put("limit",12);

            List<Map<String,Object>> eventList = categoryDAO.getCategoryEventList(params);
            Map<String,Object> categoryRowData = categoryDAO.getCategoryDetail(searchVO);
            model.addAttribute("eventList",eventList);
            model.addAttribute("categoryRowData",categoryRowData);
            model.addAttribute("searchVO", searchVO);

        }catch (Exception e){
            e.printStackTrace();
        }


        if(device.isMobile()){
            model.addAttribute("style", "index");
            return "mobile/eventList";
        } else {
            model.addAttribute("style", "category-sub");
            return "mall/eventList";
        }
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
            searchVO.setPd_category_id(Integer.parseInt(searchVO.getProduct_ct()));
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
            Map<String,Object> infoMain = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain", infoMain);
            params.put("market_config_code","info-privacy");
            Map<String,Object> infoPrivacy = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy", infoPrivacy);
            params.put("market_config_code","info-join");
            Map<String,Object> infoJoin = configDAO.getConfigDetail(params);
            model.addAttribute("infoJoin", infoJoin);
            params.put("market_config_code","info-main2");
            Map<String,Object> infoMain2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain2", infoMain2);
            params.put("market_config_code","info-privacy2");
            Map<String,Object> infoPrivacy2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy2", infoPrivacy2);
            params.put("market_config_code","info-privacy3");
            Map<String,Object> infoPrivacy3 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy3", infoPrivacy3);

        }catch(Exception e){
            e.printStackTrace();
        }
        return "layout/modal";
    }

    //modal
    @RequestMapping(value = "/mobile/layout/m_modal", method = RequestMethod.GET, produces = "application/json")
    public String m_Modal(@RequestParam HashMap params, ModelMap model) throws Exception {

        try{

            params.put("market_config_code","info-main");
            Map<String,Object> infoMain = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain", infoMain);
            params.put("market_config_code","info-privacy");
            Map<String,Object> infoPrivacy = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy", infoPrivacy);
            params.put("market_config_code","info-join");
            Map<String,Object> infoJoin = configDAO.getConfigDetail(params);
            model.addAttribute("infoJoin", infoJoin);
            params.put("market_config_code","info-main2");
            Map<String,Object> infoMain2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoMain2", infoMain2);
            params.put("market_config_code","info-privacy2");
            Map<String,Object> infoPrivacy2 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy2", infoPrivacy2);
            params.put("market_config_code","info-privacy3");
            Map<String,Object> infoPrivacy3 = configDAO.getConfigDetail(params);
            model.addAttribute("infoPrivacy3", infoPrivacy3);

        }catch(Exception e){
            e.printStackTrace();
        }
        return "mobile/layout/m_modal";
    }

}