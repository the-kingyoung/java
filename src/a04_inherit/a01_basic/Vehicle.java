package a04_inherit.a01_basic;

public class Vehicle {
	private String kind;

	public Vehicle(String kind) { // 매개변수 있는 생성자
		this.kind = kind;
	}

	public void show() {
		System.out.println("탈 것의 종류는 " + kind + " 입니다.");
	}
}

class Car extends Vehicle {

	public Car() {
		super("자동차");//생성자 호출하는 방법
	}
}
class Bus extends Vehicle{

	public Bus() {
		super("버스");//생성자 호출하는 방법
		// TODO Auto-generated constructor stub
	}
}