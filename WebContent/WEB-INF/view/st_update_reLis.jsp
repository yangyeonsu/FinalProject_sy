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
<title>가게정보오류수정요청 경고 내역</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/reqRepList.css">

<style type="text/css">
.rpt_obj, .rpt_revoke
{
	background-color: #fff;
    width: 8vw;
    height: 2.5vw;
    justify-content: center;
    align-items: center;
    border-radius: 4px;
    box-shadow: 0px 3px 1px -2px rgb(0 0 0 / 20%), 0px 2px 2px 0px rgb(0 0 0 / 14%), 0px 1px 5px 0px rgb(0 0 0 / 12%);
}
</style>

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
				$('.overlay').css("width", "77%");
				$('.overlay').css("height", "100%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "3");
				$('.overlay').css("margin-top", "1.011vh");
				$('.overlay').css("margin-left", "23%");
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$("ul", this).slideToggle(300);
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
	
	
	// 모달 ----------------------------------------------
	function reqPopupOpen()
	{
		//alert("확인");
		
		var status = $("#status").html();
		//alert(status);
		
		if (status == "처리완료") 
		{
			//alert("status확인");
			
			var reject = $("#reject").html();
			
			if(reject=="반려")
	        {
				
	        	var rejRsElements = document.querySelectorAll(".rej_rs");
	            var rejRsContentElements = document.querySelectorAll(".rej_rs_content");
	            
	            //alert(rejRsContentElements);

	            for (var i = 0; i < rejRsElements.length; i++) {
	                var rejRsValue = rejRsElements[i].textContent;
	                rejRsContentElements[i].textContent = rejRsValue;
	            }
			
				if (document.all.rvPopup.style.visibility == "hidden")
				{
					//alert("확인");
					
					document.all.rvPopup.style.visibility = "visible";
					bgLayerOpen();
					
					//alert("확인");
					
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
					가게정보오류수정요청 경고 내역
				</div>
				<hr>
				
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">요청일자</div>
						<div class="st_name">가게명</div>
						<div class="rpt_subtitle">처리일자</div>
						<div class="rpt_subtitle">패널티부여일자</div>
						<div class="rpt_subtitle">이의제기</div>
						<div class="rpt_subtitle">패널티회수</div>
					</div>
					<c:choose>
					    <c:when test="${empty stinfoupdatelist}">
					        <div class="no-data-message">가게 정보 수정 요청 내역이 없습니다.</div>
					        <c:forEach var="udre" begin="1" end="10">
					        	<div class="report_content">
					                
					            </div>
					        </c:forEach>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="udre" items="${stinfoupdatelist}">
					            <div class="report_content">
					                <div class="rpt_content" onclick="reqPopupOpen()">${udre.reg_date }</div>
					                <div class="st_name" onclick="reqPopupOpen()">${udre.st_name }</div>
					                <div class="rpt_content" onclick="reqPopupOpen()">${udre.final_date }</div>
					                <div class="rpt_content" id="status" onclick="reqPopupOpen()">패널티 부여일자</div>
					                <c:choose>
					                	<c:when test="${udre.check_label eq '둘다가능' }">
					                		<div class="rpt_content"><button class="rpt_obj">이의제기</button></div>
					                		<div class="rpt_content"><button class="rpt_revoke">패널티회수</button></div>
					                	</c:when>
					                	<c:when test="${udre.check_label eq '패널티회수가능' }">
					                		<div class="rpt_content"><button class="rpt_obj" disabled="disabled">이의제기</button></div>
					                		<div class="rpt_content"><button class="rpt_revoke">패널티회수</button></div>
					                	</c:when>
					                	<c:when test="${udre.check_label eq '둘다불가능' }">
					                		<div class="rpt_content"><button class="rpt_obj" disabled="disabled">이의제기</button></div>
					                		<div class="rpt_content"><button class="rpt_revoke" disabled="disabled">패널티회수</button></div>
					                	</c:when>
					                </c:choose>
					            	
					            	<div id="reject" style="display: none;">${udre.req_apply_num }</div>
					                <%-- <div class="rej_rs" style="display: none;">${udre.rej_rs }</div> --%>
					            </div>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
					
					<!-- 페이징 처리 -->
					<div class="pagination">
			            <c:choose>
			                <c:when test="${empty user_stupdate_relist}">
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
				
				
				<div id="rvPopup" style="position: absolute; visibility: hidden;">
					<h4>
						<a href="#" class="close" onClick="javascript:reqPopupOpen()">Ⅹ</a>
					</h4>
					<h3>가게정보수정요청 반려사유</h3>
					<div class="rvPopCont">
						<div class="list">
							<div class="reqRs">
								<h5 style="margin-top: 0">반려사유 &nbsp;&nbsp;&nbsp; </h5>
								<%-- <textarea rows="5" cols="42" id="rvRs" style="resize: none; margin-top: 3vh;">${rvreport.rej_rs }</textarea> --%>
								<textarea class="rej_rs_content" rows="5" cols="42" id="rvRs" style="resize: none; margin-top: 3vh;" disabled="disabled"></textarea>
							</div>
							
						</div>
						<div class="rv">
							<button id="rvBtn" onClick="javascript:reqPopupOpen()">확인</button>
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