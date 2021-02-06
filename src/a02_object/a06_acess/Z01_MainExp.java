package a02_object.a06_acess;

import a02_object.a06_acess.a01_acc02.Mother;
import a02_object.a06_acess.a01_acc02.Sister;

public class Z01_MainExp {
	String name;
	
/*
# Access Modifier(접근제어자)
1.	접근제어자는 클래스나 클래스안에 있는 멤버(필드, 생성자, 메서드)
	앞에 붙어서 외부 객체에 대한 접근의 범위를 설정하고,
	설정된 범위에서만 접근을 해서 사용할 수 있게 만드는 것을 말한다.
	
2. 	접근제어자를 파악하기 위한 사전 지식.
		1)package : 자바의 모든 클래스는 패키지라는 단위 안에 포함되어 있다.
			-물리적으로 folder개념과 함께 활용된다.
			-패키지 하위에 여러개의 클래스가 포함되어 있다.
			-패키지는 계층 개념보다는 클래스명 위에 패키지명으로 식별한다.
			//()패키지 하위에 있는 ()클래스
			//()패키지 하위에 있는 클래스 계층구조 영향 없이 다른 패키지로 인식한다.
				하위에 있는 패키지의 클래스간의 접근에 전혀 영향이 없다.
				다른 패키지로 인식한다.
			-접근제어범위가 package안에 있는 클래스끼리는
				접근제어자(default-접근제어자가 없는 것)범위로 접근이 자유롭다.
				앞에 접근제어자 private가 붙으면 접근이 불가능하다.	
		
		2)import
			-접근제어자 허용 범위에 있는 패키지가 다른 클래스를 호출할 때,
				첫번째 : 패키지명.클래스명		참조 = new 패키지명.클래스명();
				두번쨰 : import 패키지명.클래스명; 를 class명 상단에 선언하고,
						클래스명 참조 = new 생성자명();
			-api에 있는 클래스(자바에서 내장된 클래스)를 사용할 때, java.lang.*하위에 있는 패키지 이외에 
			 클래스를 사용할 떄, import java.@@@.클래스명으로 사용한다.

3. 접근제어 종류
	private(클래스만), X(default 패키지만), protect(상속관계), public(공용)
	1) private 		: 현재 정의된 클래스 내에서만 사용하는 구성요소를 접근제어자 설정..
	2) X(default) 	: 접근제어자가 선언되어 있지 않는 것을 말한다. 패키지 내에서만 접근이 가능하다.
	3) protect		: 
	
	
4. class와 구성요소에 대한 접근 제어.
	1) public class 클래스명{}
		클래스명.java로 선언된다.
		하나의 클래스 파일 .java 파일에 public클래스는 하나만 선언한다.
			-하나의 여러개의 클래스가 선언될 수 있는데, 이 중에 하나만 파일명으로 된
			 public클래스가 선언될 수 있다.
		main()가 포함된 클래스가 public 클래스가 된다.
	

	
 */
	public static void main(String[] args) {
		//# 외부에 있는 패키지의 클래스 사용하기
		//0. 접근제어자 범위 안에 있을 public, protected
		//1. 패키지명.클래스
		//2. import 패키지명.클래스명;
		//	 import 패키지명.*;
		//	 클래스명 참조변수;
		a02_object.a06_acess.a01_acc02.Father f1 = null;
		f1 = new a02_object.a06_acess.a01_acc02.Father();
		
		Mother m1 = new Mother();
		Sister s1 = new Sister();
		//각 클래스의 member는 private, default이기 때문에 
		// 다른 패키지에서는 사용이 불가능하다.
		//System.out.println(m1.sec01);(X)
		//System.out.println(m1.dinnerFood);(X)
		System.out.println(m1.announce);//(O)
		
/*
ex) 선녀와 나무꾼
 */
/*
ex) protected 관련예제 만들어 보기
	a05_grandhome
		-GrandFather클래스 하위 
		-접근제어자 protected로 earnMoney 문자열 변수 선언
	a06_ourhome
		-Father
		callGrandFather()를 통해서 사용여부를 확인한다.
		
 */
	}

}
