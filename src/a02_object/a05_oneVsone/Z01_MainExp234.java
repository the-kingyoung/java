package a02_object.a05_oneVsone;

public class Z01_MainExp234 {
/*
# 객체지향 프로그램에서 관계 설정이란 ?
1. 객체는 객체안에서 메모리를 설정해서 사용할 수 있다.
	  ex) 자동차라는 객체 안에는 핸들객체, 바퀴객체, 엔진객체들이 각각의 속성과 속성값을 가지고 
		  유기체적으로 연관관계를 만들어 수행하듯이 
		  객체지향프로그램에서는 객체와 객체의 연관관계를 아는 것이 중요하고, 
		  그 연관관계 프로그래밍을 하여야 한다. 

2. 객체안에 객체의 선언과 활용.
	1) 포함될 객체부터 class로 먼저 선언..
		class Woman{}
	2) 포함할 객체에서 필드나 메서드안에서 선언하여 활용을 할 수 있다.
		class Man{
			int age;
			Woman woman;
		}
	3)main()에서 실제 메모리를 만들어 할당한다.
		Woman woman = new Woman();
		Man man = new Man();
		man.woman=woman; // Man객체 안에 Woman객체를 할당..
		man.woman = new woman(); 
			//Man객체 안에 woman객체에 생성하면서 바로 할당.


*/

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_Woman w1 = new A02_Woman("송지나");
		System.out.println("w1.name : "+w1.name);
		A01_Man m1 = new A01_Man("김철수");
		System.out.println("m1.name : "+m1.name);
		//A02_Woman에서 생성된 w1을 A01_Man의 m1 하위에 있는
		//Woman메모리에 할당 처리
		//m1 객체에 종속적인 메모리에 있는 woman에 할당처리..
		m1.woman = w1;
		A01_Man m2 = new A01_Man("마승수");
		m2.woman = new A02_Woman("김신영"); //m2에 종속적인 Woman처리.
		//종속적인 woman의 속성 추력..
		System.out.println("Man종속적 woman의 이름:"+m1.woman.name);
		System.out.println("Man종속적 woman의 이름:"+m2.woman.name);
		
/*
 ex)	Product에 필드 : 물건명 가격
 		Buyer 필드 : 구매자 이름, Product를 할당하여, 
 					객체 생성자 할당하고 할당된 속성값을 확인 하도록 하세요.
 */
		A03_Product p1 = new A03_Product("바나나", 4000);
		A04_Buyer	b1 = new A04_Buyer	("이영업");
		b1.prod = p1;
		System.out.println(b1.name);
		System.out.println(b1.prod.name);
		System.out.println(b1.prod.price);
		A04_Buyer	b2 = new A04_Buyer("이상만");
		//객체를 생성과 함께 바로 할당 처리..
		b2.prod = new A03_Product("오렌지", 3000);
		System.out.println(b2.name + " 소속 product 객체");
		System.out.println(b2.prod.name);
		System.out.println(b2.prod.price);
		
		

		
		
	}

}

