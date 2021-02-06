package a04_inherit.a01_basic;
class Mother01{
	//1. 선언하지 않을 때, default 생성자 호출..
	String name1="어머니 객체";
	//2. 매개변수가 없는 생성자 선언.
	Mother01(){
		System.out.println("상위 객체 생성자(어머니)");
	}

}

class Son01 extends Mother01{
	//1. 선언하지 않을 때, super()가 포함된 default 생성자 호출
	String name2 = "아들 객체";
}
class Mother02{
	Mother02(String name){}//매개변수 있는 생성자.
}
class Son02 extends Mother02{

	Son02() {
		
		super("문자열 데이터");		
		//반드시 상위에 있는 생성자를 호출하여야 한다.
		//상위 생성자는 가장 먼저 호출하여야 한다.
		System.out.println("하위 생성자!!");
		// TODO Auto-generated constructor stub
	}
	
}

public class A02_Constructor {
	public static void main(String[] args) {
		
/*
#부모 생성자 호출.
1. 하위 객체는 부모객체의 생성자와 함께 객체를 생성한다.
	- default생성자 활용시, default 생성자 안에 부모 생성자 호출코드와 함께 처리.
	- 부모 생성자 호출 완료 후, 자식 생성자의 처리가 완료된다.
	
2. 상속시 생성자 처리 원칙
	- 반드시 상위 생성자를 호출하여야 한다는 원칙에 의해서 하위 생성자는 반드시
	  상위 선언된 매개변수의 type에 맞는 생성자를 호출하여야 한다.
	-매개변수가 없는 것 type에 맞게 생성자 호출된다. 상위에 없는 것도 하위에서는 없는 생성자호출도 이 범위에 포함된다.
	-상위 클래스에 매개변수 없는 생성자를 선언하고, 하위클래스에서 상속을 한다면 ?(Vehicle예제)
	
 */		//Q1) 왜? 하위 객체 생성자를 호출했는데, 상위객체의 매개변수 없는 생성자의 내용이 출력될까?
		//		 - 	하위 객체 생성시는 반드시 부모객체의 생성자를 호출하여야 한다.
		//			default 생성자 public Mother01(){}(상위), public Son01(){super();}
		//			상위에 매개변수 없는 생성자 선언시, 하위에는 위와 같이 default 생성자가 자동호출되어
		//			super()에 의해서 매개변수 없는 상위 생성자를 호출하게 된다.
		//			그래서 매개변수 없는 생성자의 출력내용이 출력이 된다.
/*
# 메소드 재정의(overriding)이란?
1.	부모 클래스의 상속 메서드를 자식 클래스에서 재정의하여 
	하위 클래스의 동일한 메서드이지만 각 객체별로 특정한 처리를 하게 하는것을 말한다.

2.	메소드 재정의 규칙
		1) 부모 클래스의 메서드명과 동일하여야 한다.
		2) 접근제어자는 부모보다 더 넓어야 한다.
		
				부모			자식
			ex) default ==> default이상인 default, protected, public
				public	==> default(x)

 */
		Son01 s1 = new Son01();
		System.out.println(s1.name1);
		System.out.println(s1.name2);
		
	}

}
