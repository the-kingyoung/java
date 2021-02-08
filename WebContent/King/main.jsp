<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameflix</title>
<link rel="Gaemflix icon" href="img/pabicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" 
integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link rel="stylesheet" href="default.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>

<%
	// 최신등록 순
	String[] newGameLink = {"#","#","#","#","#","#"};
	String[] newGamePath = {"img/01.jpg","img/01.jpg","img/01.jpg","img/01.jpg","img/01.jpg","img/01.jpg"};
	String[] newGameTitle = {"게임1","게임2","게임3","게임4","게임5","게임6"};
	String newGameList = "";
	for(int i=0; i < newGameLink.length; i++){
		newGameList += "<li><a href=\""+newGameLink[i]+"\"><img src=\""+newGamePath[i]+"\">";
		newGameList += "<div class=\"titl\">"+newGameTitle[i]+"</div>";
		newGameList += "</a></li>";
	}
	log(newGameList);  
%>
<style>
body{background-image: url(img/01.jpg);}  
#container{ width: 1024px; margin: 0 auto; }

#container > #main-content > #top3GameList { margin: 20px 0 30px 0; position: relative; }
#container > #main-content > #top3GameList img { width: 100%; height: 500px; border-radius: 10px; border: 1px solid lightgray; }
#container > #main-content > #top3GameList .btn-group { position: absolute; top: 40%; width: 100%; padding: 20px; }
#container > #main-content > #top3GameList button { font-size: 30px; color: white; }
#container > #main-content > #top3GameList button:nth-child(1) { float: left; }
#container > #main-content > #top3GameList button:nth-child(2) { float: right; }

#container > #main-content > .gameList { margin-bottom: 30px; height: 550px;}
#container > #main-content > .gameList h3 { color: white; font-size: 25px; font-weight: bold; margin-bottom: 5px; }
#container > #main-content > .gameList ul { display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; }
#container > #main-content > .gameList li { position: relative; margin-bottom: 20px; }
#container > #main-content > .gameList .titl { position: absolute; top: 50px; left: 45%; font-size: 20px; font-weight: bold; }
#container > #main-content > .gameList img { width: 300px; border-radius: 10px; border: 0.2px solid lightgray; transition: 0.5s; }
#container > #main-content > .gameList img:hover { width: 330px; }

#container > #side-banner { background: purple; position: relative; width: 1000px; }
#container > #side-banner > #ranking-box { 
	 width: 200px; top: -1620px; right: -240px; position: absolute;
	border-radius: 5px; color: lightgray;
}
#container > #side-banner > #ranking-box h2 { margin: 0 0 10px 10px; font-size: 15px; font-weight: bold; float: left;}
#container > #side-banner > #ranking-box a { float: right; font-size: 12px; color: #B97687; margin: 5px 8px 0 0}
#container > #side-banner > #ranking-box a:hover { color: #E5BFBC; text-decoration: underline;}
#container > #side-banner > #ranking-box img { width: 20px;}
#container > #side-banner > #ranking-box table { text-align: center; margin: 0 auto; width: 90%; margin-bottom: 10px;}
#container > #side-banner > #ranking-box td,th { border: 1px solid; padding: 5px; font-size: 13px;}
#container > #side-banner > #ranking-box td { font-size: 10px; }
</style>
<script type="text/javascript">
	
/* 	var imgArray = new Array();
	imgArray[0] = "img/01-introImg.jpg";
	imgArray[1] = "img/02-introImg.jpg";
	imgArray[2] = "img/03-introImg.jpg";
	imgArray[3] = "img/04-introImg.jpg";
	function showImage(){
		console.log(imgArray);
		var showNum = Math.round(Math.random()*3);
		var objImg = document.getElementById("introImg");
		objImg.src = imgArray[showNum];
		setTimeout("showImage()", 3000);
	} */
	
	window.onload = function() {
		var floatPosition = parseInt($("#ranking-box").css('top'))
		console.log(floatPosition);
		
		$(window).scroll(function(){
			
			var currentTop = $(window).scrollTop();
			var bannerTop = currentTop + floatPosition + "px";
			
			$("#ranking-box").stop().animate({
				"top" : bannerTop
			},500);
		}).scroll();
	}
	var imgNum = 0;
	function setImg(direction){
		var imgObj = document.querySelector("#introImg");
		if(direction == "left") {
			imgNum <= 0? imgNum = 2 : imgNum--;
		} else {
			imgNum >= 2? imgNum = 0 : imgNum++;
		}
		switch(imgNum) {
			case 0: imgObj.src = "img/01-introImg.jpg"; break;
			case 1: imgObj.src = "img/02-introImg.jpg"; break;
			case 2: imgObj.src = "img/03-introImg.jpg"; break;
		}
	}
</script>
</head>
<!-- <body onload="showImage()"> -->
<body>
	<%@ include file="header.jsp" %>
	
	<div id="container">
		<section id="main-content">
			<h2 class="hidden">인기 Top3 게임 리스트</h2>
			<div id="top3GameList">
				<img id="introImg" alt="인기게임이미지" src="img/01-introImg.jpg"/>
				<div class="btn-group">
					<button onclick="setImg('left')"><i class="fas fa-arrow-circle-left"></i></button>
					<button onclick="setImg('right')"><i class="fas fa-arrow-circle-right"></i></button>
				</div>
			</div>
			<h2 class="hidden">최신 등록 게임 리스트</h2>
			<div id="newGameList" class="gameList">
				<h3>최신게임</h3>
				<ul><%=newGameList %></ul>
			</div>
			<h2 class="hidden">전체 게임 리스트</h2>
			<div id="totalGameList" class="gameList">
				<h3>전체게임</h3>
				<ul><%=newGameList %></ul>
			</div>
		</section>
		
		<aside id="side-banner">
			<div id="ranking-box">
				<h2>유저랭킹 TOP5</h2>
				<a href="#">랭킹게시판</a>
				<table>
					<colgroup>
						<col style="width: 15%"/>
						<col style="width: 45%"/>
						<col style="width: 40%"/>
					</colgroup>
					<tr><th></th><th>아이디</th><th>점수</th></tr>
					<tr><td><img src="img/badge/grade-1.png"></td><td>gun111</td><td>5000</td></tr>
					<tr><td><img src="img/badge/grade-2.png"></td><td>gun222</td><td>4000</td></tr>
					<tr><td><img src="img/badge/grade-3.png"></td><td>gun333</td><td>3000</td></tr>
					<tr><td><img src="img/badge/grade-4.png"></td><td>gun444</td><td>2000</td></tr>
					<tr><td><img src="img/badge/grade-5.png"></td><td>gun555</td><td>1000</td></tr>
				</table>
			</div>
		</aside>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>