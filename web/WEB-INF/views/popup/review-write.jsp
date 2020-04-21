<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
    <header>
        <h2>상품평 작성</h2>
    </header>
    <div class="main-section">
        <p class="goods-name">${productDetail.product_name}</p>
        <div>
            <span><span class="red-star">*</span>필수 입력 사항</span>
            <span>※상품평 내용 작성 없이 상품평 등록 가능합니다.</span>
        </div>
        <table>
            <colgroup>
                <col style="width: 120px;">
                <col style="width: 714px;">
            </colgroup>
            <tbody class="sec1-tbody">
                <tr>
                    <td class="sec1-td-bor1">상품평가<span class="red-star">*</span></td>
                    <td class="body-td2 padding-left">
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio1" value="5"/>
                            <label for="radio1" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio2" value="4"/>
                            <label for="radio2" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio3" value="3"/>
                            <label for="radio3" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio4" value="2"/>
                            <label for="radio4" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio5" value="1"/>
                            <label for="radio5" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">제목<span class="red-star">*</span></td>
                    <td class="body-td2 padding-left">
                        <input type="text" name="review_title" placeholder="50자 이내로 입력해주세요" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">내용</td>
                    <td class="body-td2 padding-left">
                        <textarea name="review_content"  placeholder="2,000자 이내로 입력해주세요" style="resize:none;" maxlength="2000"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">이미지 첨부</td>
                    <td class="body-td2 padding-left">
                        <div class="fileBox">
                            <input type="text" class="fileName" name="fileName" readonly="readonly">
                            <label for="rvImg1" class="btn_file">파일선택</label>
                            <input type="file" id="rvImg1" name="uploadfile" class="uploadBtn">
                            <button type="button" class="xBox">x</button>
                        </div>
                        <div class="fileBox">
                            <input type="text" class="fileName" readonly="readonly">
                            <label for="rvImg2" class="btn_file">파일선택</label>
                            <input type="file" id="rvImg2" name="uploadfile2" class="uploadBtn">
                            <button type="button" class="xBox">x</button>
                        </div>
                        <div class="fileBox">
                            <input type="text" class="fileName" readonly="readonly">
                            <label for="rvImg3" class="btn_file">파일선택</label>
                            <input type="file" id="rvImg3" name="uploadfile3" class="uploadBtn">
                            <button type="button" class="xBox">x</button>
                        </div>
                        <ul class="file-info">
                            <li>사진 첨부 가능 갯수 : 3개</li>
                            <li>첨부 가능 파일 형식 : JPG, PNG, GIF</li>
                            <li>파일명 : 영문, 숫자 가능</li>
                            <li>이미지 별 용량 제한 : 2MB 이하</li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
        <p>· 상품과 직접적으로 관계가 없는 내용이나, 약관 및 법률 등에 위배되는 글은 고객님께 사전 동의 없이 삭제 될 수 있습니다.</p>
        <div class="button-box">
            <button type="submit">등록</button>
            <button type="button" class="grey-button">취소</button>
        </div>
        
    </div>
    <script>
    $(function(){
	        // opener.location.reload(); 
	        //self.close();
	        $(".xBox").click(function(){
	        	$(this).siblings("input").val("");
	        })
    });
    </script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>