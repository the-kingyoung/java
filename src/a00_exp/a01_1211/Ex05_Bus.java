package a00_exp.a01_1211;
/*
5. 	버스 클래스를 만들고 필드로 번호, 시작점, 마지막종착점 선언,
	생성자를 통해서 해당 필드값을 초기화 처리..
	메서드를 통해서 @@번 버스 @@@~@@@노선
 */

public class Ex05_Bus {
	int num;
	String start;
	String last;

	public Ex05_Bus(int num, String start, String last) {
		super();
		this.num = num;
		this.start = start;
		this.last = last;
	}

	void route() {
		System.out.println(num + "번 버스 노선 : " + start + "~" + last);
	}

}
