package a02_object.a06_acess.a01_acc01;

public class Animal {
	void call() {
		//객체 생성..
		//1. 접근 제어자 확인 : public class Person{}
		//		클래스 선언 부분 - 외부에 모든 클래스에서 접근이 가능..
		//		Person p01
		//2. new Person() : 생성자에 대한 접근이 가능할 때, 처리될 수 있다.
		Person p01 = new Person();
		//Animal 클래스와 Person는 같은 패키지에 있지만,
		//구성요소의 접근 제어자 범위가 private인 경우에는 접근이 불가능하다.
		//System.out.println(p01.name);
		System.out.println(p01.age);
	}

}
