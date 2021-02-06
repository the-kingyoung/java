[데이터베이스]
[하] 1. 제약조건의 이름 설정과 바로 선언하여 사용하는 경우의 차이를 기술하세요.
		- 제약조건의 이름을 설정하지 않는 제약조건은 oracle 시스템에 지정한 네이밍규칙에 의해 자동으로 만들어진다.
		- constraint로 제약이름을 설정하지 않으면 시스템이름으로 자동 생성된다.
		- 메터데이터로 해당 제약이름을 조회하거나 일괄관리시 이름 정하면 효과적으로 처리할 수 있다.
		
[하] 2. foreign key 기본 형식을 선언하세요.
		- 컬럼명 데이터유형 constraint 제약조건명 references 참조할테이블(참조할컬럼)
[js]
[하] 1. if문, if else문,switch문, for문/while 기본형식
		 	if(boolean)조건문
		 	if(boolean){
		 		조건문1
		 	}else{
		 		조건문2
		 	}
		 	switch(){case: ;}
		 	for(초기;반복조건;증감연산자){
		 	}
			while(){} 											*/

//[하] 3. 3 * 3 테이블을 생성해보세요 
var show1 = "<table width='30%' border>";

	for(var cnt=1; cnt<=9; cnt++){
		if(cnt%3==1){
			show1+="<tr>"
		}
		show1 += "<td>"+cnt+"</td>"
		if(cnt%3==0){
			show1 += "</tr>";
		}
	}show1 +="</table>"
		
	document.body.innerHTML += show1;