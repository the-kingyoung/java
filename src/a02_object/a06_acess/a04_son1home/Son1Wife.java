package a02_object.a06_acess.a04_son1home;

import a02_object.a06_acess.a02_friendship.WoodCutter;

//상속 관계가 없는 외부 클래스..
public class Son1Wife {
	void callFather() {
		WoodCutter c1 = new WoodCutter();

	//	System.out.println("private:"+c1.priv); 클래스가 다르기에 접근이 안됨
		
	//	System.out.println("default:"+c1.familyPlan);
	//		같은 package에 있지 않기 때문에 상속관이더라도 접근이 불가능
	//	System.out.println("protected:"+c1.cacheInheritMoney);
	//		상속관계에 있을 때만, 외부패키지일지라도 접근이 가능.		
		System.out.println("public:"+c1.weddingDate);
	//		상속관계에 상관없이 모든 패키지에 접근이 가능 하다.
	}

}
