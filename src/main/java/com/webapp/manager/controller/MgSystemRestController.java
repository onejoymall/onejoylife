package com.webapp.manager.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CommonDAO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.manager.dao.MgCommonDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.vo.CategoryVO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.MgDeliveryVO;
import com.webapp.manager.vo.MgProductCodeVO;
import com.webapp.manager.vo.StockVO;
@RestController
public class MgSystemRestController {
    @Autowired
    private MgSystemDAO mgSystemDAO;
    @Autowired
    private MgCommonDAO mgCommonDAO;
    @Autowired
    private CommonDAO commonDAO;
    @Autowired
    MessageSource messageSource;
    @Autowired
    private NumberGender numberGender;
    //관리자 > 상품등록 > 기본배송지 불러오기
    @Transactional
    @RequestMapping(value = "/Manager/getDefaultDelivery", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> getDefaultDelivery(@RequestParam HashMap params, HttpServletRequest request, HttpSession session,MgDeliveryVO mgDeliveryVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        
        try {
        	Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			mgDeliveryVO.setStore_id("admin");
    		}else {
    			mgDeliveryVO.setStore_id(email);
    		}
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
                //리디렉션 없는 페이지경우 success : true 반환
                resultMap.put("list",detail);
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //기본 배송정보 등록
    @RequestMapping(value = "/Save/systemDelivery", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> systemDelivery(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgDeliveryVO mgDeliveryVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
        	Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			mgDeliveryVO.setStore_id("admin");
    		}else {
    			mgDeliveryVO.setStore_id(email);
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
    @RequestMapping(value = "/Manager/CallCodeList", method = RequestMethod.POST, produces = "application/json")
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
            	List<Map<String,Object>> getProductCodeList = null;
            	if(mgProductCodeVO.getProduct_class_code_type().equals("S")) {
            		getProductCodeList = mgSystemDAO.getSupplierList(params);
            	}else {
            		getProductCodeList = mgSystemDAO.getProductCodeList(mgProductCodeVO);
            	}
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
  //상품 코드정보 수정
    @RequestMapping(value = "/Save/codeUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> codeUpdate(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
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
                if(!mgProductCodeVO.getProduct_class_code_type().equals("S")) {
                	mgSystemDAO.insertProductCode(mgProductCodeVO);
            	}
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
  //상품 코드정보 삭제
    @RequestMapping(value = "/Save/codeDelete", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> codeDelete(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        Object adminLogin = session.getAttribute("adminLogin");
        try{
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	if(mgProductCodeVO.getProduct_class_code_type().equals("S")) {
            		CommonVO commonVO = new CommonVO();
            		commonVO.setTable_name("store");
            		commonVO.setPk("supplier_cd");
            		String[] chk = {mgProductCodeVO.getProduct_class_code()};
            		commonVO.setChk(chk);
            		commonDAO.commonListDelete(commonVO);
            	}else {
            		mgSystemDAO.deleteProductCode(mgProductCodeVO);
            	}
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 일괄 수정
    @RequestMapping(value = "/Manager/productListUpdate",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productListUpdate(@RequestParam HashMap params, HttpServletRequest request, MgCommonVO mgCommonVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgCommonVO.getChk() == null || mgCommonVO.getChk().length < 1){
                error.put("Error", messageSource.getMessage("error.chcUpd","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.listUpdate(mgCommonVO);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 일괄 수정 재고
    @RequestMapping(value = "/Manager/productListUpdateStock",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productListUpdateStock(@RequestParam HashMap params, HttpServletRequest request, StockVO stockVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(stockVO.getChk() == null || stockVO.getChk().length < 1){
                error.put("Error", messageSource.getMessage("error.chcUpd","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.listStockUpdate(stockVO);
//                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 일괄 분류 수정
    @RequestMapping(value = "/Manager/productListCategoryUpdate",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productListCategoryUpdate(@RequestParam HashMap params, HttpServletRequest request, CategoryVO categoryVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(categoryVO.getChk() == null || categoryVO.getChk().length < 1){
                error.put("Error", messageSource.getMessage("error.chcUpd","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.productListCategoryUpdate(categoryVO);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //경품 일괄 수정
    @RequestMapping(value = "/Manager/giveawayListUpdate",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> giveawayListUpdate(@RequestParam HashMap params, HttpServletRequest request, MgCommonVO mgCommonVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgCommonVO.getChk() == null || mgCommonVO.getChk().length < 1){
                error.put("Error", messageSource.getMessage("error.chcUpd","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.listUpdate(mgCommonVO);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //지역별 배송비 사용설정
    @RequestMapping(value = "/Manager/updateDeliveryArea",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> updateDeliveryArea(@RequestParam HashMap params, HttpServletRequest request,HttpSession session){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
        try {
        	Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			mgSystemDAO.updateDeliveryArea(params);
    			resultMap.put("success","success");
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return resultMap;
    }
    //지역별 배송비 등록
    @RequestMapping(value = "/Manager/insertDeliveryArea",method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> insertDeliveryArea(@RequestParam HashMap params, HttpServletRequest request,HttpSession session){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	
    	try {
    		Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
    		
    		if(params.get("area_name") == null || params.get("area_name").equals("")){
    			error.put(messageSource.getMessage("area_name","ko"), messageSource.getMessage("error.required","ko"));
			}
    		if(params.get("postcode") == null || params.get("postcode").equals("")){
    			error.put(messageSource.getMessage("postcode","ko"), messageSource.getMessage("error.required","ko"));
			}
    		if(params.get("additional_delivery_payment") == null || params.get("additional_delivery_payment").equals("")){
    			error.put(messageSource.getMessage("additional_delivery_payment","ko"), messageSource.getMessage("error.required","ko"));
    		}
    		
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			mgSystemDAO.insertDeliveryArea(params);
    			resultMap.put("success","success");
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return resultMap;
    }
    
    //회원 아이디정보조회
    @RequestMapping(value = "/Manager/CallNormalUserList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> CallNormalUserList(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
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
                List<Map<String,Object>> getNormalUserList = mgSystemDAO.getNormalUserList();
                resultMap.put("getNormalUserList",getNormalUserList);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    
    //업체 상품정보조회
    @RequestMapping(value = "/Manager/CallStoreProductList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> CallStoreProductList(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>(); 
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	try{
    		Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
    		
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			List<Map<String,Object>> getStoreProductList = mgSystemDAO.getStoreProductList(params);
    			resultMap.put("getStoreProductList",getStoreProductList);
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return resultMap;
    }
    
    //업체 타업체조회
    @RequestMapping(value = "/Manager/CallStoreTargetList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> CallStoreTargetList(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, MgProductCodeVO mgProductCodeVO){
    	HashMap<String, Object> resultMap = new HashMap<String, Object>(); 
    	HashMap<String, Object> error = new HashMap<String, Object>();
    	try{
    		Object adminLogin = session.getAttribute("adminLogin");
    		String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    			Map<String,Object> storeDetail = mgSystemDAO.getStoreForId(params);
    			if(storeDetail.get("store_creator_yn") != null) {
    				if(storeDetail.get("store_creator_yn").equals("Y")) {
    					params.put("store_creator_yn", "N");
    				}else {
    					params.put("store_creator_yn", "Y");
    				}
    			}
    			
    			
    			if(storeDetail.get("store_pur_com") != null) {
    				if(storeDetail.get("store_pur_com").equals("A")) {
    					params.put("store_pur_com", "A");
    				}else {
    					params.put("store_pur_com", "B");
    				}
    			}
    			
    			
    			
    		}
    		
    		if(!isEmpty(error)){
    			resultMap.put("validateError",error);
    		}else{
    			List<Map<String,Object>> getStoreList = mgSystemDAO.getStoreList(params);
    			resultMap.put("getStoreList",getStoreList);
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}
    	return resultMap;
    }
}
