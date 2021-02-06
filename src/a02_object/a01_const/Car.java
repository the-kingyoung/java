package a02_object.a01_const;

public class Car {
	//필드 default 처리
	String company;
	String model;
	int maxSpeed;
	boolean isAuto;
	//생성자
	//1. 클래스명과 동일하다.
	//2. 생성자를 선언하지 않으면 default 생성자가 내부적으로 생성되어 있다가 선언하는 순간 사라진다.
	//		public Car(){} ==> 내부적으로 만들어 진다.
	Car(){
		
	}
	//3. 생성자를 여러개 overloading 규칙에 의해서 선언할 수 있다.
	//		1)갯수가 다를 때..
	Car(String company){
		this.company = company;
	}
	//		2)type이 다를 때..
	Car(int maxSpeed){
		this.maxSpeed = maxSpeed;
	}
	//		3)갯수와 type이 같더라도 순서만 다르게 선언하면 가능
	Car(String company, int maxSpeed){
		this.company=company;
		this.maxSpeed = maxSpeed;
	}
	Car(int maxSpeed, String company){
		this.maxSpeed = maxSpeed;
		this.company=company;
	}
	//생성자를 일반적으로 return값이 없고, field를 초기화 한다.
	Car(String company, String model, int maxSpeed, boolean isAuto){
		//this.xxx : 매개변수의 이름과 필드의 이름이 동일할 때, 구분해주기 위해서 사용된다.(자바)
		this.company = company;
		this.model = model;
		this.maxSpeed = maxSpeed;
		this.isAuto = isAuto;
		//메인 메서드에서는 class 선언한 생성자 중에 하나를 선택해서 객체로 생성을 한다.
		//한 객체는 한 생성자를 사용한다.
		Car c2 = new Car("현대자동차","에쿠스",250,true);
		System.out.println("# c2:"+c2+"#");
		System.out.println("c2.company:"+c2.company);
		
	}
	
	

}
