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

%>
<style>
body{background-image: url(img/01.jpg);}  
#game-container { height: 800px; width: 1024px; margin: 0 auto; background: white; }
#game-container > #game-area { width: 500px; background: blue; margin: 0 auto; padding-top: 100px;}
#game-container > #game-area > .top-area { background: orange; display: flex; justify-content: center; }
#game-container > #game-area > .bottom-area { background: gold; display: flex; justify-content: center; }


#game-container .bottle { padding: 20px; }
#game-container img { width: 40px; display: block; margin-bottom: -1px; }
</style>
<script type="text/javascript">
	window.onload = function() {

	}

</script>
</head>
<!-- <body onload="showImage()"> -->
<body>
	<%@ include file="header.jsp" %>
	<div id="game-container">
		<div id="game-area">
			<ul class="top-area">
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
			</ul>
			<ul class="bottom-area">
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
				<li class="bottle">
					<img src="img/piece/1-6.png">
					<img src="img/piece/2-5.png">
					<img src="img/piece/2-4.png">
					<img src="img/piece/2-3.png">
					<img src="img/piece/2-2.png">
				</li>
			</ul>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
</body>
</html>