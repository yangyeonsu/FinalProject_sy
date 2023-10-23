<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰 신고 내역</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/reqRepList.css">

<!-- 배너 스크립트 -->
<script type="text/javascript">
	$(function()
	{
		$(".left_sub_menu").hide();
		$(".has_sub").click(function()
		{
			$(".left_sub_menu").fadeToggle(300);
			if ($('#checkOverlay').val() == "true")
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "0%");
				$('.overlay').css("height", "0%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "0");
				$('#checkOverlay').attr("value", "false");
			} else
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "100%");
				$('.overlay').css("height", "100%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "3");
				//$('.overlay').css("margin-top", "1.011vh");
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$(".sub_menu ul.small_menu").not(this).fadeOut(250);
			$("ul", this).stop().slideToggle(300);
		});
		// 외부 클릭 시 좌측 사이드 메뉴 숨기기
		$('.overlay').on('click', function()
		{
			$('.left_sub_menu').fadeOut();
			$('.overlay').css("position", "fixed");
			$('.overlay').css("width", "0%");
			$('.overlay').css("height", "0%");
			$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
			$('.overlay').css("z-index", "0");
			$('#checkOverlay').attr("value", "false");
		});
	});

	// 반려/중재 사유 모달
	$(document).on('click', '.rpt_content', function() {
	    var repProcessNum = $(this).attr('id');
	    var rejRsValue = $("#rej_rs" + repProcessNum).val();
	    var midRsValue = $("#mid_rs" + repProcessNum).val();
    	
	    
	    if(midRsValue!="")
	    {
	    	$("#midRs").html(midRsValue);
	    	
	    	if (document.all.midPopup.style.visibility == "hidden")
			{
				//alert("확인");
				
				document.all.midPopup.style.visibility = "visible";
				bgLayerOpen();
				
				//alert("visible check");
				
				var $layerPopupObj = $('#midPopup');
				var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
						.width()) / 2);
				var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
						.height()) / 4);
	
				$layerPopupObj.css(
				{
					'left' : left,
					'top' : top,
					'position' : 'absolute'
				});
				$('body').css('position', 'relative').append($layerPopupObj);
	
				return false;
				
			} 
			else
			{
				document.all.midPopup.style.visibility = "hidden";
				bgLayerClear();
				return false;
			}
	    }
	    else if(rejRsValue!="")
	    {
	    	$("#rvRs").html(rejRsValue);
			
			if (document.all.rvPopup.style.visibility == "hidden")
			{
				document.all.rvPopup.style.visibility = "visible";
				bgLayerOpen();
				
				var $layerPopupObj = $('#rvPopup');
				var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
						.width()) / 2);
				var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
						.height()) / 4);

				$layerPopupObj.css(
				{
					'left' : left,
					'top' : top,
					'position' : 'absolute'
				});
				$('body').css('position', 'relative').append($layerPopupObj);

				return false;
			} 
			else
			{
				document.all.rvPopup.style.visibility = "hidden";
				bgLayerClear();
				return false;
			}
	    }
	});
	
	function rvPopupOpen(element)
	{
		if ($(element).attr("id") == "mid")
		{
			document.all.midPopup.style.visibility = "hidden";
			bgLayerClear();
			return false;
		}
		else
		{
			document.all.rvPopup.style.visibility = "hidden";
			bgLayerClear();
			return false;
		}
	}
	
	function bgLayerOpen()
	{
		if (!$('.bgLayer').length)
		{
			$('<div class="bgLayer"></div>').appendTo($('body'));
		}
		var object = $(".bgLayer");
		var w = $(document).width();
		var h = $(document).height();

		object.css(
		{
			'width' : w,
			'height' : h
		});
		object.fadeIn(500); //생성되는 시간 설정
	}
	
	function bgLayerClear()
	{
		var object = $('.bgLayer');

		if (object.length)
		{
			object.fadeOut(500, function()
			{
				object.remove();

			});
		}
	}
</script>
	

</head>
<body>

	<div class="header">
		<c:import url="header_user.jsp"></c:import>
	</div>

	<div class="middle">
	<c:import url="sideBar_user.jsp"></c:import>
		
		<div class="right_content">
			<div class="rv_report">
				<div class="title">
					리뷰 신고 내역
				</div>
				<hr>
				
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">신고일자</div>
						<div class="rpt_subtitle st_name">가게명</div>
						<div class="rpt_subtitle">피신고자ID</div>
						<div class="rpt_subtitle">처리상태</div>
						<div class="rpt_subtitle">처리일자</div>
					</div>
					<c:choose>
					    <c:when test="${empty rvReportList}">
					    	<br>
					        <div class="no-data-message">리뷰 신고 내역이 존재하지 않습니다.</div>
					    	<div class="report_content">
				            </div>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="rvreport" items="${rvReportList}">
					        	<c:choose>
					        		<c:when test="${rvreport.state eq '처리완료' }">
										 <div class="report_content">
							                <div class="rpt_content" id="${rvreport.rep_process_num}">${rvreport.reg_date }</div>
							                <div class="rpt_content" id="${rvreport.rep_process_num}">${rvreport.st_name }</div>
							                <div class="rpt_content" id="${rvreport.rep_process_num}">${rvreport.accu_id }</div>
							                <c:choose>
							                	<c:when test="${rvreport.ismidrej ne '미처리'}">
							                		<div class="rpt_content"  id="${rvreport.rep_process_num}">${rvreport.state }(${rvreport.ismidrej })</div>
							                	</c:when>
								                <c:otherwise>
								                	<div class="rpt_content" id="${rvreport.rep_process_num}">${rvreport.state }</div>
								                </c:otherwise>
							                </c:choose>
							                <div class="rpt_content" id="${rvreport.rep_process_num}">${rvreport.final_date }</div>
							                
							                <div id="reject" style="display: none;">${rvreport.rep_rej_num}</div>
							                <input type="hidden" class="rej_rs" id="rej_rs${rvreport.rep_process_num}" value="${rvreport.rej_rs}">
							                							                
							                <div id="mid" style="display: none;">${rvreport.rep_mid_num}</div>
							                <input type="hidden" class="mid_rs" id="mid_rs${rvreport.rep_process_num}" value="${rvreport.mid_rs}">
							                
							            </div>								        		
					        		</c:when>
					        		<c:otherwise>
					        			 <div class="report_content">
							                <div class="rpt_content">${rvreport.reg_date }</div>
							                <div class="rpt_content">${rvreport.st_name }</div>
							                <div class="rpt_content">${rvreport.accu_id }</div>
							                <div class="rpt_content">${rvreport.state }</div>
							                <div class="rpt_content">${rvreport.final_date }</div>
							            </div>
					        		</c:otherwise>
					        	</c:choose>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
					
					<!-- 페이징 처리 -->
					<div class="pagination">
			            <c:choose>
			                <c:when test="${empty rvReportList}">
			                    <p></p>
			                </c:when>
			                <c:otherwise>
			                    <div class="pageIndex">
									${pageIndex }
								</div>
			                </c:otherwise>
			            </c:choose>
			        </div>
			        
				</div>
				
				
				<!-- 반려사유 모달 -->
				<div id="rvPopup" style="position: absolute; visibility: hidden;">
					<h4>
						<a href="#" class="close" id="rej" onClick="rvPopupOpen(this)">Ⅹ</a>
					</h4>
					<h3>리뷰신고 반려사유</h3>
					<div class="rvPopCont">
						<div class="list">
							<div class="reqRs">
								<h5 style="margin-top: 0">반려사유 &nbsp;&nbsp;&nbsp; </h5>
								<textarea class="rej_rs_content" rows="5" cols="42" id="rvRs" style="resize: none;" disabled="disabled">
								</textarea>
							</div>
							
						</div>
						<div class="rv">
							<button class="rvBtn" id="rej" onClick="rvPopupOpen(this)">확인</button>
						</div>
					</div>
					
				</div>
				
				
				<!-- 중재사유 모달 -->
				<div id="midPopup" style="position: absolute; visibility: hidden;">
					<h4>
						<a href="#" class="close" id="mid" onClick="rvPopupOpen(this)">Ⅹ</a>
					</h4>
					<h3>리뷰신고 중재사유</h3>
					<div class="rvPopCont">
						<div class="list">
							<div class="midRs">
								<h5 style="margin-top: 0">중재사유 &nbsp;&nbsp;&nbsp; </h5>
								<textarea class="mid_rs_content" rows="5" cols="42" id="midRs" style="resize: none;" disabled="disabled">
								</textarea>
							</div>
							
						</div>
						<div class="rv">
							<button class="rvBtn" id="mid" onClick="rvPopupOpen(this)">확인</button>
						</div>
					</div>
					
				</div>
			</div>
		</div><!-- right_content -->
	</div><!-- .middle end -->

	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>