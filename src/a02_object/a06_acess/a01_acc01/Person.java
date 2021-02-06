package a02_object.a06_acess.a01_acc01;

public class Person {
	private String name="홍길동";	//	현재 클래스 외에는 사용이 불가능.
	int age=25;	//	age 같은 패키지까지 접근 가능..default==같은패키지범위까지 접근이 가능
	Person(){
		System.out.println("이름 : "+ name);
	}
	void callPerson() {
		System.out.println("이름 : "+ name);
	}
	

}
