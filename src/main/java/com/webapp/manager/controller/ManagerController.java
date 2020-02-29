package com.webapp.manager.controller;

import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    CategoryDAO categoryDAO;
    @Autowired
    private MgProductDAO mgProductDAO;
    @Autowired
    private NumberGender numberGender;
    @RequestMapping(value = "/Manager/Product")
    public String managerProduct(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {

        try{
            searchVO.setDisplayRowCount(10);
            searchVO.setStaticRowEnd(10);
            params.put("pd_category_upper_code","T");
            List<Map<String,Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list",list);
            searchVO.pageCalculate(productDAO.getProductListCount(searchVO));
            params.put("rowStart",searchVO.getRowStart());
            params.put("staticRowEnd",searchVO.getStaticRowEnd());
            List<Map<String,Object>> productList = productDAO.getProductList(searchVO);
            model.addAttribute("table_name","product");
            model.addAttribute("Pk","product_id");
            model.addAttribute("topNav",2);
            model.addAttribute("style","goods");
            model.addAttribute("productList",productList);
            model.addAttribute("productList",productList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "/manager/product/index";
    }
    @RequestMapping(value = "/Manager/ProductDetail")
    public String managerProductDetail(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{
            model.addAttribute("topNav",2);
            model.addAttribute("style","goods-add");
//            model.addAttribute("productList",productList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "manager/product/productDetail";
    }
    @RequestMapping(value = "/Manager/Category")
    public String managerCategory(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{
            params.put("pd_category_upper_code","T");
            List<Map<String,Object>> list = categoryDAO.getCategoryList(params);
            params.put("pd_category_upper_code",null);
            List<Map<String,Object>> subList = categoryDAO.getCategorySubList(params);
            List<Map<String,Object>> thirdList = categoryDAO.getCategoryThirdList(params);
            model.addAttribute("list",list);
            model.addAttribute("subList",subList);
            model.addAttribute("thirdList",subList);
            model.addAttribute("topNav",2);
            model.addAttribute("style","category");
//            model.addAttribute("productList",productList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "/manager/product/category";
    }
    @RequestMapping(value = "/Manager/ProductAdd")
    public String managerProductAdd(@RequestParam HashMap params, ModelMap model, SearchVO searchVO) throws Exception {
        try{
            params.put("pd_category_upper_code","T");
            List<Map<String,Object>> list = categoryDAO.getCategoryList(params);
            model.addAttribute("list",list);
            model.addAttribute("topNav",2);
            model.addAttribute("style","goods-add");
            model.addAttribute("postUrl","/Manager/productAddProc");
//            model.addAttribute("productList",productList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "/manager/product/productAdd";
    }

}
