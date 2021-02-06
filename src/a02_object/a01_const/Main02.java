package a02_object.a01_const;

public class Main02 {
	public static void main(String[] args) {
		
		BaseBallPlayer p1 = new BaseBallPlayer();
		BaseBallPlayer p2 = new BaseBallPlayer("홍길동");
		BaseBallPlayer p3 = new BaseBallPlayer("LG","박용택",0.381);
		
		
		
		System.out.println("매개변수 없는 객체");
		System.out.println(p1.company);
		System.out.println(p1.name);
		System.out.println(p1.rate);
		System.out.println("매개변수 1개 객체");
		System.out.println(p2.company);
		System.out.println(p2.name);
		System.out.println(p2.rate);
		System.out.println("매개변수 3개 객체");
		System.out.println(p3.company);
		System.out.println(p3.name);
		System.out.println(p3.rate);
		
		

	}

}
