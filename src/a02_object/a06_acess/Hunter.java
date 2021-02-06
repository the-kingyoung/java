package a02_object.a06_acess;

import a02_object.a06_acess.a02_friendship.WoodCutter;

public class Hunter {
	void callWoodCutter() {
		//public class WoodCutter이고, default생성자
		//이기에 객체 생성까지는 가능
		WoodCutter c1 = new WoodCutter();
		//System.out.println(c1.cacheDress);
		//private이기에 같은 패키지에서도 접근이 불가능
		
		//System.out.println("사슴이 숨은 곳:"+c1.cacheDeer);
		//다른 패키지이기에 접근이 불가능..
		
		System.out.println(c1.weddingDate);
		//public은 접근이 가능하다.
	}

}
