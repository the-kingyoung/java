package a02_object.a05_oneVsone;

public class A08_Driver {
	String name;
	A07_Car c1;

	public A08_Driver(String name) {
		super();
		this.name = name;
	}

	void drivingCar() {
		System.out.println(name + " ");
		if (c1 == null) {
			System.out.println("차가 없네요 !");
		} else {
			System.out.println(c1.name + "차를 몰고");
			System.out.println("최고 속도" + c1.maxSpeed + "km/h로 주행합니다.");
		}
	}

}
