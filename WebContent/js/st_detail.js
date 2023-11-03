/**
 * 
 */

$(document).ready(function(){

		$('input[type="text"][class="input"]').focus(function(){
			$(this).parent().find(".label-txt").addClass('label-active');
		});
		
		
		$('input[type="text"][class="input"]').focusout(function(){
			if ($(this).val() == '') {
				$(this).parent().find(".label-txt").removeClass('label-active');
			};
		});
	});
	
	
	/* checkbox 하나만 선택 가능 */
	$(document).ready(function()
	{
		$('input[type="checkbox"][name="toilet"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="toilet"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="puppy"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="puppy"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="room"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="room"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});

		$('input[type="checkbox"][name="reservation"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="reservation"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
				
		$('input[type="checkbox"][name="parking"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="parking"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="internet"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="internet"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="food_cat"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="food_cat"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		

	    $('#why1').keyup(function (e) {
	    	let content = $(this).val();
	        
	        // 글자수 세기
	        if (content.length == 0 || content == '') {
	        	$('.textCount').text('0자');
	        } else {
	        	$('.textCount').text(content.length + '자');
	        }
	        
	        // 글자수 제한
	        if (content.length > 5) {
	        	// 200자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 5));
	            // 200자 넘으면 알림창 뜨도록
	            /* errorMessage.style.display = 'inline'; */
				$("#errMessage1").show();
	        };
	    });
	    $('#why2').keyup(function (e) {
	    	let content = $(this).val();
	        
	        // 글자수 세기
	        if (content.length == 0 || content == '') {
	        	$('.textCount').text('0자');
	        } else {
	        	$('.textCount').text(content.length + '자');
	        }
	        
	        // 글자수 제한
	        if (content.length > 5) {
	        	// 200자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 5));
	            // 200자 넘으면 알림창 뜨도록
	            /* errorMessage.style.display = 'inline'; */
				$("#errMessage2").show();
	        };
	    });
	    $('#why3').keyup(function (e) {
	    	let content = $(this).val();
	        
	        // 글자수 세기
	        if (content.length == 0 || content == '') {
	        	$('.textCount').text('0자');
	        } else {
	        	$('.textCount').text(content.length + '자');
	        }
	        
	        // 글자수 제한
	        if (content.length > 5) {
	        	// 200자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 5));
	            // 200자 넘으면 알림창 뜨도록
	            /* errorMessage.style.display = 'inline'; */
				$("#errMessage3").show();
	        };
	    });
	});
	
	function loadFile(input) {
		
		var table = document.getElementById('food_table');
	    var lastRow = table.rows[table.rows.length - 1]; // 맨 뒤에 <tr> 추가
	    
	    var cellCount = lastRow.cells.length;
		
		var name = document.getElementById('fileName'+cellCount);
		var container = input.parentNode.querySelector('.image-show');
	    
	    // 이미 업로드된 사진이 있을 경우 삭제
	    var existingImage = container.querySelector('img');
	    if (existingImage) {
	        container.removeChild(existingImage);
	    }

	    var file = input.files[0]; // 선택된 파일 가져오기
	    name.textContent = file.name;

	    var newImage = document.createElement('img');
	    newImage.setAttribute('class', 'img');
	    
	    // 이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);

	    newImage.style.width = '30vw';
	    newImage.style.height = '50%';
	    newImage.style.objectFit = 'contain';

	    // 이미지를 image-show div에 추가
	    container.appendChild(newImage);

	    // 이미지는 화면에 나타나도록 설정
	    newImage.style.visibility = 'visible';

	};
	
	function plusTd()
	{
	    var table = document.getElementById('food_table');
	    var lastRow = table.rows[table.rows.length - 1]; // 맨 뒤에 <tr> 추가
	    
	    var cellCount = lastRow.cells.length;

	    var newCell = lastRow.insertCell(cellCount-1); // <td> 추가
	    
	    var content = "<div class='button'>";
	    content += "	<label for='file1'>";
	    content += "	👉 음식 사진 업로드 👈";
	    content += "	</label>";
	    content += "</div>";
	    content += "<input type='file' id='file1"+ cellCount +"' name='chooseFile' accept='image/*' onchange='loadFile(this)'>";
	    content += "<div class='image-show'></div>";
	    content += "<p id='fileName"+ cellCount +"' style='font-size: small'></p>";
	    content += "<label id='label'>";
	    content += "	<input type='text' class='input'>";
	    content += "	<div class='line-box' style='width:60%; margin-left: 3vw;'>";
	    content += "		<div class='line'></div>";
	    content += "	</div>";
	    content += "</label>";
	    
	    newCell.innerHTML = content; // <td> 내용 설정
	    

	};
	
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
				$("#openTime, #closeTime").on("change", function() {
			        var rowClass = $(this).closest("tr").attr("class");
			        
			        alert(rowClass);
				});
			});