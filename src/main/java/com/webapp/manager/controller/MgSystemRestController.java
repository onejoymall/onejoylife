package com.webapp.manager.controller;

import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.manager.dao.MgStoreDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.MgProductCodeVO;
import com.webapp.manager.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.util.CollectionUtils.isEmpty;
@RestController
public class MgSystemRestController {
    @Autowired
    private MgSystemDAO mgSystemDAO;
    @Autowired
    MessageSource messageSource;
    @Autowired
    private NumberGender numberGender;
    //기본 배송정보 등록
    @RequestMapping(value = "/Save/systemDelivery", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> systemDelivery(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgDeliveryVO mgDeliveryVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        Object adminLogin = session.getAttribute("adminLogin");
        try{
//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }
            if(adminLogin == "admin"){
                mgDeliveryVO.setStore_id("admin");
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgSystemDAO.insertSystemDelivery(mgDeliveryVO);
                resultMap.put("redirectUrl","/Manager/Delivery");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 코드정보조회
    @RequestMapping(value = "Manager/CallCodeList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> CallCodeList(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        Object adminLogin = session.getAttribute("adminLogin");
        try{
//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                List<Map<String,Object>>getProductCodeList = mgSystemDAO.getProductCodeList(mgProductCodeVO);
                resultMap.put("getProductCodeList",getProductCodeList);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 코드정보 등록
    @RequestMapping(value = "/Save/codeInsert", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> codeInsert(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        Object adminLogin = session.getAttribute("adminLogin");
        try{

            if(mgProductCodeVO.getProduct_class_name().isEmpty()){
                error.put(messageSource.getMessage("product_class_name","ko"), messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                String code = mgProductCodeVO.getProduct_class_code_type()+numberGender.numberGen(6,1);
                mgProductCodeVO.setProduct_class_code(code);
                mgSystemDAO.insertProductCode(mgProductCodeVO);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

}
