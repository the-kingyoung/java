package a00_exp.a04_1216;

public class A01_Exp {
	public static void main(String[] args) {
		
		
		

		System.out.println();
		Robot r1 = new Mz();
		Robot r2 = new Dagan();
		Robot r3 = new Tv();
		r1.run();
		r1.attack();
		r2.run();
		r2.attack();
		r3.run();
		r3.attack();
		System.out.println("ex5)");
		MySqlDao m1 = new MySqlDao();
		OracleDao o1 = new OracleDao();
		m1.lookup();
		m1.amend();
		m1.delete();
		m1.register();
		o1.lookup();
		o1.amend();
		o1.delete();
		o1.register();
		System.out.println("ex6)");


		
		
/*
1. 	추상클래스를 상속하는 것과 일반 클래스를 상속하는 궁극적인 차이점을 기술하세요.
	==> 추상클래스를 상속받은 하위 클래스에서는 추상메서드를 반드시 상속 받아야 한다.
	
	==>
	일반클래스 vs 일반클래스
		1) 상위 객체는 자체로 객체 생성이 가능하다.
		2) 하위에서 자유롭게 재활용 및 재정의 할 수 있다.
	추상클래스 vs 일반클래스
		1) 상위 클래스는 자체로 객체 생성을 하지 못한다.
			-하위 상속 클래스의 통일성 있는 사용을 목적으로 다형성 처리를 위해 만든 것이기 때문이다.
		2) 하위 클래스는 상위클래스에 정의된 추상 메서드를 반드시 재정의하여야 컴파일이 가능하다.
			추상 메서드의 강제성을 확보하여 하위클래스의 재정의 메서드 통일성을 추구할 수 있다.

2.	추상클래스에서는 두가지 유형의 메서드를 사용할 수 있다. 
	실제 메서드와 추상메서드 하위 클래스에서 이 클래스를 어떤 경우에 활용하는지를 예제를 통해서 기술하세요.
		실제메서드 	: 	공통부분을 활용하여, 효과적으로 개발을 할 수 있다.
		추상메서드 	: 	상위 클래스에서 상속받아 하위에서는 기능으로 차이가 필요한 부분을 재정의하여 사용할 수 있다.
					하위 객체에서 다형성을 추구할 수 있는 기능적인 내용을 처리한다.
	
	
3.	추상클래스로 Starcraft의 Zerg종족의 초기 유닛 Larba를 선언하고
	재정의할 메서드 attack()으로 선언하여, 하위 실제클래스로 Zerggling, Hydra, Mutal...계층 구조	화된 내용으로 실제 객체를 선언하고,
	공격방식에 따른 처리를 하세요..
	게임을 모르는 사람들은 Robot을 추상클래스(kind, attack())로 하위에 Mz, Dagan, Tv로 공격방법을
	다양하게 처리하는 것을 처리하세요.*/
		
		Larba l1 = new Dron();	//첫번째 라바를 통해서 드론을 생성
		l1.attack();	//재정의한 메서드
		l1.move();		//상위 공통 메서드
		/*
		ArrayList<Larba> list = new ArrayList<Larba>();
		list.add(new Dron());
		list.add(new Zerggling());
		list.add(new Hydra());
		list.add(new Lurker());
		for(Larba li : list) {
			li.move();
			li.attack();
		}*/
		
		
		
/*	
4.	인터페이스와 추상클래스와의 차이를 멤버를 위주로 기술하세요.
	- 인터페이스는 목적이 객체의 재활용을 위한 내용이 많다.
	멤버:
	1) 필드 :	추상메서드는 일반 필드와 동일하게 사용되지만, 
			인터페이스는 항상 [public static final]가 default로 붙은 것과 동일 작동을 한다.
			인터페이스는 static final 상수만 사용할 수 있다.
			
	2) 멤서드
		- 추상메서드 : 추상메서드를 활용하는 것은 동일하나, 인터페이스는 [public abstract]가 붙은 것과 동일한 작동을 한다. 즉, 생략가능하다.
		- default메서드	: 인터페이스를 default로 명시한 메서드가 지원된다.
		- static메서드	: 인터페이스에는 객체 생성없이 static 메서드를 활용할 수 있다.


5.	DataAccessObj라는 데이터베이스 처리하는 인터페이스를 추상메서드(조회, 수정, 삭제, 등록)으로 선언하고,
	이를 상속받은 MySqlDao, OracleDao 실제 클래스를 선언하여, 각 클래스마다 다른 처리를 구현하여
	호출할 수 있도록 하세요.
	
6. 	추상클래스와 인터페이스를 통한 익명클래스를 생성하여, 처리하는 예제를 구현하세요.
	Larba/Robot	DataAccessObj를 활용하여 처리.
	==> 추상클래스나 인터페이스를 상속받는 하위 실제 클래스를 통해서 해당 내용을 사용하는게 일반적이지만,
		main()나 호출하는 곳에서 바로 이름없이 정의하여 재정의된 메서드나 공통 메서드를 사용하는 것을 말한다.
 */
		//상속받은 하위 클래스를 하위 객체 이름없이 바로 선언하여 처리한다.
		//# 주의 - 추상클래스, 인터페이스가 객체가 생성된 것이 아니고,
		//	폴리모피즘(상위 = 하위)에 의해서 이름없는 실제객체를 정의 및 생성해놓은 것이다.
		//	정의된 내용을 메서드나 생성자를 통해서 사용할 수 있다.
		Larba al = new Larba("뮤탈리스크") {

			@Override
			void attack() {
				// TODO Auto-generated method stub
				System.out.println("날면서 원거리 공격을 하다.");
			}
		};//선언과 동시에 객체 생성.
		al.move();
		al.attack();
		
		DataAccessObj dao = new DataAccessObj() {

			@Override
			public void lookup() {
				// TODO Auto-generated method stub
				System.out.println("익명 DB를 조회하다. ");
				
			}

			@Override
			public void amend() {
				// TODO Auto-generated method stub
				System.out.println("익명 DB를 수정하다. ");
			}

			@Override
			public void delete() {
				// TODO Auto-generated method stub
				System.out.println("익명 DB를 삭제하다. ");
			}

			@Override
			public void register() {
				// TODO Auto-generated method stub
				System.out.println("익명 DB를 등록하다. ");
			}
			
		};
		dao.lookup();
		dao.amend();
		dao.delete();
		dao.register();
	}

}