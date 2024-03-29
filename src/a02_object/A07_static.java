package a02_object;
/*
# static
1. 어떤 기능일까요 ? 어떤 기능이 객체지향 프로그램에서 필요로 할까요 ?
	ex) 하나의 클래스에 의해 만들어진 객체의 갯수를 카운팅하는 변수를 설정할 수 없을까?
	ex) 하나의 클래스에 의해 만들어진 객체가 공유하는 변수를 사용할 수 없을까?
		- 객체의 갯수, 공유할 수 있는 색상들...
		
2. 이런 필요성 땜ㄴ에 생성된 것이 static 변수이다
3. static 변수는 객체의 소속도 되지만, 궁극적으로는 클래스 단위로 변수를 객체간에 공유할 수 있게 한다.
4. 개념 정리
	1)	자바의 객체는 클래스에서 생성되는 것이다.
	2)	객체의 필드는 클래스에서 각각의 객체마다 다르게 사용할 수 있다.
	3) 	객체의 원본은 class단위로 변수를 설정할 필요가 생기면 static 키워드를 이용해서 선언할 수 있다.
	4) 	클래스 단위로 생성된 모든 객체가 동일한 데이터를 가질 수 있기 때문에,
		객체 생성에 종속되지 않아, 클래스 변수라고 하기도 한다.
		static 변수는 객체 생성 없이 클래스명.static 변수 형식으로 주로 사용된다.

 * */

class Puppy{
	String name;
	static int cnt; // 객체에서 클래스 단위로 공유할 수 있는 공유 메모리 (이 클래스로부터 생성된 모든 객체들은 이 메모리를 모두 공유 가능)
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
		//static 메모리는 객체 생성과 상관없이 사용될 수 있는 공유 메모리이기 때문에
		//클래스명.static변수 로 사용할 수 있다.
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
