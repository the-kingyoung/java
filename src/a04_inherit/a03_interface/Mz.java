package a04_inherit.a03_interface;

public class Mz {
	private String name;
	private Flyway flyway;
	private AttackWay attackWay;

	public Mz() {
		super();
		name="마징가Z";
	}
	//날개 실제 객체가 들어올 수 있게 선언. 
	//Flyway flyway = new Wing();

	public void setFlyway(Flyway flyway) {
		this.flyway = flyway;
	}
	public void setWeapon(AttackWay attackWay) {
		this.attackWay = attackWay;
	}

	public void run() {
		System.out.println(name+"가 뛰어 다닌다.");
	}
	public void attack() {
		System.out.println(name+"가 공격을 한다.");
		if(attackWay!=null) {
			attackWay.attack();
		}else {
			System.out.println("무기가 장착이 되지 않았습니다.");
		}
	}
	public void fly() {
		//인터페이스에 setFlyway()메서드에 의해 실제 객체가 할당되었을 때..
		if(flyway!=null) {
			System.out.print(name+"는 ");
			flyway.flying();
		}else {
			System.out.println(name+"에는 날개가 아직 장착되지 않았습니다.");
		}
	}

	

}
