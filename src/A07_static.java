

class Puppy{
	String name;
	static int cnt; // 객체 공유 메모리 (이 클래스로부터 생성된 모든 객체들은 이 메모리를 모두 공유 가능)
	int eatAppleCnt;
	
	Puppy(String name){
		this.name=name;
		cnt++;//객체가 생성될 때 마다 cnt가 증가.
		eatAppleCnt++;// 객체 생성시 마다 eatAppleCnt 증가
	}
}
class Account{//은행에서 만든 계좌. 
	//1. 필드로 계좌명(이름), 입금된 금액, 전 계좌의 총 금액-static변수 선언
	//2. 생성자 : 매개변수 - 계좌명, 초기입금액
	//main()에서
	//계좌별로 객체를 생성하고
	//계좌별 입금액과 전 계좌 입금액을 출력하세요.
	String account;
	int addMoney;
	static int totMoney;
	
	Account(String account, int addMoney){
		this.account = account;
		this.addMoney = addMoney; 
		totMoney+=addMoney;
	}
	/*
	 String name;
	 int totMn;
	 static 
	 */
	
	
}

public class A07_static {
	public static void main(String[] args) {
		//heap영역이 다르고, 클래스는 같지만 다른 멤버(클래스의 구성요소)
		//를 가진 객체들이 생성된다.
		Puppy.cnt++;
		//static 변수는 객체의 종속이 아니기 때문에 객체 생성 없이 클래스명.static변수로 사용할 수 있다.
		Puppy.cnt++;
		Puppy.cnt++;
		
		Puppy p1 = new Puppy("귀염둥이 뽀삐");
		System.out.println("클래스 공유 메모리 cnt : " + p1.cnt);
		System.out.println("객체 메모리 eatAppleCnt : "+ p1.eatAppleCnt);
		Puppy p2 = new Puppy("사랑둥이 멍멍이");
		System.out.println("클래스 공유 메모리 cnt : " + p2.cnt);
		System.out.println("객체 메모리 eatAppleCnt : "+ p2.eatAppleCnt);
		System.out.println(p1+":"+p1.name);
		System.out.println(p1+":"+p2.name);
		
		
		Account a1 = new Account("신한은행", 100000);
		System.out.println(a1.account + "에서 계좌로 " + a1.addMoney + "원이 입금되었습니다.");
		System.out.println("현재 계좌 잔액은 "+a1.totMoney + "원 입니다.");
		Account a2 = new Account("신한은행", 300000);
		System.out.println(a2.account + "에서 계좌로 " + a2.addMoney + "원이 입금되었습니다.");
		System.out.println("현재 계좌 잔액은 "+a2.totMoney + "원 입니다.");
		
	}

}
