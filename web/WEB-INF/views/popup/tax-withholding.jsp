<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
        <div class="header-top">
            <p>원천징수영수증</p>
        </div>
        <div class="body-mar">
           <table>
               <colgroup>
                   <col style="width:100px">
                   <col style="width:371px">
                   <col style="width:100px">
                   <col style="width:371px">
               </colgroup>
               <tbody class="t-body2">
                   <tr>
                       <th class="tr-tit">관리번호</th>
                       <td>68</td>
                       <th class="tr-tit">내 &#183; 외국인</th>
                       <td>내국인</td>
                   </tr>
               </tbody>
           </table>
            <table>
                <colgroup>
                    <col style="width: 81px;">
                    <col style="width: 100px;">
                    <col style="width: 158px;">
                    <col style="width: 100px;">
                    <col style="width: 127px;">
                    <col style="width: 100px;">
                    <col style="width: 277px;">
                </colgroup>
                <tbody class="t-body1">
                   <tr>
                       <td colspan="7">원천징수영수증</td>
                   </tr>
                    <tr>
                        <td rowspan="2" class="tr-tit">징수<br>의무자</td>
                        <td class="tr-tit">상호(법인명)</td>
                        <td><span>(주)원조이</span></td>
                        <td class="tr-tit">성명</td>
                        <td><span>김수현</span></td>
                        <td class="tr-tit">등록번호</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">주민(법인)번호</td>
                        <td>110111-6958247</td>
                        <td class="tr-tit">주소</td>
                        <td colspan="3"><span>(우:1605-1) 서울시 서초구 서리풀길4, 4층<br> (서초동 영호빌딩)</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 80px;">
                    <col style="width: 99px;">
                    <col style="width: 157px;">
                    <col style="width: 100px;">
                    <col style="width: 127px;">
                    <col style="width: 100px;">
                    <col style="width: 277px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr>
                        <td rowspan="2" class="tr-tit">소득자</td>
                        <td class="tr-tit">성명</td>
                        <td><span>${detail.order_user_name}</span></td>
                        <td class="tr-tit" colspan="3">주민(법인)번호</td>
                        <td><span>${detail.reg_no}</span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">주소</td>
                        <td colspan="5"><span>(${detail.postcode}) ${detail.roadAddress} ${detail.extraAddress}</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 80px;">
                    <col style="width: 99px;">
                    <col style="width: 150px;">
                    <col style="width: 150px;">
                    <col style="width: 150px;">
                    <col style="width: 155px;">
                    <col style="width: 155px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr>
                        <td rowspan="2" class="tr-tit">소득구분</td>
                        <td class="tr-tit">거주자</td>
                        <td><span>기타소득 60</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">비거주자</td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 70px;">
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 129px;">
                    <col style="width: 130px;">
                    <col style="width: 110px;">
                    <col style="width: 110px;">
                    <col style="width: 110px;">
                    <col style="width: 100px;">
                    <col style="width: 100px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td colspan="3">지급일자</td>
                        <td rowspan="2">귀속일자</td>
                        <td rowspan="2">지급총액</td>
                        <td rowspan="2">소득금액</td>
                        <td rowspan="2">세율</td>
                        <td colspan="3">원천징수세액</td>
                    </tr>
                    <tr class="tr-tit">
                        <td>연</td>
                        <td>월</td>
                        <td>일</td>
                        <td>소득세</td>
                        <td>지방소득세</td>
                        <td>계</td>
                    </tr>
                    <c:set var="texA" value="0"/>
                    <c:set var="texB" value="0"/>
                    <c:set var="texA" value="${texA + (detail.giveaway_play_winner_point*0.2)}"/>
                    <c:set var="texB" value="${texB + (texA*0.1)}"/>
                    
                    <tr>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy"/></span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></span></span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></span></span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd"/></span></span></td>
                        <td><span><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /></span></td>
                        <td><span>20 %</span></td>
                        <td><span><fmt:formatNumber value="${texA}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${texB}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${texA+texB}" groupingUsed="true" /></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 390px;">
                    <col style="width: 260px;">
                    <col style="width: 290px;">
                </colgroup>
                <tbody class="t-body3">
                    <tr>
                        <td><span></span>위의 원천징수세액(수입금액)을 영수(지급)합니다.
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy년 MM월 dd일"/></span></td>
                        <td><span class="txt-weight">(주) 원조이</span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span class="txt-weight">서초세무서장 귀하</span></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="but-box">
                <button class="but2" onclick="window.print();">인쇄</button>
            </div>
        </div>
    </main>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>