package a00_exp.a03_1215;

import java.util.ArrayList;

public class A01_Exp {
	public static void main(String[] args) {
		System.out.println("ex1)");
		Computer p1 = new Computer("삼성 노트북");
		p1.addCpu(new Cpu("intel","4"));
		p1.addRam(new Ram("dell","3200"));
		p1.addHdd(new Hdd("히타치","3"));
		p1.comInfo();
		
		System.out.println("ex7)");
		Triangle t01 = new Triangle();
		t01.shapeInfo();
		Square s01 = new Square();
		s01.shapeInfo();
		Pentagon p01 = new Pentagon();
		p01.shapeInfo();
		
		System.out.println("ex8)");
		
		//상위 클래스 메모리 = 하위 클래스 메모리 할당.
		Robot r1 = new TaekwonV();
		r1.attack();
		Robot r2 = new MazingaZ();
		r2.attack();
		ArrayList<Robot> rlist = new ArrayList<Robot>();
		rlist.add(new TaekwonV());
		rlist.add(new TaekwonV());
		rlist.add(new TaekwonV());
		rlist.add(new MazingaZ());
		rlist.add(new MazingaZ());
		rlist.add(new MazingaZ());
		System.out.println("# 반복문 실행 # ");
		for (Robot r : rlist) {
			r.attack();
		}
		
/*
1. 	1:다 중 종류가 다른 객체를 포함하는 객체에 할당하는 예제를 만들어 보세요..
	1) 	컴퓨터 vs CPU/메모리/hdd
		컴퓨터 : 	필드로 컴퓨터 종류, Cpu, Ram, Hdd
				메서드 showInfo()
						@@@컴퓨터 부품 사양..
				
		Cpu, Ram, Hdd : 필드로 이름, capacity(기능속도/메모리크기)
	
2.	java에서 상속이 현실세계의 상속과 어떤점이 공통인지를 기술하고,
	기본 문법을 예제를 통해서 선언하세요.
	==>부모의 것을 자식이 물려받는 것이 공통된 점이다.
		class 자식클래스 extends 부모클래스{}
		
	//현실세계 상속과 java에서 상속은 부모로부터 물려받은 여러가지 속성을 활용할 수 있다는 것을 알수 있다.
	//특정 필드나 메서드를 활용하고 싶을 때, 선택적으로 활용할 수 있는 특징이 공통이라고 할 수 있다.
	 * class Flyway{
	 * 	private String kind;
	 * 	public Flyway(String kind){
	 * 		this.kind = kind;
	 * 	}
	 * 	public void fly(){
	 * 		syso(kind+"가 비행한다!");
	 * 	}
	 * }
	 * class AirPlane extends Flyway{
	 * 		int cnt; //탑승인원..
	 * 		public AirPlane(int cnt){
	 * 			super("비행기");
	 * 			this.cnt = cnt;
	 * 	}
	 * 	public void fly(){
	 * 		super.fly()
	 * 		syso("탑승객 "+cnt+"명을 태우고 먼 거리를 비행한다.");
	 * 	}
	 * }
	
3.	상속에서 접근제어자로 통한 한계를 기술하세요.
	==> 같은 패키지일 경우 부모의 private접근제어자 이외에는 다 접근이 가능하다.
		다른 패키지일 경우 protected, public가 접근제어자인 멤버만 접근이 가능하다.
		
		//private : 상숙에 의해서 하위 클래스가 직접적인 접근을 하지 못한다.
		X(default): 하위 클래스가 패키지가 다를 때, 접근을 하지 못한다.
		protected, public : 외부 패키지일지라도 접근이 가능.
		# 필드를 접근하기 위하여 public 으로 된 set XXX(), get XXX() 메서드로 간접 접근을 한다.

4. 	자바에서 다중상속이 안된다는 말은 무엇을 의미하는지 개념과 소스코드 예제를 통해서 기술하세요.
	==> 하나의 자식 클래스가 여러 부모의 클래스를 상속받지 못한다는 것을 의미한다.
		ex) class 자식클래스 extends 부모클래스,부모클래스  <== 에러발생
		
		// 자식클래스 입장에서 여러 부모 클래스를 상속하지 못한다는 말이다.

5.	상속에서 상위 생성자에 따른 하위 생성자의 영향을 매개변수 관점에서 설명하세요.
	==> 상속시 생성자를 무조건 호출해야하기 때문에 하위 생성자는 상위 생성자의 매개변수와 같은 타입의 생성자를 호출해야한다.
	
	//상속하는 하위 클래스는 반드시 상위 클래스의 생성자를 포함하여야 한다.
	 * 1. default 생성자 // 매개변수 없는 생성자는 super()를 기본으로 포함하기 때문에 하위에서 특별한 선언없이 사용할 수 있다.
	 * 2. 상위에 매개변수 있는 생성자를 선언시, 하위 생성자에서는 해당 생성자의 type, 갯수에 맞게 생성자 선언 첫번때 라인에 호출 하여야 한다.
	 * class Father{
	 * 		Father(String name){}
	 * }
	 * class Son{
	 * 		Son(String name){
	 * 			super(name); //상위에 매개변수의 갯수와 타입에 맞는 생성자 호출.
	 * 		}
	 * }

6. 	overloading과 overriding의 차이점을 기술하세요.
	overloading	: 같은 이름의 메서드를 여러개 정의하는 것.
	//같은 클래스 내에서 생성자나 메서드가 이름이 같더라도, 매개변수의 갯수, type, 순서로 선언이 가능한 것을 말한다.
	overriding	: 상속받은 메서드 내용을 변경하는 것.
	//상속관계에 있는 하위객체가 메서드를 상위의 객체의 메서드와 동일한 이름과 매개변수로 선언하여 재정의 하는 것을 말한다.

7. 	다각형이라는 클래스에서 상속받은 삼각형, 사각형, 오각형의 클래스를 필드와 메서드를 이용해서 적절하게 구성해보세요.

8. 	다형성의 개념으로 Robot에서 재정의 할 attack()메서드를 통해,
	상속받은 2가지 이상 로봇 종류클래스(태권브이, 마징가제트)를 선언하고, 
	상위 = 하위로 처리하여, 재정의된 메서드를 통해 기능을 출력하세요.
	attack() 하위에서 미사일 발사/로켓포발사 등 여러가지 재정의가 가능

 */
		
	}

}

