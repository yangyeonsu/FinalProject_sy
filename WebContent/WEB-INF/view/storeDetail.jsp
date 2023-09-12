<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YameokJa</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/side_bar.css">

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/storeDetail.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		if(${user_st_check==1})
		{
			$("#modifyReqBtn").attr("disabled", true);
			$("#modifyReqBtn").css("pointer-events", "none");
			$("#insertReview").attr("disabled", true);
			$("#insertReview").css("pointer-events", "none");
			$(".repBtn").attr("disabled", true);
			$(".repBtn").css("pointer-events", "none");
			$(".recBtn").attr("disabled", true);
			$(".recBtn").css("pointer-events", "none");
		}

		// 왼쪽 사이드 바
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
				$('.overlay').css("margin-top", "1.011vh");
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
	
	
	$(function()
	{
		$(".comAddBtn").click(function()
		{
			var st_num = $(this).val()
			
			var user_num = "<%=(String) session.getAttribute("user_num")%>"
			
			$.ajax(
			{
				url : "comparinginsert.action",
				type : "POST",
				data : { "user_num" : user_num
						, "st_num" : st_num },
				dataType : "text",
				success : function(data)
				{
					if (data == "")
					{
						alert("이미 비교함에 담긴 가게입니다.");
					} else
					{
						$(".comStoreListDiv").html(data);
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});

		});
		
		$(document).on("click",".likeAddBtn", function()
		{
			$st_num = $(this).val();
			$user_num = "<%=(String) session.getAttribute("user_num")%>"
			
			$.ajax(
			{
				url : "jjiminsertdelete.action",
				type : 'post',
				data :
				{
					"st_num" : $st_num,
					"user_num" : $user_num
				},
				context: this,
				success : function(result)
				{
					$(this).html(result);
					
					var clikeNum = Number($(".clikeNum").html());
					
					if(result==='❤️')
					{
						$(".clikeNum").html(clikeNum+1);
					}
					else if(result==='🤍')
					{
						$(".clikeNum").html(clikeNum-1);
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});

		// 비교함에서 삭제
		$(document).on("click",".comDelete", function()
		{
			$st_num = $(this).val();
			$user_num = "<%=(String) session.getAttribute("user_num")%>"

			$.ajax(
			{
				url : "comdelete.action",
				type : 'post',
				data :
				{
					"user_num" : $user_num,
					"st_num" : $st_num
				},
				success : function(data)
				{
					if (data == "")
					{
						alert("비교함에서 이미 삭제된 가게입니다.");
					} else
					{
						/* alert(data); */
						alert("비교함에서 삭제되었습니다.");
						$(".comStoreListDiv").html(data);
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		// 특정 메뉴 이름 hover 시 나타나기
		/*
		$("#menuName").hover(function()
		{
			if($(".menuName").attr("value").length > 11)
			{
				id = $(".menuNameHidden").attr("id");
				id_value = $("#"+id).attr("value");
				
				if(id_value.length > 11)
				{
					$("#"+id).css("display", "block");
				}
			}
		}, function()
		{
			$("#"+id).css("display", "none");
		});
		*/

		
		// 리뷰 작성 페이지로 이동
		$("#insertReview").click(function()
		{
			$("#userForm").attr("action", "insertreveiwform.action");
			$("#userForm").submit();
		});
		
		// 신고하기 버튼 눌렀을 때
		$(".repBtn").click(function()
		{
			alert($(this).val());
			$("input[name=rvNumHidden]").attr("value", $(this).val());
		});

		$("#decBtn").click(function()
		{
			$rv_num = $("input[name=rvNumHidden]").val();
			alert($rv_num);

			$st_num = $("input[name=st_num]").val();
			alert($st_num);

			var reviewRep = [];

			$("input:checkbox[name=reviewRep]:checked").each(function()
			{
				reviewRep.push($(this).val());
			});

			$rep_rs_num = reviewRep[0];

			if (reviewRep.length == null || reviewRep.length == 0)
			{
				alert("신고사유를 선택해주세요.");
				return;
			}
			
			popupOpen();

			$("input:checkbox[name=reviewRep]:checked").each(function()
			{
				$(this).prop("checked", false);
				totalChecked = 0;
			});

			$.ajax(
			{
				url : "reviewrep.action",
				type : 'post',
				data :
				{
					"rv_num" : $rv_num,
					"rep_rs_num" : $rep_rs_num,
					"st_num" : $st_num
				},
				context : this,
				success : function(html)
				{

					alert("신고가 완료되었습니다.");
					$(".info").html(html);
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		// 가게 정보 오류 수정 요청
		$("#reqBtn").click(function()
		{
			$st_num = $("input[name=st_num]").val();
			// 확인
			//alert($st_num);
			
			var optionReq = [];

			$("input:checkbox[name=optionCheck]:checked").each(function()
			{
				optionReq.push($(this).val());
				// 확인
				//alert($(this).val());
			});

			$chbox_num = optionReq[0];
			// 확인
			//alert("st_num : " + $st_num + ", chbox_num :" + $chbox_num);

			// 체크박스 선택이 이루어지지 않았다면 alert 후 return
			if (optionReq.length == null || optionReq.length == 0 || optionReq.length > 1)
			{
				alert("정보수정을 요청하고자 하는 항목을 1개 선택해주세요!");
				return;
			}
			
			// 정보수정요청 사유를 입력하지 않았다면 alert 후 return
			if ($("#reqRs").val() == "")
			{
				alert("정보수정요청 사유를 적어주세요!");
				return;
			}
			
			// 정보수정요청 사유 변수에 할당
			$req_rs = $("#reqRs").val();
			// 확인
			//alert("reqRs : " + $req_rs);

			reqPopupOpen();
			
			// 요청 후 입력된 정보 초기화
			$("input:checkbox[name=optionCheck]:checked").each(function()
			{
				$(this).prop("checked", false);
				/* optionTotalChecked = 0; */
			});
			$("#reqRs").val('');
			
			// ajax 수행
			$.ajax(
			{
				url : "reqapply.action",
				type : 'post',
				data :
				{
					"req_rs" : $req_rs,
					"chbox_num" : $chbox_num,
					"st_num" : $st_num
				},
				dataType : "text",
				success : function(result)
				{
					if(result=="1")
					{
						alert("가게정보 오류수정 요청이 완료되었습니다.");
					}
					else if(result=="0")
					{
						alert("이미 오류수정 요청이 진행중인 요청으로 요청이 완료되지 않았습니다.");
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});
	
	var totalChecked = 0;

	function CountChecked(field)
	{
		if (field.checked)
			totalChecked += 1;
		else
			totalChecked -= 1;

		if (totalChecked > 1)
		{
			alert("한 개만 선택 가능합니다.");
			field.checked = false;
			totalChecked -= 1;
		}

	}

	// 모달--------------------------------------------------------------------------
	function popupOpen()
	{

		if (document.all.popup.style.visibility == "hidden")
		{
			document.all.popup.style.visibility = "visible";
			bgLayerOpen();

			var $layerPopupObj = $('#popup');
			var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
					.width()) / 2);
			var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
					.height()) / 2);

			$layerPopupObj.css(
			{
				'left' : left,
				'top' : top,
				'position' : 'absolute'
			});
			$('body').css('position', 'relative').append($layerPopupObj);

			return false;
		} else
		{
			document.all.popup.style.visibility = "hidden";
			bgLayerClear();
			return false;
		}

	}

	function reqPopupOpen()
	{

		if (document.all.reqPopup.style.visibility == "hidden")
		{
			document.all.reqPopup.style.visibility = "visible";
			bgLayerOpen();

			var $layerPopupObj = $('#reqPopup');
			var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
					.width()) / 2);
			var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
					.height()) / 2);

			$layerPopupObj.css(
			{
				'left' : left,
				'top' : top,
				'position' : 'absolute'
			});
			$('body').css('position', 'relative').append($layerPopupObj);

			return false;
		} else
		{
			document.all.reqPopup.style.visibility = "hidden";
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

	$(function()
	{
		$(window).resize(function()
		{ //화면 크기 변할 시
			$('.bgLayer').css('width', $(window).width() - 0);
			$('.bgLayer').css('height', $(window).height() - 0);
		});
	});

	// 추천/비추천
	$(document).on(
			"click",
			".recBtn",
			function()
			{
				//alert("확인");
				$rv_num = $(this).val();

				if ($(this).attr("name") == "rec")
				{
					$rec_nonrec_number = "1";
				} else
					$rec_nonrec_number = "2";

				//alert($rec_nonrec_number);

				$.ajax(
				{
					url : "recinsertdelete.action",
					type : 'post',
					data :
					{
						"rv_num" : $rv_num,
						"rec_nonrec_number" : $rec_nonrec_number
					},
					dataType : "json",
					success : function(html)
					{
						//alert(html.rv_num +"|"+ html.rec_nonrec_number + "|" + html.action);
						//alert(html.rec + "|" + html.nonrec);

						if (html.action == "-1") // 같은 추천을 눌렀을 경우 -> rec_nonrec_number의 스타일을 없애고, count-1
						{
							if ($rec_nonrec_number == "1")
							{
								$("#rec" + html.rv_num).css("border", "none");
								$("#rec" + html.rv_num).html(
										"추천 👍 (" + html.rec + ")");
							} else if ($rec_nonrec_number == "2")
							{
								$("#nonrec" + html.rv_num)
										.css("border", "none");
								$("#nonrec" + html.rv_num).html(
										"비추천 👎 (" + html.nonrec + ")");
							}
						} else if (html.action == "0") // 그냥 추천/비추천 추가 -> 추가한 것에 스타일 추가, count+1
						{
							if ($rec_nonrec_number == "1")
							{
								$("#rec" + html.rv_num).css("border",
										"2px solid #ef6351");
								$("#rec" + html.rv_num).html(
										"추천 👍 (" + html.rec + ")");
							} else if ($rec_nonrec_number == "2")
							{
								$("#nonrec" + html.rv_num).css("border",
										"2px solid #ef6351");
								$("#nonrec" + html.rv_num).html(
										"비추천 👎 (" + html.nonrec + ")");
							}
						} else if (html.action == "1") // 이미 눌려있는 상태에서 다른 추천 눌렀을 경우
						// -> 누른 추천에 스타일 추가, 이미 있는 것에 스타일 해제
						//    누른 추천에 count+1, 이미 있는 것에 count-1
						{
							if (html.rec_nonrec_number == "1")
							{
								$("#rec" + html.rv_num).css("border",
										"2px solid #ef6351");
								$("#rec" + html.rv_num).html(
										"추천 👍 (" + html.rec + ")");
								$("#nonrec" + html.rv_num)
										.css("border", "none");
								$("#nonrec" + html.rv_num).html(
										"비추천 👎 (" + html.nonrec + ")");

							} else if ($rec_nonrec_number == "2")
							{
								$("#rec" + html.rv_num).css("border", "none");
								$("#rec" + html.rv_num).html(
										"추천 👍 (" + html.rec + ")");
								$("#nonrec" + html.rv_num).css("border",
										"2px solid #ef6351");
								$("#nonrec" + html.rv_num).html(
										"비추천 👎 (" + html.nonrec + ")");
							}
						}
					},
					error : function(e)
					{
						alert(e.responseText);
					}
				});
			});
</script>

</head>


<body>
	<form action="" id="userForm" method="post">
		<div class="header">
			<c:import url="header_user.jsp"></c:import>
		</div>

		<div id="body">

			<div id="column">

				<c:import url="sideBar_user.jsp"></c:import>
			</div>

			<div class="mainBody">

				<div id="container1" class="">
					<c:forEach var="s" items="${store }">
						<div class="placeholders main">

							<div class="placeholder main-left">

								<div class="background" style="font-weight: bold;">
									<div class="storeNameDiv">
										<span style="font-size: 2vw; font-weight: bold;">${s.st_name }</span>
										<input type="hidden" name="st_name" value="${s.st_name }">
										<button type="button" class="comAddBtn" value="${s.st_num}"
											style="margin-left: 1vw;">+</button>
									</div>
									<div class="revBoard">
										<div class="storeImgDiv">
											<img class="storeImg" src="<%=cp%>/${s.photo_link}">
										</div>

										<div class="info">
											<div class="likeRevC likeNum">

												찜
												<div class="likeBtnDiv" style="margin-right: 1vw;">
													<c:set var="list" value="${userJjimList}" />
													<c:set var="num" value="${s.st_num}" />

													<c:choose>
														<c:when test="${list.contains(num)}">
															<button type="button" class="likeAddBtn"
																value="${s.st_num}">❤️</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="likeAddBtn"
																value="${s.st_num}">🤍</button>
														</c:otherwise>
													</c:choose>

												</div>
												<span class="clikeNum">${clikeNum }</span>
											</div>
											<div class="likeRevC score">
												별점 ⭐<span>${s.star_avg}</span>

											</div>
											<div class="likeRevC reviewNum">
												리뷰 수 &nbsp; <span>${s.rv_count}</span>
											</div>
										</div>
										<input type="hidden" name="st_num" value="${s.st_num }">
									</div>
								</div>
							</div>

							<div class="placeholder main-right">
								<div class="background"
									style="font-weight: bold; margin-top: 1vh;">
									<div class="ocName">
										<span style="font-size: 18pt;">[영업 시간]</span>
									</div>
									<div id="weekList" class="openclose background">
										<div id="opencloseholiday">
											<div id='opencloseholidayName'>
												<div class="dayname">요일</div>
												<div class="time">운영시간</div>
											</div>
											<div id="opencloseholidayList">
												<c:if test="${empty openClose }">
													<div class="ochList">
														<div class="dayname">월요일</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">화요일</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">수요일</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">목요일</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">금요일</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">토요일</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">일요일</div>
														<div class="holiday">-</div>
													</div>
												</c:if>
												<c:forEach var="op" items="${openClose}">
													<div class="ochList">
														<div class="dayname">${op.day_name }</div>
														<c:choose>
															<c:when test="${op.holiday eq '휴무' }">
																<div class="time">휴무</div>
															</c:when>
															<c:otherwise>
																<div class="time">${op.operate_time }</div>
															</c:otherwise>
														</c:choose>

													</div>
												</c:forEach>
											</div>
										</div>
										<div id="breakTime">
											<div class="breakName">브레이크타임</div>

											<c:if test="${empty breakTime }">
												-
											</c:if>
											<c:forEach var="breakTime" items="${breakTime }">
												<div class="breakList">
													<div>[${breakTime.week_weekend }] &nbsp;&nbsp;</div>
													<div>${breakTime.start_breaktime }~
														${breakTime.end_breaktime }</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="storeKeywordsDiv">
							<c:forEach var="keyword" items="${stKeys }">
								"${keyword.st_keyword }" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</div>

						<div class="storeMiddle">
							<div class="storeinfo">
								<div class="storeInfoList">
									<div id="catName" class="siList1">카테고리</div>
									<div id="addrName" class="siList1">주소</div>
									<div id="telName" class="siList1">전화번호</div>
									<div id="emailName" class="siList1">e-mail</div>
									<div id="maxName" class="siList1">최대수용인원수</div>
									<div id="payName" class="siList1">결제수단</div>
									<div id="explainName" class="siList1">가게 설명</div>

								</div>

								<div class="storeInfoValue">
									<div id="cat" class="siList2">${s.food_name }</div>
									<div id="addr" class="siList2">${s.st_location }</div>
									<div id="tel" class="siList2">${s.st_tel }</div>
									<div id="email" class="siList2">${s.st_email }</div>
									<div id="max" class="siList2">${s.max_customers }</div>
									<div id="pay" class="siList2">
										<c:forEach var="stPay" items="${stPayList}">
										&nbsp;${stPay } 
									</c:forEach>
									</div>
									<div id="explain" class="siList2">${s.st_explain }</div>
								</div>
							</div>

							<div class="storeChecks">
								<c:if test="${empty stCheckList }">
									<div class="none">해당 항목이 존재하지 않습니다.</div>
								</c:if>
								<div class="storeCheck">
									<div class="stCheckListName">
										<가게 옵션>
									</div>
									<div class="stCheckListYesorno">
										<여부>
									</div>
								</div>
								<c:forEach var="stCheck" items="${stCheckList }">
									<div class="storeCheck">
										<div class="stCheckName">${stCheck.chbox_name }</div>
										<div class="stCheckYesorno">${stCheck.yesorno }</div>
									</div>
								</c:forEach>

								<div class="stCheckModifyReq">
									<button type="button" id="modifyReqBtn"
										onclick="reqPopupOpen()">정보오류수정요청</button>
								</div>
							</div>
						</div>
					</c:forEach>


					<div id="menuboard" class="container2">

						<!-- 메뉴 -->
						<h2>메뉴</h2>
						<div class="menuList">
							<c:if test="${empty menuLists }">
								<div class="none">"등록된 메뉴가 존재하지 않습니다."</div>
							</c:if>
							<c:forEach var="ml" items="${menuLists }">
								<div class="menu">
									<div class="menuPhoto">
										<img class="thumbnail" src="${ml.image_link }" />
									</div>
									<%-- <div class="menuName">"${ml.menu_name }"</div> --%>
									<c:choose>
										<c:when test="${fn:length(ml.menu_name) > 11}">
											<div class="menuName" id="menuName${ml.menu_num }" value="${ml.menu_name }">
												${fn:substring(ml.menu_name, 0, 10)}...
											</div>
										</c:when>
										<c:otherwise>
											<div class="menuName" id="menuName${ml.menu_num }" value="${ml.menu_name }">
												${ml.menu_name}
											</div>
										</c:otherwise>
									</c:choose>
									<div class="menuNameHidden" id="menuNameHidden${ml.menu_num }" value="${ml.menu_name }">
										${ml.menu_name}</div>
									<div class="menuPrice">
										<fmt:formatNumber value="${ml.price }" pattern="#,###" />
										원
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class=" container3">
						<div id="reviewList">
							<h2>리뷰</h2>


							<div class="rvKeyList">
								<c:if test="${empty reviewKeys }">
									<div class="none">"등록된 리뷰 키워드가 존재하지 않습니다."</div>
								</c:if>
								<c:forEach var="rvKey" items="${reviewKeys }">
									<div class="rvKey">"${rvKey.rv_key_name }"</div>
									<div class="rvKeyCount">(${rvKey.rv_key_count })</div>
								</c:forEach>
							</div>
							<!-- class="revKeyList"  -->

							<div id="revList">
								<div class="reviewInsertBtnDiv">
									<button type="button" class="btn" id="insertReview">리뷰작성하기</button>
								</div>
								<c:if test="${empty reviews }">
									<div class="none">"작성된 리뷰가 존재하지 않습니다."</div>
								</c:if>
								<c:forEach var="rv" items="${reviews }">
									<c:set var="rn" value="${rv.rv_num }" />
									<div class="reviews">
										<div class="rvTop">
											<div class="userNickname">"${rv.user_nickname }"</div>
											<div>
											<c:if test="${user_num ne rv.user_num }">
												<button type="button" class="repBtn rvBtn"
													onclick="popupOpen()" value="${rv.rv_num }">신고하기</button>
											</c:if>
											
											</div>
										</div>


										<div class="rvMiddle">
											<div class="starScore">
												<c:choose>
													<c:when test="${rv.star_score eq 5}">
													⭐⭐⭐⭐⭐
												</c:when>
													<c:when test="${rv.star_score eq 4}">
													⭐⭐⭐⭐
												</c:when>
													<c:when test="${rv.star_score eq 3}">
													⭐⭐⭐
												</c:when>
													<c:when test="${rv.star_score eq 2}">
													⭐⭐
												</c:when>
													<c:when test="${rv.star_score eq 1}">
													⭐
												</c:when>
													<c:otherwise>
													-
												</c:otherwise>
												</c:choose>
											</div>
											<div class="contentPhotoDiv">
												<div class="rvContentDiv" id="${rn }">${rv.rv_content }</div>
												<div class="rvPhotoDiv">
													<c:forEach var="photos" items="${rvPhotos }">
														<c:if test="${photos.rv_num eq rn }">
															<img alt="" class="rvphoto"
																src="<%=cp %>/images/${photos.photo_link }" />
														</c:if>
													</c:forEach>
												</div>
											</div>
											<div class="regDate">${rv.reg_date }</div>
										</div>

										<div class="rvBottom">
											<div class="recNonrecBtnDiv">
												<c:if test="${user_num ne rv.user_num }">
													<c:choose>
														<c:when
															test="${not empty userRnList and fn:contains(userRnList, rn)}">
															<button type="button" id="nonrec${rn }" name="nonrec"
																class="recBtn rvBtn" value="${rn }">비추천 👎
																(${rv.nonrec })</button>
															<button type="button" id="rec${rn }" name="rec"
																class="recBtn rvBtn" value="${rn }"
																style="border: 2px solid #ef6351">추천 👍
																(${rv.rec } )</button>
														</c:when>
														<c:when
															test="${not empty userNrnList and fn:contains(userNrnList, rn)}">
															<button type="button" id="nonrec${rn }" name="nonrec"
																class="recBtn rvBtn" value="${rn }"
																style="border: 2px solid #ef6351">비추천 👎
																(${rv.nonrec })</button>
															<button type="button" id="rec${rn }" name="rec"
																class="recBtn rvBtn" value="${rn }">추천 👍
																(${rv.rec } )</button>
														</c:when>
														<c:otherwise>
															<button type="button" id="nonrec${rn }" name="nonrec"
																class="recBtn rvBtn" value="${rn }">비추천 👎
																(${rv.nonrec })</button>
															<button type="button" id="rec${rn}" name="rec"
																class="recBtn rvBtn" value="${rn }">추천 👍
																(${rv.rec } )</button>
														</c:otherwise>
													</c:choose>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
								<input type="hidden" value="" name="rvNumHidden"> <input
									type="hidden" value="" name="rep_rs_num">
							</div>
							<!-- id="revList" -->

							<div id="popup" style="position: absolute; visibility: hidden;">
								<h4>
									<a href="#" class="close" onClick="javascript:popupOpen()">Ⅹ</a>
								</h4>
								<h3>리뷰신고</h3>
								<div class="popCont">
									<div class="list">
										<label for="commercial"> <input type="checkbox"
											class="reviewRep" id="commercial" name="reviewRep" value="1"
											onclick="CountChecked(this)">원치 않는 상업적인 리뷰
										</label><br> <br> <label for="intended"> <input
											type="checkbox" id="intended" name="reviewRep"
											class="reviewRep" value="2" onclick="CountChecked(this)">악의적인
											리뷰
										</label><br> <br> <label for="wrong"> <input
											type="checkbox" id="wrong" name="reviewRep" class="reviewRep"
											value="3" onclick="CountChecked(this)">잘못된 정보
										</label><br> <br> <label for="violent"> <input
											type="checkbox" id="violent" name="reviewRep"
											class="reviewRep" value="4" onclick="CountChecked(this)">욕설,
											성적, 폭력적인 리뷰
										</label><br> <br>
									</div>
								</div>
								<div class="dec">
									<button id="decBtn">신고하기</button>
								</div>
							</div>

							<div id="reqPopup"
								style="position: absolute; visibility: hidden;">
								<h4>
									<a href="#" class="close" onClick="javascript:reqPopupOpen()">Ⅹ</a>
								</h4>
								<h3>가게정보오류수정요청</h3>
								<div class="reqPopCont">
									<div class="list">
										<c:forEach var="checkOption" items="${stCheckList}">
											<div class="oplist">
												<c:choose>
													<c:when test="${checkOption.yesorno eq '-' }">
														<input type="checkbox" id="${checkOption.chbox_name }"
															value="${checkOption.chbox_num }" name="optionCheck" disabled="disabled">
													</c:when>
													<c:otherwise>
														<input type="checkbox" id="${checkOption.chbox_name }"
															value="${checkOption.chbox_num }" name="optionCheck">
													</c:otherwise>
												</c:choose>
												

												<div class="oplistName">
													<label for="${checkOption.chbox_name }">
														${checkOption.chbox_name } </label>
												</div>
												<div class="oplistOption">
													<label for="${checkOption.chbox_name }">
														${checkOption.yesorno } </label>
												</div>
											</div>
											<br>
										</c:forEach>

										<div class="reqRs">
											<h5>요청사유 &nbsp;&nbsp;&nbsp;</h5>
											<textarea rows="5" cols="45" id="reqRs"></textarea>
										</div>
									</div>
								</div>
								<div class="req">
									<button id="reqBtn">정보수정요청하기</button>
								</div>
							</div>
						</div>
					</div>
					<!-- class="col-md-8  container4" -->
				</div>
				<!-- id="container1" class="col-md-8" -->
			</div>

			<!-- id="container1" class="col-md-8" -->

			<!-- main -->


			<c:import url="compare_box.jsp"></c:import>

		</div>
	</form>
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>