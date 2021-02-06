package a02_object.a01_const;

public class MainClass {
	public static void main(String[] args) {
		//필드의 default확인
		Car c1 = new Car(); //default생성자 호출
		//객체는null, 숫자형 데이터는0, boolean는 false
		System.out.println(c1.company);
		System.out.println(c1.model);
		System.out.println(c1.maxSpeed);
		System.out.println(c1.isAuto);

		
	}
	

}
