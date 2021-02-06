package a02_object.a05_oneVsone;

public class Z01_MainExp {
	public static void main(String[] args) {

		A05_Product p2 = new A05_Product("사과", 3000, 2);
		A06_Buyer b3 = new A06_Buyer("김철수");
		// A05_Product가 A06_Buyer에 할당되지 않았을 때, 처리할 내용
		System.out.println("# 물건정보가 할당되지 않을 #");
		b3.showBuyInfo();
		b3.prod = p2;// 물건 정보를 할당 했을 때
		b3.showBuyInfo();
		
/*	
#1:1관계 설정 연습..
1. Car 필드 : 자동차명, 최고속도  메서드 : showInfo()가지고있는 정도 출력
2. Driver 필드 : 이름, Car
	메서드 drivingCar()	@@@가 차가 없네요..
						@@@가 @@@차를 몰고 최고 @@속도로 주행합니다.
*/
		
		
A08_Driver d1 = new A08_Driver("마길동");
d1.drivingCar();
d1.c1 = new A07_Car("머스탱", 300);
d1.drivingCar();
}

}
