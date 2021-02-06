package a02_object.a05_oneVsone;

public class A09_Robot {
	String kind;
	A10_Weapon weapon;
	
	public A09_Robot(String kind) {
		super();
		this.kind = kind;
	}
	//1:1관계에서 메서드를 통해서 할당
	//
	//메서드에 의해 장착 처리..
	
	void setWeapon(A10_Weapon weapon) {//A10_Weapon weapon =new A10_Weapon weapon("니킥",80)
		this.weapon = weapon;//전역 필드에 있는 new A10_Weapon weapon에 할당처리
	}
	/*
	 main()
	 	r1.setWeapon(new A10_Weapon weapon("니킥",80));
	 
	 
	 	A09_Robot r1 = new A09_Robot("로봇1")
	 	//로봇객체가 생성이 되고, field kind에 문자열 "로봇1"이 할당되어 있는 상황
	 	r1.attack();
	 		weapon.show();
	 		//null조건 없이 객체의 메서드를 사용하면 A10_Weapon weapon에
	 		//객체가 할당되지 않았기 때문에 NullPointerException이 발생되어 프로그램을 수행할 수 없다.
	 		if(weapon!=null){//heap 메모리가 할당되었을 때.
	 		
	 		}else{ //heap 메모리에 할당되지 않았을 때.
	 		
	 		}
	 
	 */
	void attack() {
		System.out.println(kind+" 공격을 한다.");
		if(weapon!=null) {//무기가 할당됨..
			System.out.println("무기로 공격을 한다.");
			weapon.show();
		}else {//무기가 할당 되지 않음..
			//void setWeapon(A10_Weapon weapon)를 통해서,
			//객체가 할당되지 않는 경우..
			//조건문이 없으면 할당되지 않을 경우도..weapon.show()가
			//호출되기에 NullPointerException 발생
			System.out.println("무기가 할당되지 않음..");
		}
	}
}
