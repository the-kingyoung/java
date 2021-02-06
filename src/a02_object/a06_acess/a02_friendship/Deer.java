package a02_object.a06_acess.a02_friendship;

public class Deer {
	void callWoodCutter() {
		WoodCutter c1 = new WoodCutter();
		//System.out.println(c1.cacheDress);
		//private이기에 같은 패키지에서도 접근이 불가능
		//접근이 가능하다라는 말은 외부 다른 객체에서 해당 멤버를 
		//참조변수.멤버 : 호출하는 것이 가능한지 여불ㄹ 확인하는 부분이다.
		System.out.println("사슴이 숨은 곳:" + c1.cacheDeer);
		//같은 패키지이기 떄문에 접근 가능
		
		System.out.println(c1.weddingDate);
		//public은 같은 패키지뿐만 아니라 외부패키지에서도 
		//접근이 가능하다.
	}

}
