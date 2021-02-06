package Practice_kingyoung;

public class Practice {
	public static void main(String[] args) {
		Phone1 p1 = new SmartPhone("010889919299");
		p1.turnOn();
		p1.specialFunc();
		p1.turnOff();
	}
}
abstract class Phone1{
	private String num;

	public Phone1(String num) {
		super();
		this.num = num;
	}
	abstract void specialFunc();
	
	public void turnOn() {
		System.out.println("전원을 켜다.");
	}
	public void turnOff() {
		System.out.println("전원을 끄다.");
	}
}
class SmartPhone extends Phone1{

	public SmartPhone(String num) {
		super(num);
		// TODO Auto-generated constructor stub
	}

	@Override
	void specialFunc() {
		System.out.println("인터넷 검색을 하다.");
		// TODO Auto-generated method stub
		
	}
	
}