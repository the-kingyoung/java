

class Person01 {
	// 1. 선언하지 않으면, 내부적으로 보이지는 않지만, default 생성자가 만들어져있다.
	// public Person01(){}
	// 2. 하나라도 명시적으로 선언하는 순간, 보이지 않는 default생성자는 사라진다.
	public Person01(String name) {
		System.out.println("매개변수가 있는 생성자 선언(문자열 매개)");
	}

	// 3. overloading : 같은 이름으로 생성자나 메서드를 선언할 수 있는 규칙을 말한다.
	int age;
	// int age; 변수는 동일한 이름을 선언할 수 없다.
	
	// 같은 이름으로 생성자와 메서드를 선언할 수 있는 이유는 이름만으로 식별하지 않기 때문이다
	// 이름 + 생성자/메서드 매개변수의 type, 갯수, type이 다른 순서로 식별한다.
	public Person01(int age) {
		System.out.println("매개변수가 있는 생성자 선언(정수 매개)");
	}

	public Person01() {
		System.out.println("매개변수가 없는 생성자.");
	}

	public Person01(String name, int age) {
		System.out.println(name + ":" + age);
	}

	public Person01(int age, String name) {
		System.out.println(age + ":" + name);
	}
}

public class A03_Constructor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 * # 접근제어자와 클래스, 생성자, 필드 간의 관계는 접근제어자 편에서 진행
		 * 
		 * # 생성자 
		 * 1. 클래스명과 동일한 객체의 기능 구성요소이다. 
		 * 2. 기능 : 객체를 생성하고, 필드 데이터를 초기화하는 역할을 한다. 
		 * 3. 메서드와의 차이는 return값이 없고, 하나의 객체안에는 하나의 생성자만 사용할 수 있다. new Person()
		 * 
		 */
		// Person01 p01 = new Person01(); //에러없이 호출.(없을 때는 가능)
		// 생성자가 선언되는 순간 없어짐
		// 에러 발생

		Person01 p01 = new Person01("문자열 호출");
		System.out.println(p01);
		Person01 p02 = new Person01();
		// p02참조 변수는 매개변수가 없는 생성자를 선택해서 객체가 생성되었다.

	}

}
