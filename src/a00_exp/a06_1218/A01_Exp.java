package a00_exp.a06_1218;

import java.util.ArrayList;
import java.util.Scanner;


class SellingMachine{
	private String title;
	private int tot;
	private ArrayList<Menu>mlist;
	//생성자를 통해서 자판기 타이틀 할당.
	//어떤 타이틀이고, 어떤 메뉴가 있는지는 초기 생성시 설정 것이.
	//비지니스로직(업무 처리)상 합당하다.
	public SellingMachine(String title,ArrayList<Menu>mlist) {
		super();
		this.title = title;
		this.mlist = mlist;
	}
	//금액투입//
	public void inputMoney(int addMoney) {
		this.tot+=addMoney;
		System.out.print("금액투입:"+addMoney+"원, ");
		displayMoney();
	}
	//현재 금액 표기(공통)
	public void displayMoney() {
		System.out.println("현재금액:"+tot+"원");
	}
	//메뉴 리스트 보이기(번호)
	public void menuList() {
		System.out.println("## "+title+"메뉴 리스트 ##");
		System.out.println("번호\t물건명\t가격");
		for(int idx = 0; idx<mlist.size();idx++) {
			System.out.print(idx+1+"\t");//index번호와 선택번호 +1차이
			mlist.get(idx).show();
			System.out.println();
		}
		
	}
	//기능 메서드(Scanner 활용하기)
	public int choiceNum() {
		Scanner sc = new Scanner(System.in);
		//예외 처리.. 번호가 선택을 하지 않았거나 입력이 잘못되었을 때, 예외처리..
		int chNum=0;
		int maxNum = mlist.size();
		//번호가 정상입력될때 까지 반복 수행..
		while(true) {
			try {
				System.out.println("번호를 선택하세요!(1~"+maxNum+"):");
				chNum = sc.nextInt();
				if(chNum<1 || chNum>maxNum) {//예외 발생 범위 설정..
					throw new Exception("입력범위는 1~"+maxNum+"입니다.");
				}
			}catch(Exception e) {//강제 예외 뿐만 아니라 일반 예외도 처리..
				System.out.println("예외발생:"+e.getMessage());
				System.out.println("다시 입력해주세요.");
			}finally {
				//System.out.println("에러 상관없이 진행할 내용");
				
			}
			if(chNum>=0&&chNum<=maxNum) {//반복처리 만료..(정상범위 입력)
				break;
			}
		}
		return chNum;
	}
	// 선택 물품을 선택.
	public String choiceMenu(int chNum) {
		String chProd="";
		// 메뉴리스트 보이기.
		
		//번호 선택하기..(내부 메서드 호출)
		
		//선택한 번호에 따라서, 잔액 여부에 대한 처리하기..
		Menu chMenu = mlist.get(chNum-1); //선택한 번호와 list index차이..		
		//총 금액에서 차감 계산하여 최종 물건 리턴하기..
		if(chMenu.getPrice()<=tot) {//현재 입력된 금액이 가격보다 많아야 정상처리..
			chProd = chMenu.getName();
			tot -= chMenu.getPrice(); //정상처리시차감..
		}else {
			System.out.println("잔액이 부족합니다.~");
		}
		
		
		return chProd;
	}
	//남은 잔액 리턴..
	public int restMoney() {
		int rest = tot;
		System.out.println("잔액 "+tot+"원 반환합니다.");
		tot=0;
		return tot;
	}
}

class Menu{
	private String name;
	private int price;
	
	public Menu(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}
	public int getPrice() {
		return price;
	}
	
	public String getName() {
		return name;
	}
	public void show() {
		System.out.println(name+"\t"+price+"원");
	}
}
class WriteTool{
	private String name;

	public WriteTool(String name) {
		super();
		this.name = name;
	}
	public void using() {
		System.out.println("필기구 "+ name + "을 사용하다.");
	}
	public String getName() {
		return name;
	}
}
class Note{//1:1관계 설정..
	private String kind;
	private WriteTool wt;

	public Note(String kind) {
		super();
		this.kind = kind;
	}

	public void setWt(WriteTool wt) {
		this.wt = wt;
		System.out.println(kind + " 노트에 필기구 "+wt.getName()+"활용하다.");
	}
	public void writing() {
		System.out.println(kind+" 노트에서 ");
		if(wt!=null) {
			wt.using();
		}else {
			System.out.println("필기구가 없습니다...");
		}
	}
	
}
class Train{
	private String name;
	private ArrayList<Seat> slist;
	//기차의 기본정보, 좌석 정보를 초기에 설정
	public Train(String name, ArrayList<Seat> slist) {
		super();
		this.name = name;
		this.slist = slist;
	}
	//좌석 정보 리스트..
	public void showList() {
		System.out.println(name+"기차 좌석 현황");
		for(Seat s : slist) {
			s.info();
		}
	}
	//예약처리..
	public void reserved(int numCart, int num) {
		System.out.println(numCart + "호차 " + num + "좌석 예약 여부 확인");
		Seat reSeat = null;
		// for(Seat st : slist) {
		for (int idx = 0; idx < slist.size(); idx++) {
			Seat st = slist.get(idx);
			if (st.getNumCart() == numCart && st.getNum() == num) {
				reSeat = st; // 해당 호차와 좌석 정보가 있을 때, 해당 좌석을 return
				System.out.println(reSeat.isFull() ? "예약되어 있습니다." : "예약합니다.");
				st.setFull(true);
				slist.set(idx, st);//변경 할당 처리.
			}
		}
		if (reSeat == null) {
			System.out.println("해당 좌석이 없습니다.");
		}
	}

}
class Seat{
	private int numCart;//호차
	private int num;	//11A 11B 좌석번호
	private boolean isFull;//예약 여부
	//구간처리..배열을 문자열로 설정해서, 
	//해당 구간별로 예약 여부를 처리하여야 한다.
	//1.배열.
	//{"서울~수원","수원~대전","대전~대구","대구~부산"}
	//{true, false, false. true}
	//2. 아래 객체로 다시 호출 처리
	//객체 안에 또 객체 class Loc{}
	
	
	public Seat(int numCart, int num, boolean isFull) {
		super();
		this.numCart = numCart;
		this.num = num;
		this.isFull = isFull;
	}
	public void info() {
		System.out.print(numCart+"호차\t");
		System.out.print(num+"번 좌석\t");
		System.out.println((isFull?"예약된":"빈")+" 좌석");
	}	

	//예약 여부 변경 처리.(외부에서 호출처리) - 임시..
	public boolean isReserved(int numCart, int num) {
		System.out.println("예약 여부 확인");
		if (this.numCart == numCart && this.num == num) {
			return isFull;
		} else {
			return false;
		}
	}
	public int getNumCart() {
		return numCart;
	}
	public int getNum() {
		return num;
	}
	public boolean isFull() {
		return isFull;
	}
	public void setFull(boolean isFull) {
		this.isFull = isFull;
	}
	
}


public class A01_Exp {
	public static void main(String[] args) {
		
/*
# 한 주간을 정리하면서..
1. 	메서드의 기본 구성요소를 기본 예제와 함께 기술하세요.

	- 	[접근제어자][타입][메서드명](매개변수){
			특정 매개변수에 따른 process 진행처리..
			return 리턴데이터;
		}
		int plus(int num01, int num02){
			return num01 + num02;
		}
		
2.	완성도 있는 자판기 프로그램을 구현하세요.
	1) 객체를 이용해서
		생성자 	: 자판기명(음료/점심식사..)
		메서드1	: 금액 투입(총금액 누적처리)
		메서드2	: 메뉴보이기
		메서드3	: 메뉴선택 - 투입한 금액과 함께 물건 리턴..
		메서드4	: 잔액 리턴 처리
	2) 기본 자판기 예제를 활용하여 완성도 있게 만들어보세요..
	
		ArrayList<Menu> mlist = new ArrayList<Menu>();
		mlist.add(new Menu("콜라",1200));
		mlist.add(new Menu("사이다",1000));
		mlist.add(new Menu("캔커피",800));
		SellingMachine sm = new SellingMachine("음료자판기",mlist);
		sm.menuList();
		sm.inputMoney(1000);
		sm.inputMoney(1000);
		//scanner를 통해서 번호 선택
		int chNum = sm.choiceNum();
		System.out.println("선택한 번호:"+chNum);
		String result = sm.choiceMenu(chNum);
		System.out.println("나온 음료 내용 :"+result);
		int rest = sm.restMoney();
		System.out.println("반환된 잔액:"+ rest +"원");


3. 	필기구와 노트의 1:1관계로 설정하여
		@@필기구를 이용하여 노트에 @@을 기록하다. 객체 1:1관계 설정으로 프로그램을 처리하세요.
		

		Note n = new Note("A4크기 ");
		n.writing();
		n.setWt(new WriteTool("고급 샤프"));



4.	기차예매표 처리 프로그램	기차객체와 좌석 별 내용을 1:다 관계로 설정하세요.
	기차클래스 : 서울~부산
	좌석클래스 : @@호차 @@번호 예약여부
	## 중간에 구간으로 정해서 예매처리. (서울에서 부산 차인데 내가 어디에서 어디까지 간다.) 
		//ArrayList 좌석 설정.
		ArrayList<Seat> slist = new ArrayList<Seat>();
		for(int cnt = 1; cnt<=5; cnt++) {
			for(int scnt=1;scnt<=60;scnt++) {
				slist.add(new Seat(cnt,scnt,false));
			}
		}
		Train t = new Train("서울-부산행 열차",slist);
		t.showList();
		t.reserved(1, 1);
		t.showList();
		

5.	final, static의 개념과 기본 예제를 통해 설명하세요.

	final)
		클래스명 	: 상속 불가 클래스					ex)final class Son{}
		변수 		: 상수							ex)final int PI = 3.14;
		메서드	: 상속 시, 하위 클래스에서 재정의 불가	ex)public final void show(){}
	static)
		- 객체의 클래스 단위 공유 메모리 영역 생성.
		변수,메서드 주로 클래스명.변수/클래스명.메서드() 객체 생성없이 사용 가능하다.
		class Bank{
			static int cnt;
			static String show(){
			 	return"스태틱";
			}
		Bank.cnt = 10;
		System.out.println(Bank.show());
		
		
	//static)
	- static 변수는 객체의 종속이 아니기 때문에 객체 생성 없이 
	  클래스명.static변수로 사용할 수 있다.
	- static 블럭을 통해서 static 변수 데이터를 할당하여 사용할 수 있다.
	- static 메서드도 객체 생성없이 바로 사용할 수 있다.

6.	접근제어자의 종류와 범위를 기술하되, default, protected에 관련하여 기본예제를 만들어 보세요.

			- private 	: 클래스 내부에서만 사용
			- default 	: 접근제어자를 붙이지 않을 때, 같은 패키지까지 접근이 가능
			- protected : 상속관계에 있을 때만, 외부패키지 클래스에서 호출 가능.
			- public  	: 외부 패키지의 모든 클래스에서 접근이 가능.
			>>private< default < protected < public
			범위가 넓어지는 것이기 때문에 넓은 범위에 있는 내용은 전체적으로 포괄하고 있다.
			패키지1 : WoodCutter, Son2, Daughter, Angel
			패키지2 : Son1(WoodCutter를 상속), Son1Wife
			WoodCutter의 default 접근 제어자가 붙은 String homeEvent="가족저녁외식";
			외부 패키지에 있는 Son1과, Son1Wife는 접근하여 호출할 수 없고,
			WoodCutter의 protected 접근 제어자가 붙은 protected String inherit="상속재산유언장";
			같은 패키지에 있는 모든 클래스(Son2, Daughter, Angel)뿐만 아니라, 
			외부 패키지 상속관계 있는 클래스 (Son1)까지 접근이 가능하다.
			단, 상속관계 없는 외부 패키지 클래스 Son1Wife는 접근이 불가능하다.
			
			
			
			class Father{
			String name;
			protected age;
			private family;
			}
			class Son extends Father{
			
			public void show(){
				System.out.println(name);
				System.out.println(age);	
				System.out.println(family);	//error
			}

7.	상속의 멤버(생성자, 필드, 메서드) 별로 접근제어와 재정의에 대하여 기능별로 기술하세요..
	class Father{
		private String name;	//멤버
		Father(String name){
			this.name = name;
		}
		public void call(){
			System.out.println("이름:"+name);
		}
	}
	class Son extends Father{
		//상위 클래스 접근제어자 private는 직접적으로 접근이 불가능하다.
		Son(){
			//상위 클래스의 생성자는 반드시 호출하여야 한다.
			super("아들이름default");
			//이렇게 함으로 간접적으로 name을 할당할 수 있다.
		}
		public void call(){	//메서드는 동일한 매개변수와 이름으로 재정의가 가능하다.(오버라이딩)
			super.call();	//상위 메서드를 super.으로 재 호출 가능..
			System.out.println("추가 내용 처리");	//오버라이딩의 핵심인 추가 내용 처리 가능..
		
		}
		public void call(String n){//메서드는 동일한 매개변수가 아니면 메서드 오버로딩이다.
		
		}
	}

8.	상속에서 Robot을 추상클래스로 정의하고 하위에 실제클래스를 Tv, Dagan, Mz를 선언하여 처리할수 있도록 하되,
	Interface는 Weapon으로 하위에 여러무기(로켓포, 레이저빔..등)처리 할 수 있게 하되, 각 로봇마다 무기를 
	여러가지 장착가능하게 처리하세요. (오버라이딩, 공통메서드)를 활용하여 처리해보세요.
*/
		TV tv = new TV();	
		//추상클래스에서 상속받으면, 공통내용을 효과적 사용 및 재정의할 수 있다.
		//추상/인터페이스 이용시, 추가되는 객체로 기존 코드에 영향을 미치지 않는다.
		tv.attack();
		tv.addWeapon(new Rocket());
		tv.addWeapon(new Laser());
		tv.addWeapon(new ChangeAttack());
		tv.attack();
		tv.shapeAndColor();
/*

9.	예외처리에서 런타임시 예외와 필수 예외를 처리하는 방법을 기본 예제를 통해서 설명하세요.
	1) 런타임 예외는 실행시 발생하는 예외 ex) 객체를 생성하지 않고, 멤버 사용,
		배열이 없는데 호출, /0으로 처리될 때 에러...
	2) 필수예외는 컴파일전에 발생하는 예외 : java에서 api로 반드시 처리해야지
		컴파일이 정상적으로 처리할 수 있는 예외 ex) 파일 접근, io 발생..
		네트워크 처리 등이 있다.
	필수예외는 tool(elipse) 등을 통해서, try{}catch 블럭이 생성된다.
	런타임 예외 일단 예외가 발생하는 코드를 입력하여, 실행 후 예외 내용을 확인 후, 
		그 예외를 catch블럭의 매개변수로 처리한다.
		-1단계
		String s = null;
		System.out.println(s.toString());
		-2단계 : 수행 후, 예외 내용 확인.
		try{
			String s = null;
			System.out.println(s.toString());
		}catch(NullPointException e){
			System.out.println("예외발생:"+e.getMessage());
		}

10.	사용자정의 예외를 구성하되, Scanner으로 입력한 값이 id, pass가 맞지 않을 때, 
	정의된 예외클래스를 통해서 처리되는 프로그램을 구현하세요.
*/
		Scanner sc = new Scanner(System.in);
		try {
		System.out.println("아이디를 입력하세요:");
		String id = sc.nextLine();
		System.out.println("패스워드를 입력하세요.");
		String pass = sc.nextLine();
		if(!(id.equals("himan")&&pass.equals("7777"))) {
			throw new MemValException(id+"는 인증되지 못했습니다.");
		}
		}catch(MemValException e) {
			System.out.println("인증 오류:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외:"+e.getMessage());
		}
		
/*

11.	데이터베이스 설치 관련 내용을 캡쳐를 통해 설치되는 절차를 정리하여  ppt파일로 만들어보세요.


 */
	}

}
class MemValException extends Exception{
	MemValException(String msg){
		super(msg);
	}
	
}
abstract class Robot{
	private String kind;
	private ArrayList<Weapon>wlist;	//추가할 무기종류. 상위 = 하위에 list형식으로 추가할 수 있도록 선언
	public Robot(String kind) {
		super();
		this.kind=kind;
		wlist = new ArrayList<Weapon>();
	}
	//무기를 추가할 수 있는 메서드.. Weapon wp = 상속받는 하위 객체
	public void addWeapon(Weapon wp) {
		wlist.add(wp);
		System.out.println("무기장착");
	}
	public void attack() {
		System.out.println("# "+kind+"로봇 공격하다 #");
		if(wlist.size()>=1) {
		//for (Weapon wp : wlist){	//1. list내에 객체를 바로 할당해서 활용할 때.. 
		for(int i=0; i<wlist.size();i++) {
			//2. numbering이나 index를 활용해서 데이터를 처리할 필요가 있을 때, 활용
			Weapon wp = wlist.get(i);
			System.out.println("\t"+(i+1)+"번째 무기! ");
			wp.attack();
		}
		}else {
			System.out.println("무기가 장착되지 않았습니다.");
		}
	}
	//추상클래스를 상속받은 하위 실제 클래스에서 재정의할 내용.(추상메서드 선언)
	public abstract void shapeAndColor();
}
class TV extends Robot{//추상클래스를 상속받은 하위 클래스 Mz, Dagan로봇 생성
	public TV () {	//상위 생성자 활용..
		super("태권브이");
	}
	@Override//상위 메서드 재정의
	public void shapeAndColor() {
		// TODO Auto-generated method stub
		System.out.println("빨간색 V 심볼과 철제 거대 로봇이다.");
	}
}
class Mz extends Robot{//추상클래스를 상속받은 하위 클래스 Mz, Dagan로봇 생성
	public Mz () {	//상위 생성자 활용..
		super("마징가Z");
	}
	@Override//상위 메서드 재정의
	public void shapeAndColor() {
		// TODO Auto-generated method stub
		System.out.println("빨간색 Z 심볼과 여러가지 무기를 활용하는 로봇이다.");
	}
}
class Dagan extends Robot{//추상클래스를 상속받은 하위 클래스 Mz, Dagan로봇 생성
	public Dagan () {	//상위 생성자 활용..
		super("다간");
	}
	@Override//상위 메서드 재정의
	public void shapeAndColor() {
		// TODO Auto-generated method stub
		System.out.println("변신해서 여러가지 공격을 하는 경찰 로봇이다.");
	}
}

//ex)9
interface Weapon{
	public void attack();
}
class Rocket implements Weapon{
	@Override
	public void attack() {
		System.out.println("로켓포로 공격하다.");
	}
}
class Laser implements Weapon{
	@Override
	public void attack() {
		System.out.println("레이저빔으로 공격하다");
	}
}
class ChangeAttack implements Weapon{
	@Override
	public void attack(){
		System.out.println("변신 공격하다");
	}
}
