<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

 <style>
      img {
        max-width: 100%;
        max-height: 100%;
      }
	.layer {display:none; position:fixed; _position:absolute; top:0; left:0; width:100%; height:100%; z-index:100;}
		.layer .bg {position:absolute; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50);}
		.layer .pop-layer {display:block;}

	.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 410px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
	.pop-layer .pop-container {padding: 20px 25px;}
	.pop-layer p.ctxt {color: #666; line-height: 25px;}
	.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

	a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
	a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
	
	.glyphicon{
		cursor: pointer;
	}
 </style>

<%-- <link rel = "stylesheet" type = "text/css" href = "${initParam.root}fontium/css/fontium.css" /> --%>
<script type="text/javascript" src="${initParam.root}resources/js/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		<%-- 댓글 더보기 클릭 시 페이지 reloading되며, 사용자가 보던 위치로 돌아감--%>
		if ( window.location.href.indexOf('page_y') != -1 ) {
	        var match = window.location.href.split('?')[1].split("&")[0].split("=");
	        $('html, body').scrollTop( match[1] );
	    }
		$("#commWrite").click(function() {
			location.href="community_write.do";
		});
				$("#btn").html("<button type='button' onclick='loadData()' class='btn btn-danger'>더보기</button>");
		$(window).scroll(function() { // 스크롤하면 아래 코드 실행
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			}
		}); //scroll
		
		if("${commList.size()>0}"){
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				$("#btn").html("<button type='button' onclick='loadData()' class='btn btn-danger'>더보기</button>");
			}
		}
		
		if("${sessionScope.mvo}"!=""){
			$("#commTable td").click(function() {
				if($(this).attr("name")=="likeDiv"){
					var likeTD = $(this); 
						//$(this).parent().children().eq(1);
					//if($(this).text()==likeTD.text()){
						var commNo = $(this).attr('title');
						$.ajax({
							type:"post",
							url:"comm_updateLike.do",
							data:"commNo="+commNo,
							success:function(data){
								var plus = Number(likeTD.text())+1;
								var minus = Number(likeTD.text())-1;
								if(data==1){
									likeTD.html("<div class='glyphicon glyphicon-heart' data-toggle='tooltip' title='좋아요 취소'></div>&nbsp"+plus);
								}else{
									likeTD.html("<div class='glyphicon glyphicon-heart-empty' data-toggle='tooltip' title='좋아요!'></div>&nbsp"+minus);
								}
							}//success
						});//ajax
					//}
				}
			/* 
					var commNo = $(this).parent().prev().children().eq(0).text();
			*/
			});//table td click
		}//session check
	});//ready
	
	var rn = "${param.rownum}";
 	//var date = "${param.date}";
	rn = Number(rn);
 	function loadData() {
	 	var page_y = $(document).scrollTop();
			rn+=5;
			/* if(date==""){
				date = new Date();
				
	            var day = date.getDate();
	            var month = date.getMonth() + 1;
	            var year = date.getFullYear();
	
	            if (month < 10) month = "0" + month;
	            if (day < 10) day = "0" + day;
	
	            var today = year + "-" + month + "-" + day;
	            date = today;
	            //$("#date").attr("value", today);
			} */
			if ( window.location.href.indexOf('page_y') != -1 || page_y != -1) {
		        var match = window.location.href.split('?')[1].split("&")[0].split("=");
		        $('html, body').scrollTop( match[1] );
		    }
			window.location.href = "${initParam.root}community_list.do?page_y=" + page_y+"&rownum="+rn;
	}
 	 /* function openPopup(src) {
 		if ($("#popupLayer").outerHeight() < $(document).height() ) $("#popupLayer").css('margin-top', '-'+$("#popupLayer").outerHeight()/2+'px');
 		else $("#popupLayer").css('top', '0px');
 		if ($("#popupLayer").outerWidth() < $(document).width() ) $("#popupLayer").css('margin-left', '-'+$("#popupLayer").outerWidth()/2+'px');
 		else $("#popupLayer").css('left', '0px');
 		
          $("#popupLayer").bPopup({
        	 follow: [true,false],
             position: ['margin-top', '-'+$("#popupLayer").outerHeight()/2+'px', 'margin-center', '-'+$("#popupLayer").outerWidth()/2+'px'],
             content:'iframe',
             iframeAttr:'frameborder=”auto”',
             iframeAttr:'frameborder=”0"',
             contentContainer:'.popupContent',
             loadUrl: src,
             onOpen: function() { 
             }, 
             onClose: function() { 
             }
         },
         function() {
         }); 
     }
 	 */
	function openPopup(el){
 		 
 		$(".pop-layer").bPopup({
            contentContainer:'.pop-conts',
            loadUrl: el,
            onOpen: function() { 
            }, 
            onClose: function() { 
            }
        },
        function() {
        });

		var temp = $('#layer2');		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>
<div id="blogMenu">
<ul>
<li><a href="#">Menu 1</a></li>
 
<li><a href="#">Menu 2</a>
 
<ul>
<li><a href="#">Sub Menu 1</a></li>
<li><a href="#">Sub Menu 2</a></li>
<li><a href="#">Sub Menu 3</a></li>
</ul>
 
</li>

<li><a href="#">Menu 3</a>
 
<ul>
<li><a href="#">Sub Menu 1</a></li>
<li><a href="#">Sub Menu 2</a></li>
<li><a href="#">Sub Menu 3</a></li>
</ul>
 
</li>

<li><a href="#">Menu 4</a></li>
<li><a href="#">Menu 5</a></li>
</ul>
</div>
<div class="addHeight"></div>
<div id="layer" class="container_12" align="center">
	<div class="bg"></div>
	<div id="layer2" class="pop-layer">
		<div class="pop-container">
					        <div class="pop-conts"></div>
					        <!-- <div class="btn-r">
					        	<a href="#" class="cbtn">Close</a>
					        </div> -->
		</div>
	</div>
	<div class="grid_12">
		<div class="community" id="contact-area">
			<c:if test="${sessionScope.mvo!=null}">
				<button type="button" alt="글작성" id="commWrite" class="btn btn-warning">글쓰기</button>
			</c:if>
			<table border="1" id="commTable">
			<c:forEach var="list" items="${commList}">
				 <tr class="card-receep-header">
					<td class="username"><strong>${list.memberVO.nickname}</strong></td>
					<td class="timeago">${list.timePosted}</td>
					<td id="like" name="likeDiv" title="${list.comm_no }">
						<c:choose>
						<c:when test="${list.userLike==1 }">
							<div class='glyphicon glyphicon-heart' data-toggle='tooltip' title='좋아요 취소'></div>
						</c:when>
						<c:when test="${list.userLike==0 }">
							<div class="glyphicon glyphicon-heart-empty" data-toggle="tooltip" title="좋아요!"></div><!--fonti um-heart onclick="updateLike('${list.comm_no}')" -->
						</c:when>
						</c:choose>
						${list.likePosted }
					</td>
				</tr>
				<tr class="card-receep-entry">
					<td colspan="3"  height="100" width="500">${list.content}<br>
						<%-- <c:if test="${fn:contains(list.content, 'img') }">
						</c:if> --%>
						<%-- <a href="#" onClick="javascript:openPopup('findCommByNo.do?commNo=${list.comm_no}')">상세보기</a> --%>
						<a href="findCommByNo.do?commNo=${list.comm_no}" >상세보기</a>
					</td>
				</tr>
			</c:forEach>
			</table>
			<c:if test="${commList.size() >= param.rownum}">
				<span id="btn"></span>
			</c:if>
		</div>
	</div>
</div>