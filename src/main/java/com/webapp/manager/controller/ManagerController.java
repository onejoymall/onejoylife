package com.webapp.manager.controller;

import com.webapp.board.app.BoardGroupSvc;
import com.webapp.board.app.BoardGroupVO;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.board.common.TreeMaker;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.ConfigDAO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.dao.MgStoreDAO;
import com.webapp.manager.vo.ProductVO;
import com.webapp.manager.vo.StoreVO;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.util.CollectionUtils.isEmpty;

@Controller
public class ManagerController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    private MgProductDAO mgProductDAO;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private ConfigDAO configDAO;
    @Autowired
    private MgStoreDAO mgStoreDAO;
    @Autowired
    private BoardGroupSvc boardSvc;
    @Autowired
    private PaymentDAO paymentDAO;
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

    @RequestMapping(value = "/Manager/Product")
    public String managerProduct(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {

        try {

            searchVO.setDisplayRowCount(10);
            searchVO.setStaticRowEnd(10);
            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            params.put("rowStart", searchVO.getRowStart());
            params.put("staticRowEnd", searchVO.getStaticRowEnd());
            List<Map<String, Object>> productList = productDAO.getProductList(searchVO);
            model.addAttribute("table_name", "product");
            model.addAttribute("Pk", "product_id");
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods");
            model.addAttribute("productList", productList);

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
    public String managerCategory(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            params.put("pd_category_upper_code", null);
            List<Map<String, Object>> subList = categoryDAO.getCategorySubList(params);
            List<Map<String, Object>> thirdList = categoryDAO.getCategoryThirdList(params);
            model.addAttribute("list", list);
            model.addAttribute("subList", subList);
            model.addAttribute("thirdList", thirdList);
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "category");
            model.addAttribute("postUrl", "/Manager/productCategoryDisplayProc");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/manager/product/category";
    }

    @RequestMapping(value = "/Manager/ProductAdd")
    public String managerProductAdd(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods-add");
            model.addAttribute("postUrl", "/Manager/productAddProc");
//            model.addAttribute("productList",productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/manager/product/productAdd";
    }

    @RequestMapping(value = "/Manager/Giveaway")
    public String managerGiveaway(@RequestParam HashMap params, ModelMap model, GiveawayVO searchVO) throws Exception {

        try {

            searchVO.setDisplayRowCount(10);
            searchVO.setStaticRowEnd(10);
            params.put("pd_category_upper_code", "T");
            List<Map<String, Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list", list);
            searchVO.pageCalculate(giveawayDAO.getGiveawayListCount(searchVO));
            params.put("rowStart", searchVO.getRowStart());
            params.put("staticRowEnd", searchVO.getStaticRowEnd());
            List<Map<String, Object>> productList = giveawayDAO.getGiveawayList(searchVO);
            model.addAttribute("table_name", "giveaway");
            model.addAttribute("Pk", "giveaway_id");
            model.addAttribute("topNav", 2);
            model.addAttribute("style", "goods");
            model.addAttribute("searchVO", searchVO);
            model.addAttribute("productList", productList);

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

    //쿠폰관리
    @RequestMapping(value = "/Manager/promotion-coupon")
    public String managerPromotionCoupon(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {


        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "promotion-coupon");
        model.addAttribute("postUrl", "/Manager/promotion-coupon");
        return "/manager/promotion-coupon";
    }

    //옵션관리
    @RequestMapping(value = "/Manager/option-product")
    public String managerOptionProduct(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {


        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 2);
        model.addAttribute("style", "option-product");
        model.addAttribute("postUrl", "/Manager/option-product");
        return "/manager/option-product";
    }

    //업체별 상품 안내 기능
    @RequestMapping(value = "/Manager/market-config-partner")
    public String managerMarketConfigPartner(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {

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
        model.addAttribute("postUrl", "/Manager/market-config-partner");
        return "/manager/info-order";
    }

    //브랜드관리
    @RequestMapping(value = "/Manager/option-brand")
    public String managerBrand(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {

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
        model.addAttribute("postUrl", "/Manager/option-brand");
        return "/manager/option-brand";
    }



    //업체관리
    @RequestMapping(value = "/Manager/company-app")
    public String managerCompanyApp(@RequestParam HashMap params, ModelMap model, StoreVO storeVO) throws Exception {
        try {
            storeVO.setDisplayRowCount(10);
            storeVO.setStaticRowEnd(10);
            storeVO.pageCalculate(mgStoreDAO.getStoreListCount(storeVO));
            List<Map<String, Object>> storeList = mgStoreDAO.getStoreList(storeVO);
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
    public String managerOrder(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {
            searchVO.setDisplayRowCount(10);
            searchVO.setStaticRowEnd(10);
            searchVO.pageCalculate(paymentDAO.getPaymentListCount(params));

            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = paymentDAO.getPaymentList(params);
            model.addAttribute("table_name", "payment");
            model.addAttribute("Pk", "payment_cd");
            model.addAttribute("list", list);
            model.addAttribute("searchVO", searchVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 4);
        model.addAttribute("style", "order");
        model.addAttribute("postUrl", "/Manager/order");
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
    public String managerRetured(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 4);
        model.addAttribute("style", "returned");
        model.addAttribute("postUrl", "/Manager/returned");
        return "/manager/order";
    }
}
