package a02_object.a06_acess.a03_woodhome;

public class Son2 extends WoodCutter{
	//상속과 접근제어자의 관계
	void callFather() {
		//상속해주는 WoodCutter의 필드에 대한 접근..
		//1. 상속이란 ? 상위 있는 멤버(필드, 생성자, 메서드)를 그대로
		//	 접근제어자 범위한계 내에 사용할 수 있다는 의미이다.
		//System.out.println("private:"+priv);
		//		접근제어자 private로 설정되어 있기때문에 상속이 하더라도
		//		사용할 수 없다.
		System.out.println("default:"+familyPlan);
		//		같은 패키지이기에 접근이 가능..
		System.out.println("protected:"+cacheInheritMoney);
		
		System.out.println("public:"+weddingDate);
	}


}