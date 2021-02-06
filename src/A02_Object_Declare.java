
//클래스는 객체를 위한 설계도
class Person{
	//1. 필드 선언
	String name;
	int age;
	String loc;
	
	//2. 생성자 선언(필드를 초기화)
	Person(String name, int age, String loc){
		//this : 현재 객체가 생성되었을 때, 해당 객체를 지칭
		//this.name : 현재객체가 가지고 있는 필드인 name을 지칭
		this.age = age;
		this.name = name;
		this.loc = loc;
	}
	
	//3. 기능 메서드 선언..
	void showInfo() {
		System.out.println("# Person 객체가 가지는 정보 출력 #");
		System.out.println("이름:"+name);
		System.out.println("나이:"+age);
		System.out.println("사는 곳:"+loc);
	}
}
class Product{
	String product;
	int price;
	int cnt;
	
	Product(String product, int price, int cnt){
		this.product = product;
		this.price = price;
		this.cnt = cnt;
	}
	//기능 메서드 선언 void : 리턴값이 없음(동전을 자판기에 넣고 누르면 음료수가 나오는것과 동일)
	void buy() {
		System.out.println("# Product 객체가 가지는 정보 출력 #");
		System.out.println("물건이름:" + product);
		System.out.println("물건가격:" + price);
		System.out.println("물건갯수:" + cnt);
		
	}
}

public class A02_Object_Declare {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//메인메서드가 있는 곳에서 호출하는 순간에 객체가 생성된다.
		
/*
 * 1. 객체(Object)
 * 		1) 물리적으로 존재하는 것(자동차, 책, 사람...)
 * 		2) 추상적인것(회사, 날짜) 중에서 속성, 동작을 가지는 것은 포함한다.
 * 		3) 객체의 구성요소
 * 			- 메모리 : field (공이날아와서 맞았을때 아팠던 기억)
 * 			- 새로 만들어질 때, 기본 처리 : constructor(생성자)
 * 			- 동작/기능 : 메서드(method)
 * 				class Person{
 * 					int age;
 * 				}
 * 
 * 2. 클래스와 객체
 * 		1) 클래스가 선언된 이후에 main()메서드를 통해서, 객체를 생성하고
 * 			해당 객체를 사용할 수 있다.
 * 		2) 선언된 클래스를 객체로 생성
 * 			- 클래스명 참조변수;  			==> 선언
 * 			- 참조변수 = new 생성자명(); 		==>객체 생성과 메모리 할당
 * 			- 참조변수.필드;
 * 			- 참조변수.메서드명();
 * 
 * 	
 */
		//Person p01 = new Person("홍길동",25,"서울 신림동");
		Person p01 = null;
		p01 = new Person("홍길동", 25, "서울 신림동");
		System.out.println("필드 확인 이름:"+p01.name);
		//메서드 확인
		p01.showInfo();
		System.out.println("\n");
/*
 * ex) class Product를 선언하고, 필드로 물건명 가격갯수 선언, 생성자를 통해서 할당.
 * 		buy()메서드를 통해서 구매정보를 출력, main()에서 호출 처리하세요
 * */
		//객체 선언, 생성자를 통해서 필드값 초기화..
		Product p02 = new Product("사과", 3000, 2);
		System.out.println("필드 확인 이름:"+p02.product);
		p02.buy();
		//p02와 p03은 동일한 클래스를 통해서 만들어 지지만
		//heap영역의 메모리가 다르고, 할당하는 데이터도 다르게 처리된다.
		//두 객체는 틀/설계도가 같은 클래스에서 나온 다른 객체를 말한다(ex. 제주도에 지은 63빌딩)
		Product p03 = new Product("바나나", 4000, 5);
		System.out.println("필드 확인 이름:"+p03.product);
		p03.buy();

	}

}
