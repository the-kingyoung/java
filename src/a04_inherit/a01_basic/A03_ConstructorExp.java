package a04_inherit.a01_basic;

public class A03_ConstructorExp {
	public static void main(String[] args) {
		Car c1 = new Car();
		c1.show();
		Bus b1 = new Bus();
		b1.show();
		
		
		Policeman p1 = new Policeman();
		p1.working();
		Fireman f1 = new Fireman();
		f1.working();
	}

}
/*ex) Worker 필드 : 일의 종류
 * 	  메서드		 : working() @@가 일을 합니다
 	  하위 클래스 : PoliceMan, FireMan
 * 선언과 함께 상위 생성자를 호출하세요.
 */
//1. 매개변수가 있는 상위 클래스
	
