package a02_object.a05_oneVsone;

public class A07_Car {
	String name;
	int maxSpeed;

	public A07_Car(String name, int maxSpeed) {
		super();
		this.name = name;
		this.maxSpeed = maxSpeed;
	}

	void showInfo() {
		System.out.println("# 자동차 정보 #");
		System.out.println("자동차명 : " + name);
		System.out.println("최고속도 : " + maxSpeed);
	}

}