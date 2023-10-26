<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 가게정보오류수정요청 내역</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

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
	
	// 반려 사유 모달
	$(document).on('click', '.rpt_content', function() {
	    var reqProcessNum = $(this).attr('id');
	    var rejRsValue = $("#rej_rs" + reqProcessNum).val();
		
	    if(rejRsValue!="")
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
	
	function reqPopupOpen(element)
	{
		document.all.rvPopup.style.visibility = "hidden";
		bgLayerClear();
		return false;
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
					가게정보오류수정요청 내역
				</div>
				<hr>
				
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">요청일자</div>
						<div class="rpt_subtitle st_name">가게명</div>
						<div class="rpt_subtitle">처리상태</div>
						<div class="rpt_subtitle">처리일자</div>
					</div>
					<c:choose>
					    <c:when test="${empty stupdateReList}">
					    	<br>
					        <div class="no-data-message">가게정보오류수정요청 내역이 없습니다.</div>
				        	<div class="report_content">
				            </div>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="udre" items="${stupdateReList}">
					        	<c:choose>
					        		<c:when test="${udre.state=='처리완료'}">
							            <div class="report_content">
							                <div class="rpt_content" id="${udre.req_process_num}">${udre.reg_date }</div>
							                <div class="rpt_content" id="${udre.req_process_num}">${udre.st_name }</div>
							                <c:choose>
							                	<c:when test="${udre.isrej ne '미처리'}">
							                		<div class="rpt_content" id="${udre.req_process_num}">${udre.state }(${udre.isrej })</div>
							                	</c:when>
							                	<c:otherwise>
							                		<div class="rpt_content" id="${udre.req_process_num}">${udre.state }</div>
							                	</c:otherwise>
							                </c:choose>
							                <div class="rpt_content" id="${udre.req_process_num}">${udre.final_date }</div>
							                
							            	<div id="reject" style="display: none;">${udre.req_process_num }</div>
							                <input type="hidden" class="rej_rs" id="rej_rs${udre.req_process_num}" value="${udre.rej_rs}">
							            </div>
							        </c:when>
							        <c:otherwise>
							        	<div class="report_content">
							                <div class="rpt_content">${udre.reg_date }</div>
							                <div class="rpt_content">${udre.st_name }</div>
							                <div class="rpt_content">${udre.state }</div>
							                <div class="rpt_content">${udre.final_date }</div>
							            </div>
							        </c:otherwise>
							   	</c:choose>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
					
					<!-- 페이징 처리 -->
					<div class="pagination">
			            <c:choose>
			                <c:when test="${empty stupdateReList}">
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
						<a href="#" class="close" onClick="reqPopupOpen(this)">Ⅹ</a>
					</h4>
					<h3>가게정보수정요청 반려사유</h3>
					<div class="rvPopCont">
						<div class="list">
							<div class="reqRs">
								<h5 style="margin-top: 0; margin-bottom: 0">반려사유 </h5>
								<textarea class="rej_rs_content" rows="5" cols="42" id="rvRs" style="resize: none;" disabled="disabled">
								</textarea>
							</div>
						</div>
						<div class="rv">
							<button class="rvBtn" onClick="reqPopupOpen(this)">확인</button>
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