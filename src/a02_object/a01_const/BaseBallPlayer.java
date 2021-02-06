package a02_object.a01_const;

public class BaseBallPlayer {
	String company;
	String name;
	double rate;
	
	BaseBallPlayer(){
		company="무소속";
		name="익명";
		
	}
	
	BaseBallPlayer(String name){
		//# 전역변수와 지역변수
		/*
		 1. 전역변수 : 클래서에 전체적으로 영향을 미치는 변수
		 			클래스선언 하위에 선언되 필드가 전역변수로 사용된다.
		 			1) 클래스의 구성요소인 생성자와 메서드에 영향을 미치고
		 			2) 이름이 동일한 생성자 또는 메서드에 있는 지역변수와 
		 				구분하기 위해서 this.전역변수=지역변수.
		 			
		 2. //지역변수
			//특정한 블럭(중괄호{})안에서 선언하여 사용하는 변수
			1. 매개변수 ex) BaseBallPlayer(String name)
			2.중괄호블럭안에서 새로 선언된 변수
				void call(){
					int age = 25;
				}
				this.변수 : 지역변수와 이름이 같을 때 구분하여 사용한다.
			3. 자바에서는 지역변수가 이름이 겹치지 않으면 this 없이도 사용하여도 무방하다.
				아래의 company는 필드 (전역변수)이지만 중괄호 내에 동일한 지역변수가 없기 때문에 선언된 내용으로 사용할 수 있다.
		 */
		this.name = name;
		company="무소속";
	}
	BaseBallPlayer(String company, String name, double rate){
		this.company=company;
		this.name = name;
		this.rate = rate;
	}

}
