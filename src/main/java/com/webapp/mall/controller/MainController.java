package com.webapp.mall.controller;

import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.manager.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class MainController {
    @Autowired
    GiveawayDAO giveawayDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    public String mallMain(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO) throws Exception {
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

            //경품목록
            searchVO.setDisplayRowCount(3);
            searchVO.setStaticRowEnd(3);
            searchVO.pageCalculate(giveawayDAO.getGiveawayListCount(params));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> list = giveawayDAO.getGiveawayList(params);
            model.addAttribute("giveawaylist", list);

            //상품목록
            searchVO.setDisplayRowCount(8);
            searchVO.setStaticRowEnd(8);
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            searchVO.setProduct_sale_yn("Y");
            List<Map<String,Object>> productList = productDAO.getProductList(searchVO);
            model.addAttribute("productList", productList);
            model.addAttribute("searchVO", searchVO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "mall/main";
    }
    @RequestMapping(value = "/layout/mainTopNav")
    public String mainTopNav(@RequestParam HashMap params, ModelMap model, UserInfo userInfo, HttpServletRequest request, SearchVO searchVO) throws Exception{
        try{
            // 카테고리 출력
            params.put("pd_category_upper_code","T");
            List<Map<String,Object>> categoryList = categoryDAO.getCategoryList(params);
            params.put("pd_category_upper_code",null);
            List<Map<String,Object>> subList = categoryDAO.getCategorySubList(params);
            List<Map<String,Object>> thirdList = categoryDAO.getCategoryThirdList(params);
            model.addAttribute("categoryList",categoryList);
            model.addAttribute("subList",subList);
            model.addAttribute("thirdList",thirdList);

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
            model.addAttribute("style", "today-sale");
            model.addAttribute("footerScript", "main");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "mall/today";
    }
}
