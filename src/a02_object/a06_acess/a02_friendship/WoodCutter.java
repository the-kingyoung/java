package a02_object.a06_acess.a02_friendship;

public class WoodCutter {
	//WoodCutter의 멤버를 기준으로
	//다른 객체에서 접근이 가능한지 여부를 확인하는 내용이다.
	//ex)
	//접근제어자?? 변수명 cacheDeer
	//접근제어자??	변수명 cacheDress;
	//접근제어자??	변수명 weddingDate;
	//다른 외부 클래스에서 호출 가능한지 여부를 확인..
	
	private String cacheDress="옷을 바위 뒤에 숨김.";
	//다른 어떤 클래스에서도 접근이 불가능
	String cacheDeer="사냥꾼으로부터 사슴을 나무 뒤에 숨겨준다.";
	//default 접근제어자.
	public String weddingDate = "많은 사람들에게 결혼 축하를 받는다.";
	//모든 클래스에서 접근이 가능함
	
	

}
