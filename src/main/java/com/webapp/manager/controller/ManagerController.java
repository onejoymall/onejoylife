package com.webapp.manager.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.common.SearchVO;
import com.webapp.board.common.TreeMaker;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.dao.RefundDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.QnaVO;
import com.webapp.manager.dao.BannerDAO;
import com.webapp.manager.dao.CalculateCompanyDAO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.CompanyInfoDAO;
import com.webapp.manager.dao.ConfigDAO;
import com.webapp.manager.dao.DefinitionDAO;
import com.webapp.manager.dao.MgBrandDAO;
import com.webapp.manager.dao.MgCouponDAO;
import com.webapp.manager.dao.MgOptionDAO;
import com.webapp.manager.dao.MgPointDAO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.dao.MgReviewDAO;
import com.webapp.manager.dao.MgSalesDAO;
import com.webapp.manager.dao.MgStoreDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.dao.MgUserDAO;
import com.webapp.manager.dao.MgUserGrantDAO;
import com.webapp.manager.dao.QnaDAO;
import com.webapp.manager.dao.StoreInfoDAO;
import com.webapp.manager.vo.CalculateCompanyVO;
import com.webapp.manager.vo.CompanyInfoVO;
import com.webapp.manager.vo.MgBrandVO;
import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.MgOptionVO;
import com.webapp.manager.vo.MgPointVO;
import com.webapp.manager.vo.MgUserVO;
import com.webapp.manager.vo.StoreVO;

@Controller
public class ManagerController {
    @Autowired
    QnaDAO qnaDAO;
    @Autowired
    DefinitionDAO definitionDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    DeliveryDAO deliveryDAO;
    @Autowired
    private MgProductDAO mgProductDAO;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private ConfigDAO configDAO;
    @Autowired
    private MgStoreDAO mgStoreDAO;
    @Autowired
    private BannerDAO bannerDAO;
    @Autowired
    private BoardGroupSvc boardSvc;
    @Autowired
    private PaymentDAO paymentDAO;
    @Autowired
    private RefundDAO refundDAO;
    @Autowired
    private MgUserDAO mgUserDAO;
    @Autowired
    private MgUserGrantDAO mgUserGrantDAO;
    @Autowired
    private MgPointDAO mgPointDAO;
    @Autowired
    private MgOptionDAO mgOptionDAO;
    @Autowired
    private MgSalesDAO mgSalesDAO;
    @Autowired
    private MgSystemDAO mgSystemDAO;
    @Autowired
    private MgReviewDAO mgReviewDAO;
    @Autowired
    private MgBrandDAO mgBrandDAO;
    @Autowired
    private MgCouponDAO mgCouponDAO;
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private CompanyInfoDAO companyInfoDAO;
    @Autowired
    private StoreInfoDAO storeInfoDAO;
  @Autowired
    private CalculateCompanyDAO calculateCompanyDAO;
    
        
    /**
     *  리스트.
     */
    @RequestMapping(value = "/Manager/boardGroupList")
    public String boardList(ModelMap model) {
        List<?> listview   = boardSvc.selectBoardGroupList();

        TreeMaker tm = new TreeMaker();
        String treeStr = tm.makeTreeByHierarchy(listview);
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("treeStr", treeStr);

        return "board/BoardGroupList";
    }

    /**
     *  게시판 그룹 쓰기.
     */
    @RequestMapping(value = "/Manager/boardGroupSave")
    public void boardSave(HttpServletResponse response, BoardGroupVO bgInfo) {

        boardSvc.insertBoard(bgInfo);

        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=UTF-8");

        try {
            response.getWriter().print( mapper.writeValueAsString(bgInfo));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    /**
     *  게시판 그룹 읽기.
     */
    @RequestMapping(value = "/Manager/boardGroupRead")
    public void boardRead(HttpServletRequest request, HttpServletResponse response) {

        String bgno = request.getParameter("bgno");

        BoardGroupVO bgInfo = boardSvc.selectBoardGroupOne(bgno);

        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=UTF-8");

        try {
            response.getWriter().print( mapper.writeValueAsString(bgInfo));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    /**
     *  게시판 그룹 삭제.
     */
    @RequestMapping(value = "/Manager/boardGroupDelete")
    public void boardDelete(HttpServletRequest request, HttpServletResponse response) {

        String bgno = request.getParameter("bgno");

        boardSvc.deleteBoardGroup(bgno);

        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=UTF-8");

        try {
            response.getWriter().print( mapper.writeValueAsString("OK"));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    //상품관리
    @RequestMapping(value = "/Manager/Product")
    public String managerProduct(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, ModelMap model, SearchVO searchVO,MgOptionVO mgOptionVO, HttpSession session) throws Exception {

        try {
            if(searchVO.getDisplayRowCount()==null){
                searchVO.setDisplayRowCount(10);
            }

            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            
            Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
        	if(!adminLogin.equals("admin")){
        		searchVO.setStore_id(email);
    		}
            searchVO.pageCalculate(productDAO.getMgProductListCount(searchVO));
            params.put("rowStart", searchVO.getRowStart());
            params.put("staticRowEnd", searchVO.getStaticRowEnd());
            params.put("searchTypeArr", searchVO.getSearchTypeArr());
            List<Map<String, Object>> productList = productDAO.getMgProductList(searchVO);

            deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            //택배사목록
            Map<String, Object> companylist = CurlPost.curlPostFn(
                deliveryInfoVO.getDelivery_t_url()
                        +"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
                "",
                "",
                "get"
            );
            List<Map<String,Object>> company = (List)companylist.get("Company");
            if(!isEmpty(company)){
                deliveryDAO.insertDeliveryCompany(company);
            }
            List<Map<String,Object>> resultCompay = deliveryDAO.getDeliveryCompanyList(params);
            model.addAttribute("companyList", resultCompay);

            model.addAttribute("productList", productList);
//            model.addAttribute("companyList", company);
            model.addAttribute("table_name", "product");
            model.addAttribute("Pk", "product_id");
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods");
            model.addAttribute("searchVO",searchVO);
            model.addAttribute("params",params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/product/index";
    }

    @RequestMapping(value = "/Manager/ProductDetail")
    public String managerProductDetail(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods-add");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/product/productDetail";
    }

    @RequestMapping(value = "/Manager/Category")
    public String managerCategory(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,HttpSession session) throws Exception {
        try {
        	Object adminLogin = session.getAttribute("adminLogin");
            String email = (String)session.getAttribute("email");
            
            List<Map<String, Object>> list = null;
    		List<Map<String, Object>> subList = null;
    		List<Map<String, Object>> thirdList = null;
        	if(adminLogin.equals("admin")){
        		params.put("pd_category_upper_code", "T");
                list = categoryDAO.getCategoryList(params);
                params.put("pd_category_upper_code", null);
                subList = categoryDAO.getCategorySubList(params);
                thirdList = categoryDAO.getCategoryThirdList(params);
    		}else {
    			params.put("store_login", "Y");
                list = categoryDAO.getCategoryList(params);
                params.put("store_login", null);
                params.put("store_id", email);
                subList = categoryDAO.getCategoryList(params);
                thirdList = categoryDAO.getCategoryList(params);
    		}
        	
        	searchVO.setDisplayRowCount(10);
        	searchVO.setStaticRowEnd(10); 
        	params.put("searchTypeArr",searchVO.getSearchTypeArr());
    		searchVO.pageCalculate(categoryDAO.getEventApprovalListCount(params));
    		params.put("displayRowCount", searchVO.getDisplayRowCount());
    		params.put("rowStart", searchVO.getRowStart());
    		params.put("searchTypeArr",searchVO.getSearchTypeArr());
    		List<Map<String, Object>> eventApprovalList = categoryDAO.getEventApprovalList(params);
    		
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("eventApprovalList", eventApprovalList);
            
            model.addAttribute("list", list);
            model.addAttribute("subList", subList);
            model.addAttribute("thirdList", thirdList);
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "category");
            model.addAttribute("postUrl", "/Manager/productCategoryDisplayProc");
            model.addAttribute("table_name", "product_category_event");
            model.addAttribute("Pk", "pd_category_id");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/manager/product/category";
    }
    
    @RequestMapping(value = "/Manager/banner")
    public String managerBanner(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
    	try {
    		params.put("pd_category_upper_code", "T");
    		List<Map<String, Object>> list = bannerDAO.getBannerList(params);
    		params.put("pd_category_upper_code", null);
    		List<Map<String, Object>> subList = categoryDAO.getCategorySubList(params);
    		List<Map<String, Object>> thirdList = categoryDAO.getCategoryThirdList(params);
    		model.addAttribute("list", list);
    		model.addAttribute("subList", subList);
    		model.addAttribute("thirdList", thirdList);
    		model.addAttribute("topNav", 1);
    		model.addAttribute("style", "category");
    		model.addAttribute("postUrl", "/Manager/productCategoryDisplayProc");
//            model.addAttribute("productList",productList);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return "/manager/banner";
    }

    //상품등록 페이지
    @RequestMapping(value = "/Manager/ProductAdd")
    public String managerProductAdd(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,DeliveryInfoVO deliveryInfoVO,MgDeliveryVO mgDeliveryVO,HttpSession session) throws Exception {
        try {
            Object adminLogin = session.getAttribute("adminLogin");
            params.put("pd_category_upper_code", "T");
            params.put("pd_category_use_yn","Y");
            if(adminLogin == "admin"){
                mgDeliveryVO.setStore_id("admin");
            }
            Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
            model.addAttribute("detail", detail);

            deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            //택배사목록
            Map<String, Object> companylist = CurlPost.curlPostFn(
                deliveryInfoVO.getDelivery_t_url()
                        +"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
                "",
                "",
                "get"
            );
            List<Map<String,Object>> company = (List)companylist.get("Company");
            if(!isEmpty(company)){
                deliveryDAO.insertDeliveryCompany(company);
            }
            List<Map<String,Object>> resultCompay = deliveryDAO.getDeliveryCompanyList(params);
            model.addAttribute("companyList", resultCompay);

            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
//            model.addAttribute("companyList",company);
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods-add");
            model.addAttribute("postUrl", "/Manager/productAddProc");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/manager/product/productAdd";
    }
    @RequestMapping(value = "/Manager/companyInfo")
    public String managerCompanyInfo(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,CompanyInfoVO companyInfoVO,HttpSession session) throws Exception {
        try {
            Map<String,Object> info = companyInfoDAO.getCompanyInfo(companyInfoVO);
            model.addAttribute("info", info);
            model.addAttribute("topNav", 10);
            model.addAttribute("style", "goods-add");
            model.addAttribute("postUrl", "/Manager/companyInfoModi");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/manager/companyInfo";
    }

    @RequestMapping(value = "/Manager/storeInfo")
    public String managerStoreInfo(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,StoreVO storeVO,HttpSession session) throws Exception {
        try {
		     // storeVO.setStore_id(storeVO.getStor8e_id());
        	
        	storeVO.setStore_id((String)session.getAttribute("email"));
			  Map<String,Object> info = storeInfoDAO.getStoreInfo(storeVO);
			  model.addAttribute("info", info);
			  model.addAttribute("topNav", 11);
			  model.addAttribute("style", "goods-add");
			  model.addAttribute("postUrl","/Manager/storeInfoModi");
			 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/manager/storeInfo";
    }
    

    @RequestMapping(value = "/Manager/Giveaway")
    public String managerGiveaway(@RequestParam HashMap params, ModelMap model, GiveawayVO searchVO) throws Exception {

        try {
            if(searchVO.getDisplayRowCount()==null){
                searchVO.setDisplayRowCount(10);
            }
//            searchVO.setStaticRowEnd(10);
            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            searchVO.pageCalculate(giveawayDAO.getGiveawayListCount(searchVO));
            params.put("rowStart", searchVO.getRowStart());
            params.put("staticRowEnd", searchVO.getStaticRowEnd());
            params.put("searchTypeArr",searchVO.getSearchTypeArr());
            List<Map<String, Object>> productList = giveawayDAO.getGiveawayList(searchVO);
            model.addAttribute("table_name", "giveaway");
            model.addAttribute("Pk", "giveaway_id");
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods");
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("productList", productList);
            model.addAttribute("params", params);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/giveaway/giveawaylist";
    }

    @RequestMapping(value = "/Manager/GiveawayDetail")
    public String managerGiveawayDetail(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods-add");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/product/productDetail";
    }

    //경품 참여 관리
   @RequestMapping(value = "/Manager/GiveawayPartList")
   public String managerGiveawayPartList(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,DeliveryInfoVO deliveryInfoVO) throws Exception {
        try{
        	deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            searchVO.setDisplayRowCount(10);
            searchVO.setStaticRowEnd(10);
            searchVO.pageCalculate(giveawayDAO.getUserGiveawayPlayListCount(params));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            params.put("searchTypeArr",searchVO.getSearchTypeArr());
            List<Map<String,Object>> giveawayList = giveawayDAO.getUserGiveawayPlayList(params);

            //코드 목록
            params.put("code", "giveaway_play_status");
            List<Map<String, Object>> getGiveSelectorList = selectorDAO.getGiveSelectorList(params);
            model.addAttribute("getGiveSelectorList", getGiveSelectorList);

            //상태 카운트
            Map<String, Object> getGiveawayStatusCount = giveawayDAO.getGiveawayStatusCount(params);
            model.addAttribute("statusCount", getGiveawayStatusCount);

            model.addAttribute("listCnt", giveawayDAO.getUserGiveawayPlayListCount(params));
            model.addAttribute("list", giveawayList);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("params", params);
            
            //택배사목록
            Map<String, Object> companylist = CurlPost.curlPostFn(
            deliveryInfoVO.getDelivery_t_url()
                    +"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
            "",
            "",
            "get"
            );
            List<Map<String,Object>> company = (List)companylist.get("Company");
            if(!isEmpty(company)){
            deliveryDAO.insertDeliveryCompany(company);
            }
            List<Map<String,Object>> resultCompay = deliveryDAO.getDeliveryCompanyList(params);
            model.addAttribute("companyList", resultCompay);
        } catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("Pk", "giveaway_play_id");
        model.addAttribute("style", "order");
        model.addAttribute("topNav", 2);
        model.addAttribute("postUrl", "/Manager/GiveawayPartList");
        

       return "manager/giveaway/giveawaypartlist";
    }

    @RequestMapping(value = "/Manager/GiveawayAdd")
    public String managerGiveawayAdd(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods-add");
            model.addAttribute("postUrl", "Manager/GiveawayAddProc");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/giveaway/giveawayAdd";
    }

    @RequestMapping(value = "/Manager/info-change")
    public String managerInfoChange(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-change");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-change";
    }

    @RequestMapping(value = "/Manager/info-join")
    public String managerInfoJoin(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-join");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-join";
    }

    @RequestMapping(value = "/Manager/info-order")
    public String managerInfoOrder(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-order");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-order";
    }

    @RequestMapping(value = "/Manager/info-pay")
    public String managerInfoPay(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-pay");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-pay";
    }

    @RequestMapping(value = "/Manager/info-point")
    public String managerInfoPoint(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-point");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-point";
    }

    @RequestMapping(value = "/Manager/info-refund")
    public String managerInfoRefund(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-refund");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-refund";
    }

    @RequestMapping(value = "/Manager/info-service")
    public String managerInfoService(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-service");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-service";
    }

    //일반이용약관
    @RequestMapping(value = "/Manager/info-main")
    public String managerInfoMain(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-main");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-main";
    }
    //개인정보처리방침
    @RequestMapping(value = "/Manager/info-privacy")
    public String managerInfoPrivacy(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-privacy");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-privacy";
    }

    //제3자동의 이용약관
    @RequestMapping(value = "/Manager/info-main2")
    public String managerInfoMain2(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-main2");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-main2";
    }

    //개인정보 수집 및 이용
    @RequestMapping(value = "/Manager/info-privacy2")
    public String managerInfoPrivacy2(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-privacy2");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-privacy2";
    }

    //개인정보 제공
    @RequestMapping(value = "/Manager/info-privacy3")
    public String managerInfoPrivacy3(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("market_config_code", "info-privacy3");
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/info-privacy3";
    }

    //쿠폰관리
    @RequestMapping(value = "/Manager/promotion-coupon")
    public String managerPromotionCoupon(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
        	searchVO.setStaticRowEnd(10); 
        	params.put("searchTypeArr",searchVO.getSearchTypeArr());
    		searchVO.pageCalculate(mgCouponDAO.getCouponListCount(params));
    		params.put("displayRowCount", searchVO.getDisplayRowCount());
    		params.put("rowStart", searchVO.getRowStart());
    		params.put("searchTypeArr",searchVO.getSearchTypeArr());
    		List<Map<String, Object>> list = mgCouponDAO.getCouponList(params);
    		
    		//발급조건
    		params.put("code", "coupon_condition");
            List<Map<String, Object>> getCouponSelectorList = selectorDAO.getSelectorList(params);
            model.addAttribute("coupon_condition_list", getCouponSelectorList);
    		
            model.addAttribute("list", list);
            model.addAttribute("coupon_condition", params.get("coupon_condition"));
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "coupon");
            model.addAttribute("Pk", "coupon_id");
        } catch (Exception e) {
             e.printStackTrace();
        }
        model.addAttribute("params", params);
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "promotion-coupon");
        model.addAttribute("postUrl", "/Manager/promotion-coupon");
        return "/manager/promotion-coupon";
    }
    
    //상품제안
    @RequestMapping(value = "/Manager/product-proposal")
    public String managerProductProposal(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,HttpSession session) throws Exception {
    	try {
    		Object adminLogin = session.getAttribute("adminLogin");
            String email = (String)session.getAttribute("email");
        	if(adminLogin.equals("admin")){
        		params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
        	
    		searchVO.setDisplayRowCount(10);
    		searchVO.setStaticRowEnd(10); 
    		params.put("searchTypeArr",searchVO.getSearchTypeArr());
    		searchVO.pageCalculate(mgProductDAO.getProductProposalListCount(params));
    		params.put("displayRowCount", searchVO.getDisplayRowCount());
    		params.put("rowStart", searchVO.getRowStart());
    		params.put("searchTypeArr",searchVO.getSearchTypeArr());
    		List<Map<String, Object>> list = mgProductDAO.getProductProposalList(params);
    		
    		model.addAttribute("list", list);
    		model.addAttribute("searchVO", searchVO);
    		model.addAttribute("table_name", "product_proposal");
    		model.addAttribute("Pk", "proposal_id");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("params", params);
    	model.addAttribute("topNav", 2);
    	model.addAttribute("style", "promotion-coupon");
    	model.addAttribute("postUrl", "/Manager/product-proposal");
    	return "/manager/product-proposal";
    }

    //옵션관리
    @RequestMapping(value = "/Manager/option-product")
    public String managerOptionProduct(@RequestParam HashMap params, ModelMap model, MgOptionVO mgOptionVO) throws Exception {
        try {

            mgOptionVO.setDisplayRowCount(10);
//            mgBrandVO.setStaticRowEnd(10);
            mgOptionVO.pageCalculate(mgOptionDAO.getOptionListCount(mgOptionVO));
            params.put("searchTypeArr",mgOptionVO.getSearchTypeArr());
            List<Map<String, Object>> list = mgOptionDAO.getOptionList(mgOptionVO);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", mgOptionVO);
            model.addAttribute("table_name", "product_option");
            model.addAttribute("Pk", "product_option_code");
            model.addAttribute("params", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "option-product");
        model.addAttribute("postUrl", "/Manager/option-product");
        return "/manager/option-product";
    }

    //업체별 서비스안내관리 상단
    @RequestMapping(value = "/Manager/market-config-partner")
    public String managerMarketConfigPartner(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	params.put("market_config_code", "market-config-partner-top");
            params.put("store_id", "admin"); //임시
            Map<String, Object> config = configDAO.getConfigDetail(params);
            if (isEmpty(config)) {
                config.put("market_config_value", "");
            }
            model.addAttribute("config", config);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "info-setting");
        model.addAttribute("postUrl", "/Manager/config-proc");
        return "/manager/market-config-partner-top";
    }
    
    //업체별 서비스안내관리 하단
    @RequestMapping(value = "/Manager/market-config-partner-bot")
    public String managerMarketConfigPartnerBot(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
    	try {
    		params.put("market_config_code", "market-config-partner-bot");
            params.put("store_id", "admin"); //임시
    		Map<String, Object> config = configDAO.getConfigDetail(params);
    		if (isEmpty(config)) {
    			config.put("market_config_value", "");
    		}
    		model.addAttribute("config", config);
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("topNav", 2);
    	model.addAttribute("style", "info-setting");
    	model.addAttribute("postUrl", "/Manager/config-proc");
    	return "/manager/market-config-partner-bot";
    }
    
    //업체별 서비스안내관리 라이브쇼핑
    @RequestMapping(value = "/Manager/market-config-partner-live")
    public String managerMarketConfigPartnerLive(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
    	try {
    		params.put("market_config_code", "market-config-partner-live");
    		params.put("store_id", "admin"); //임시
    		Map<String, Object> config = configDAO.getConfigDetail(params);
    		if (isEmpty(config)) {
    			config.put("market_config_value", "");
    		}
    		model.addAttribute("config", config);
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("topNav", 2);
    	model.addAttribute("style", "info-setting");
    	model.addAttribute("postUrl", "/Manager/config-proc");
    	return "/manager/market-config-partner-live";
    }

    //브랜드관리
    @RequestMapping(value = "/Manager/option-brand")
    public String managerBrand(@RequestParam HashMap params, ModelMap model, MgBrandVO mgBrandVO) throws Exception {
        try {
            mgBrandVO.setDisplayRowCount(10);
//            mgBrandVO.setStaticRowEnd(10);
            mgBrandVO.pageCalculate(mgBrandDAO.getBrandListCount(mgBrandVO));
            List<Map<String, Object>> list = mgBrandDAO.getBrandList(mgBrandVO);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", mgBrandVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("table_name", "product_brand");
        model.addAttribute("Pk", "product_brand");
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "option-brand");
        model.addAttribute("postUrl", "/Manager/option-brand");
        return "/manager/option-brand";
    }



    //업체관리
    @RequestMapping(value = "/Manager/company-app")
    public String managerCompanyApp(@RequestParam HashMap params, ModelMap model, StoreVO storeVO, HttpSession session) throws Exception {
        try {
            storeVO.setDisplayRowCount(10);
            storeVO.setStaticRowEnd(10);
            storeVO.pageCalculate(mgStoreDAO.getStoreListCount(storeVO));
            
            List<Map<String, Object>> storeList = mgStoreDAO.getStoreList(storeVO);
            List<Map<String,Object>> depthList = mgUserDAO.getMenuDepth();
            model.addAttribute("depthList", depthList);
            model.addAttribute("list", storeList);
            model.addAttribute("table_name", "store");
            model.addAttribute("Pk", "store_id");
            model.addAttribute("searchVO", storeVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 3);
        model.addAttribute("style", "company-app");
        model.addAttribute("postUrl", "/Manager/company-app");
        return "/manager/company-app";
    }
    //업체 공지
    @RequestMapping(value = "/Manager/company-anno")
    public String managerCompanyAnno(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 3);
        model.addAttribute("style", "company-anno");
        model.addAttribute("postUrl", "/Manager/company-anno");
        return "/manager/company-anno";
    }
    //주문관리
    @RequestMapping(value = "/Manager/order")
    public String managerOrder(@RequestParam HashMap params, ModelMap model, SearchVO searchVO, DeliveryInfoVO deliveryInfoVO) throws Exception {
        try {
        	if(searchVO.getDisplayRowCount()==null){
                searchVO.setDisplayRowCount(10);
            }
        	params.put("searchKeyword", searchVO.getSearchKeyword());
        	params.put("searchTypeArr", searchVO.getSearchTypeArr());
            deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            searchVO.pageCalculate(paymentDAO.getMgPaymentBundleListCount(params));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getDisplayRowCount());
            List<Map<String,Object>> list = paymentDAO.getMgPaymentBundleList(params);
            
            if(list != null && list.size() > 0) {
	            Map<String,Object> groupList = list.stream().reduce(new HashMap<String,Object>(),(acc, cur) -> {
	            	if(acc.containsKey(cur.get("order_no"))) {
	            		((List)acc.get(cur.get("order_no"))).add(cur);
	            	}else {
	            		List<Map<String,Object>> tmpList = new ArrayList<>();
	            		tmpList.add(cur);
	            		acc.put((String)cur.get("order_no"),tmpList);
	            	}
	            	return acc;
	            });
	            // Map.Entry 리스트 작성
	    		List<Entry<String, Object>> list_entries = new ArrayList<Entry<String, Object>>(groupList.entrySet());
	
	    		// 비교함수 Comparator를 사용하여 오름차순으로 정렬
	    		Collections.sort(list_entries, new Comparator<Entry<String, Object>>() {
	    			// compare로 값을 비교
	    			public int compare(Entry<String, Object> obj1, Entry<String, Object> obj2) {
	    				// 오름 차순 정렬
	    				return String.valueOf(((List<Map<String,Object>>)obj2.getValue()).get(0).get("reg_date")).compareTo(String.valueOf(((List<Map<String,Object>>)obj1.getValue()).get(0).get("reg_date")));
	    			}
	    		});
	    		model.addAttribute("list", list_entries);
            }
            //택배사목록
            Map<String, Object> companylist = CurlPost.curlPostFn(
                deliveryInfoVO.getDelivery_t_url()
                        +"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
                "",
                "",
                "get"
            );
            List<Map<String,Object>> company = (List)companylist.get("Company");
            if(!isEmpty(company)){
                deliveryDAO.insertDeliveryCompany(company);
            }
            List<Map<String,Object>> resultCompay = deliveryDAO.getDeliveryCompanyList(params);
            model.addAttribute("companyList", resultCompay);

            //코드 목록
            params.put("code", "payment_status");
            List<Map<String, Object>> getSelectorList = selectorDAO.getSelectorList(params);
            model.addAttribute("getSelectorList", getSelectorList);
            
            //상태 카운트
            Map<String, Object> getStatusCount = paymentDAO.getStatusCount(params);
            model.addAttribute("statusCount", getStatusCount);
            
//            model.addAttribute("companyList", company);
            model.addAttribute("searchVO", searchVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("params", params);
        model.addAttribute("topNav", 4);
        model.addAttribute("style", "order");
        model.addAttribute("postUrl", "/Manager/order");
        model.addAttribute("table_name", "payment_bundle");
        model.addAttribute("Pk", "no");
        return "/manager/order";
    }

    //주문취소관리
    @RequestMapping(value = "/Manager/canceled")
    public String managerCanceled(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 4);
        model.addAttribute("style", "canceled");
        model.addAttribute("postUrl", "/Manager/canceled");
        return "/manager/order";
    }

    //교환반품처리
    @RequestMapping(value = "/Manager/returned")
    public String managerRetured(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,DeliveryInfoVO deliveryInfoVO) throws Exception {
        try {
        	if(deliveryInfoVO.getDisplayRowCount()==null){
        		deliveryInfoVO.setDisplayRowCount(10);
            }
            deliveryInfoVO.setDelivery_t_key(t_key);
            deliveryInfoVO.setDelivery_t_url(t_url);
            deliveryInfoVO.pageCalculate(refundDAO.getDeliveryRefundListCount(deliveryInfoVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getDisplayRowCount());
            params.put("searchTypeArr",deliveryInfoVO.getSearchTypeArr());
            List<Map<String,Object>> list = refundDAO.getDeliveryRefundList(deliveryInfoVO);
            //택배사목록
            Map<String, Object> companylist = CurlPost.curlPostFn(
                deliveryInfoVO.getDelivery_t_url()
                        +"/api/v1/companylist?t_key="+deliveryInfoVO.getDelivery_t_key(),
                "",
                "",
                "get"
            );
            List<Map<String,Object>> company = (List)companylist.get("Company");
            if(!isEmpty(company)){
                deliveryDAO.insertDeliveryCompany(company);
            }
            List<Map<String,Object>> resultCompay = deliveryDAO.getDeliveryCompanyList(params);
            model.addAttribute("companyList", resultCompay);
            
          //상태 카운트
            Map<String, Object> getStatusCount = paymentDAO.getStatusCount(params);
            model.addAttribute("statusCount", getStatusCount);
            
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("params", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 4);
        model.addAttribute("style", "returned");
        model.addAttribute("postUrl", "/Manager/updateRefund");
        return "/manager/returned";
    }

    //분류별 매출
    @RequestMapping(value = "/Manager/class-sales")
    public String managerClassSales(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	if(params.get("sales_criteria") == null || params.get("sales_criteria").equals("")) {
        		params.put("sales_criteria","date");
        	}
    		searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getCategorySalesListCount(params));
    		params.put("displayRowCount", searchVO.getDisplayRowCount());
    		params.put("rowStart", searchVO.getRowStart());
    		List<Map<String, Object>> list = mgSalesDAO.getCategorySalesList(params);
    		
            model.addAttribute("list", list);
            model.addAttribute("params", params);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "class-sales");
        model.addAttribute("postUrl", "/Manager/class-sales");
        return "/manager/class-sales";
    }
    //분류별 매출 사용자별
    @RequestMapping(value = "/Manager/class-sales-user")
    public String managerClassSalesUser(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	if(params.get("sales_criteria") == null || params.get("sales_criteria").equals("")) {
        		params.put("sales_criteria","date");
        		searchVO.setSales_criteria("date");
        	}
    		searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getUserSalesListCount(searchVO));
    		List<Map<String, Object>> list = mgSalesDAO.getUserSalesList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("params", params);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "class-sales");
        model.addAttribute("postUrl", "/Manager/class-sales-user");
        return "/manager/class-sales-user";
    }
    //분류별 매출 협력사별
    @RequestMapping(value = "/Manager/class-sales-company")
    public String managerClassSalesCompany(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
    	try {
//    		searchVO.setDisplayRowCount(10);
//    		searchVO.pageCalculate(mgSalesDAO.getCategorySalesListCount(params));
//    		params.put("displayRowCount", searchVO.getDisplayRowCount());
//    		params.put("rowStart", searchVO.getRowStart());
//    		List<Map<String, Object>> list = mgSalesDAO.getCategorySalesList(params);
//    		
//    		model.addAttribute("list", list);
    		model.addAttribute("searchVO", searchVO);
    		model.addAttribute("table_name", "payment");
    		model.addAttribute("Pk", "payment_cd");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("topNav", 5);
    	model.addAttribute("style", "class-sales");
    	model.addAttribute("postUrl", "/Manager/class-sales-company");
//    	return "/manager/class-sales-company";
    	return "tmp";
    }
  //분류별 매출 사용자별
    @RequestMapping(value = "/Manager/class-sales-paymethod")
    public String managerClassSalesPaymethod(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	if(params.get("sales_criteria") == null || params.get("sales_criteria").equals("")) {
        		params.put("sales_criteria","date");
        		searchVO.setSales_criteria("date");
        	}
    		searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getPaymethodSalesListCount(searchVO));
    		List<Map<String, Object>> list = mgSalesDAO.getPaymethodSalesList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("params", params);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "class-sales");
        model.addAttribute("postUrl", "/Manager/class-sales-paymethod");
        return "/manager/class-sales-paymethod";
    }

    //상품별 매출
    @RequestMapping(value = "/Manager/product-sales-category")
    public String managerProductSales(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getTopCategorySalesListCount(params));
    		params.put("displayRowCount", searchVO.getDisplayRowCount());
    		params.put("rowStart", searchVO.getRowStart());
    		List<Map<String, Object>> list = mgSalesDAO.getTopCategorySalesList(params);
    		
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "product-sales");
        model.addAttribute("postUrl", "/Manager/product-sales-category");
        return "/manager/product-sales-category";
    }
  //상품별 매출 카테고리
    @RequestMapping(value = "/Manager/product-sales")
    public String managerProductSalesCategory(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getTopProductSalesListCount(searchVO));
    		List<Map<String, Object>> list = mgSalesDAO.getTopProductSalesList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "product-sales");
        model.addAttribute("postUrl", "/Manager/product-sales");
        return "/manager/product-sales";
    }
    
    //날짜별 매출
    @RequestMapping(value = "/Manager/date-sales")
    public String managerDataSales(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getDateSalesListCount(searchVO));
    		List<Map<String, Object>> list = mgSalesDAO.getDateSalesList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "date-sales");
        model.addAttribute("postUrl", "/Manager/date-sales");
        return "/manager/date-sales";
    }
  //날짜별 매출 주별
    @RequestMapping(value = "/Manager/date-sales-week")
    public String managerDataSalesWeek(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getWeekSalesListCount(searchVO));
    		List<Map<String, Object>> list = mgSalesDAO.getWeekSalesList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "date-sales");
        model.addAttribute("postUrl", "/Manager/date-sales-week");
        return "/manager/date-sales-week";
    }
  //날짜별 매출 월별
    @RequestMapping(value = "/Manager/date-sales-month")
    public String managerDataSalesMonth(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgSalesDAO.getMonthSalesListCount(searchVO));
    		List<Map<String, Object>> list = mgSalesDAO.getMonthSalesList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "date-sales");
        model.addAttribute("postUrl", "/Manager/date-sales-month");
        return "/manager/date-sales-month";
    }
    //회원관리
    @RequestMapping(value = "/Manager/member-management")
    public String managerMemberManagement(@RequestParam HashMap params, ModelMap model, MgUserVO mgUserVO, HttpSession session) throws Exception {
        try {
            mgUserVO.setDisplayRowCount(10);
            mgUserVO.setStaticRowEnd(10);
            mgUserVO.pageCalculate(mgUserDAO.getManagerUserListCount(mgUserVO));
            params.put("searchTypeArr",mgUserVO.getSearchTypeArr());
            List<Map<String,Object>> depthList = mgUserDAO.getMenuDepth();
            model.addAttribute("depthList", depthList);
            List<Map<String,Object>> list = mgUserDAO.getManagerUserList(mgUserVO);
            model.addAttribute("list", list);
            //등급 리스트
//            mgUserVO.pageCalculate(mgUserGrantDAO.getUserGrantListCount(mgUserVO));
            List<Map<String,Object>> userGrantlist = mgUserGrantDAO.getUserGrantList(mgUserVO);
            model.addAttribute("userGrantlist", userGrantlist);
            model.addAttribute("table_name", "user");
            model.addAttribute("Pk", "usr_id");
            model.addAttribute("searchVO", mgUserVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("params", params);
        model.addAttribute("topNav", 6);
        model.addAttribute("style", "member-management");
        model.addAttribute("postUrl", "/Manager/member-management");
        return "/manager/member-management";
    }

    //회원 로그인 이력 관리
    @RequestMapping(value = "/Manager/memberLoginHistory")
    public String managerMemberLoginHistory(@RequestParam HashMap params, ModelMap model, MgUserVO mgUserVO) throws Exception {
        try {

            mgUserVO.setDisplayRowCount(10);
            mgUserVO.setStaticRowEnd(10);
            mgUserVO.pageCalculate(mgUserDAO.getUserHistoryCount(mgUserVO));

            List<Map<String,Object>> list = mgUserDAO.getUserHistory(mgUserVO);
            model.addAttribute("searchVO", mgUserVO);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 6);
        model.addAttribute("style", "member-management");
//        model.addAttribute("postUrl", "/Manager/member-management");
        return "/manager/memberLoginHistory";
    }
    //회원 마케팅 관리
    @RequestMapping(value = "/Manager/member-marketing")
    public String managerMemberMarketing(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {



        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 5);
        model.addAttribute("style", "member-marketing");
        model.addAttribute("postUrl", "/Manager/member-marketing");
        return "/manager/member-marketing";
    }
    //회원 상품평
    @RequestMapping(value = "/Manager/cs-review")
    public String managerCsReview(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
        	searchVO.setDisplayRowCount(10);
    		searchVO.pageCalculate(mgReviewDAO.getReviewListCount(searchVO));
    		List<Map<String, Object>> list = mgReviewDAO.getReviewList(searchVO);
    		
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("table_name", "product_review");
            model.addAttribute("Pk", "review_id");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 9);
        model.addAttribute("style", "cs-review");
        model.addAttribute("postUrl", "/Manager/cs-review");
        return "/manager/cs-review";
    }
      //업체 별 정산
    @RequestMapping(value = "/Manager/calculate-company")
    public String managerCalculateCompany(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,HttpSession session,CalculateCompanyVO calculateCompanyVO  ) throws Exception {
        try {
			
			  if(calculateCompanyVO.getDisplayRowCount()==null){
				  calculateCompanyVO.setDisplayRowCount(10);
			  }
				/* if("Y".equals(sslYn)) { */
			  String coupon_cd =calculateCompanyVO.getCoupon_cd();
			  if("N".equals(coupon_cd)) {
				  calculateCompanyVO.setCoupon_cd("='' ||  d.coupon_cd IS NULL");
				  calculateCompanyVO.setCoupon_cd_arr_str("N");
			  }
			  if("Y".equals(coupon_cd)) {
				  calculateCompanyVO.setCoupon_cd("!=''");
				  calculateCompanyVO.setCoupon_cd_arr_str("Y");
			  }	
			  
			  if("Y,N".equals(coupon_cd)) {
				  calculateCompanyVO.setCoupon_cd("='' ||  d.coupon_cd IS NULL ||d.coupon_cd ='' ");
				  calculateCompanyVO.setCoupon_cd_arr_str("YN");
				  
			  }
			
			  
			  
			  
   		 String email = (String)params.get("email");
   		 params.put("email", session.getAttribute("email"));
           Map<String,Object> loginUserList = userDAO.getUserStoreList(params);
           calculateCompanyVO.setLevel((Integer)loginUserList.get("level"));
           
           //storeVO.setStore_id((String)session.getAttribute("email"));
		
          // calculateCompanyVO.setDisplayRowCount(10);
           calculateCompanyVO.pageCalculate(calculateCompanyDAO.getCalculateCompanyCount(calculateCompanyVO)
		  );

			 calculateCompanyVO.setProduct_store_id((String)session.getAttribute("email"));
			 calculateCompanyVO.setLevel((Integer)loginUserList.get("level"));
			 
			 
			 
           model.addAttribute("searchVO", calculateCompanyVO); 
       	  List<Map<String,Object>> list = calculateCompanyDAO.getCalculateCompanyList(calculateCompanyVO);
       	 
       	  model.addAttribute("list", list);
              
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("table_name", "payment");
        model.addAttribute("Pk", "payment_cd");
        model.addAttribute("params", params); 
        model.addAttribute("topNav", 8);
        model.addAttribute("style", "calculate-company");
        model.addAttribute("postUrl", "/Manager/calculate-company");
       
        return "/manager/calculate-company";
    }

    //업체 별 정산
    @RequestMapping(value = "/Manager/calculate-applyCompany")
    public String managerCalculateApplyCompany(@RequestParam HashMap params, ModelMap model, SearchVO searchVO,HttpSession session,CalculateCompanyVO calculateCompanyVO  ) throws Exception {
        try {
			
			  if(calculateCompanyVO.getDisplayRowCount()==null){
				  calculateCompanyVO.setDisplayRowCount(10);
			  }
			 
   		 String email = (String)params.get("email");
   		 params.put("email", session.getAttribute("email"));
         Map<String,Object> loginUserList = userDAO.getUserStoreList(params);
         calculateCompanyVO.setLevel((Integer)loginUserList.get("level"));
           
           calculateCompanyVO.pageCalculate(calculateCompanyDAO.getCalculateCompanyCount(calculateCompanyVO)
		  );
			 calculateCompanyVO.setProduct_store_id((String)session.getAttribute("email"));
			 calculateCompanyVO.setLevel((Integer)loginUserList.get("level"));
			 
           model.addAttribute("searchVO", calculateCompanyVO); 
       	  List<Map<String,Object>> list = calculateCompanyDAO.getCalculateApplyCompanyList(calculateCompanyVO);
       	 
       	  model.addAttribute("list", list);
       	  
              
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("table_name", "payment");
        model.addAttribute("Pk", "payment_cd");
        model.addAttribute("params", params); 
        model.addAttribute("topNav", 8);
        model.addAttribute("style", "calculate-company");
        model.addAttribute("postUrl", "/Manager/calculate-company");
       
        return "/manager/calculate-applyCompany";
    }

    
    //이포인트
    @RequestMapping(value="/Manager/MgEPoint")
    public String myPagePoint(@RequestParam HashMap params, SearchVO searchVO, Model model, HttpServletRequest request, HttpSession session, MgPointVO mgPointVO) throws SQLException {
        try{
        	
            mgPointVO.setDisplayRowCount(10);
            mgPointVO.setStaticRowEnd(10);
            mgPointVO.pageCalculate(mgPointDAO.getMgPointListCount(mgPointVO));

            params.put("rowStart",searchVO.getRowStart());
            params.put("displayRowCount",searchVO.getDisplayRowCount());
            params.put("staticRowEnd", searchVO.getStaticRowEnd());
            params.put("searchTypeArr",searchVO.getSearchTypeArr());
            
            model.addAttribute("searchVO", mgPointVO);

            List<Map<String,Object>> list = mgPointDAO.getMgPointList(mgPointVO);
            model.addAttribute("list", list);
            
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("table_name", "point_history");
        model.addAttribute("Pk", "point_id");
        model.addAttribute("topNav", 6);
        model.addAttribute("params", params);
        model.addAttribute("style", "member-management");
        return "manager/MgEPoint";
        
    }

    //Q&A 목록
    @RequestMapping(value = "/Manager/listQna")
    public String managerListQna(@RequestParam HashMap params, Model model,HttpServletRequest request, HttpSession session, QnaVO qnaVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            Integer listCnt = qnaDAO.getQnaListCount(qnaVO);
            qnaVO.setDisplayRowCount(10);
            qnaVO.pageCalculate(listCnt);
            List<Map<String,Object>>list =qnaDAO.getQnaList(qnaVO);


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                model.addAttribute("list",list);
                model.addAttribute("searchVO",qnaVO);
                model.addAttribute("table_name","product_qna");
                model.addAttribute("Pk","qna_id");

            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        model.addAttribute("style","qna");
        return "manager/qna";
    }
    
    //상품정보고시설정
    @RequestMapping(value = "/Manager/product-definition")
    public String mgProductDefinition(@RequestParam HashMap params, ModelMap model, MgDeliveryVO mgDeliveryVO, HttpSession session, SearchVO searchVO) throws Exception {
        Object adminLogin = session.getAttribute("adminLogin");
        try {
            if(adminLogin.equals("admin")){
                mgDeliveryVO.setStore_id("admin");
                params.put("store_id","admin");
            }
            params.put("searchTypeArr",searchVO.getSearchTypeArr());
            searchVO.setDisplayRowCount(10);
            searchVO.pageCalculate(definitionDAO.getDefinitionCount(params));
            params.put("displayRowCount", searchVO.getDisplayRowCount());
    		params.put("rowStart", searchVO.getRowStart());
            List<Map<String, Object>> list = definitionDAO.getDefinitionList(params);
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("table_name", "product_definition");
        model.addAttribute("Pk", "product_definition_id");
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "product-definition");
        model.addAttribute("params", params);
        return "/manager/product-definition";
    }
}
