package a00_exp.a04_1216;
/*
	게임을 모르는 사람들은 Robot을 추상클래스(kind, attack())로 하위에 Mz, Dagan, Tv로 공격방법을
	다양하게 처리하는 것을 처리하세요.
 */
abstract class Robot {
	private String kind;
	
	public Robot() {
		super();
		this.kind = kind;
	}
	abstract void attack();
	
	public void run() {
		System.out.print("달려가서 ");
	}
}
class Mz extends Robot{
	@Override
	void attack() {
		// TODO Auto-generated method stub
		System.out.println("미사일을 발사하다.");
	}
	
}
class Dagan extends Robot{
	@Override
	void attack() {
		// TODO Auto-generated method stub
		System.out.println("경광봉으로 때리다.");
	}
	
}
class Tv extends Robot{
	@Override
	void attack() {
		// TODO Auto-generated method stub
		System.out.println("날라차기를 하다.");
	}
	
}
