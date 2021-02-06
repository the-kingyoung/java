package a00_exp.a03_1215;

class TaekwonV extends Robot {

	public TaekwonV() {
		super("태권V");
	}
	public String attack01() { //상위에 있는 메서드 재정의
		System.out.println(super.attack()+"가 미사일을 날립니다.");
		return super.attack();
	}
	
}
class MazingaZ extends Robot {

	public MazingaZ() {
		super("마징가Z");
	}
	public String attack02() {
		System.out.println(super.attack()+"가 로켓펀치를 날립니다.");
		return super.attack();
	}
	
}
public class Robot {
	private String name;

	public Robot(String name) {
		super();
		this.name = name;
	}
	public String attack() {
		//System.out.println("높이 날아올라 공격 준비를 한다.");
		return name;
	}

}
