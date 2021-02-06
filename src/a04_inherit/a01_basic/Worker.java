package a04_inherit.a01_basic;

public class Worker {
	private String kind01;

	public Worker(String kind01) {
		super();	// Object의 생성자 호출..
		this.kind01 = kind01;
	}

	public void working() {
		System.out.println(kind01 + "이 일을 합니다.");
	}

}

class Policeman extends Worker {

	public Policeman() {
		super("경찰관");
	}

	// 상속된 내용 하위 클래스가 동일 working() 이라는 내용을 각각 다르게 재정의해서 사용할 필요가 있다.
	// ==> overriding
	public void working() {
		super.working();// 상위에 정의된 메서드 처리. super.(상위에 선언된)이라는 뜻
		System.out.println("치안을 담당하다.");

	}

}

class Fireman extends Worker {

	public Fireman() {
		super("소방관");

	}

	public void working() {
		super.working();// 상위에 정의된 메서드 처리. super.(상위에 선언된)이라는 뜻
		System.out.println("불을 끄다.");

	}

}

