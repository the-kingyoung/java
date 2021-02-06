/*
[데이터베이스]
[하] 1. 데이터베이스 모델링에서 개념적 모델링과 논리적 모델링에 대하여 기술하세요.
	- 개념적 모델링이란 현실세계의 중요 데이터를 추출하여 개념 세계로 옮기는 작업을 말한다.
	즉, 요구사항을 기초로 하여 핵심 개념, 프로세스를 도출하는 것이다.
	논리적 모델링이란 개념적 모델링을 기초로 하여 각 개념을 구체화 하는 것이다.
	
[중] 2. StarUML에서 ERD를 통해서 학생(학번,이름,학과명,학년), 
 수강, 교수(교수번호,이름,수업과목)테이블을 만들고 도출된 연관 관계를 설정하세요.*/

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*[하] 1. 테이블에서 table로 테두리와 2중선 변경 옵션을 선언하세요.*/
table {
	border-collapse: collapse;
}
/*[하] 2. th,td에 대한 정렬과 높이를 지정할려고 한다. 예제를 통해 지정 처리하세요*/
th, td {
	text-align: center;
	height: 10px;
}
/*[하] 3. 행별로 배경색상을 처리하고 마무스 커서 위치시 색상 변경하는 설정을 기술하세요.
tbody tr:nth-child(even){
	background : pink;
}
tbody tr:hover{
	background : yellow;
}*/
/*[하] 4. 조별 과제의 회원등록/게시판 화면으로 오늘 배운 테이블과 폼 css적용하여 만들어 보세요.*/
input[type=text] {
	color: pink;
}

input:hover, textarea:hover {
	background: aliceblue;
}

input[type=text]:focus, input[type=email]:focus {
	font-size: 120%
}

span {
	display: inline-block;
	width: 90px;
	text-align: right;
	padding: 10px;
}
/*[하] 5. javascript란 무엇인가?
	- 웹브라우저에서 많이 사용하는 front end단 프로그래밍 언어를 말한다.
[하] 6. javascript가 head부분에 선언되었을 때와 body 밑에 선언되었을 때의 차이점은 무엇인가?
	- head부분에 선언이 되었을때 body태그가 실행되기 전에 실행되므로 실행이 되지 않을 수가 있다.
		단, 함수로 불러서 사용하는 것은 가능하다.
		반면 body태그 밑에 선언이 되었을때는 위에서 아래로 태그들이 실행되어 문제없이 실행이 가능하다.
[하] 7. 변수 선언에 있어서, java와 javascript의 차이점을 기술하세요.
	- javascript의 경우 java와는 달리 초기에 데이터 유형을 선언하지 않고 
		값을 할당한 후에 해당 변수 데이터유형이 만들어진다.
		예를 들어 java에서는 int num=1; 과 같은 형식으로 데이터유형 할당과 함께 변수를 선언해야하지만
		javascript에서는 var score=100; 과 같이 데이터 유형을 할당하지 않고 변수 선언이 가능하다.
*/
/*
</style>
</head>
<body>
	<hr>
	<form>
		<table align="center">
			<caption>회원가입</caption>
			<tbody>
				<tr>
					<td><span>이름</span></td>
					<td><input type="text" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<td><span>아이디</span></td>
					<td><input type="text" placeholder="아이디를 입력해주세요."></td>
				</tr>
				<tr>
					<td><span>비밀번호</span></td>
					<td><input type="password" placeholder="비밀번호를 입력해주세요."></td>
				</tr>
				<tr>
					<td><span>email</span></td>
					<td><input type="email" placeholder="www.asdf@asdf.com"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea placeholder="내용을 입력해주세요."
							width="100%" height="100"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="가입신청"
						onclick="alert('잠시만 기다려주세요.')"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
*/