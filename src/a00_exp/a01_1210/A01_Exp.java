package a00_exp.a01_1210;
//ex6)
class Phone{
	String kind;
	String num;
	
	Phone(String kind, String num){
		this.kind=kind;
		this.num =num;
	}
	void explainPhone() {
	}
	void explainPhone(String kind) {
		this.kind=kind;
	}
	
}

//ex8)
class Pen {
	int price;
	int cnt;

	public Pen(int price, int cnt) {
		super();
		this.price = price;
		this.cnt = cnt;
	}

	final void color() {
		System.out.println("빨간색 펜");
	}
}

class PencilCase extends Pen {
	int size;

	public PencilCase(int price, int cnt) {
		super(price, cnt);
	}
	// void color() {
	// } 상속받은 클래스에서 사용시 에러가 발생한다.

}
//ex11)
class Toothp{
	String squeeze;
	String taste;
	
	Toothp(String squeeze, String taste){
		this.squeeze = 	squeeze;
		this.taste	 =	taste;
	}
	void act() {
		System.out.println("쥐어짜보니 "+squeeze);
		System.out.println("치약의 맛은? "+taste);
	}
}
class Toothb{
	String size;
	String strength;
	Toothp toothp;
	
	public Toothb(String size, String strength) {
		super();
		this.size = size;
		this.strength = strength;
	}
	void setToothp(Toothp toothp) {
		this.toothp=toothp;
	}
	void use() {
		System.out.println("양치를 하려고 칫솔을 들었다.");
		if(toothp!=null) {
			System.out.println("치약이 있다.");
			toothp.act();
		}else {
			System.out.println("치약이 없다. 하루 참자.");
		}
	}
	
}

public class A01_Exp {
	
		//ex5) 색상
		String color(int num) {
			String str = "";
			switch(num) {
			case(1):str="빨";break;
			case(2):str="주";break;
			case(3):str="노";break;
			case(4):str="초";break;
			case(5):str="파";break;
			case(6):str="남";break;
			case(7):str="보";break;
			default:str = "무지개 색이 아닙니다.";
			}
			return str;
			
		}
		
		//ex10)
		static String rsp() {
			int random = (int)(Math.random()*3+1);
			String result = "";
			switch(random) {
			case(1):result="가위";break;
			case(2):result="바위";break;
			case(3):result="보";break;
			}
			System.out.println(random);
			return result;
		}
		public static void main(String[] args) {
			//ex10)
			System.out.println(rsp());
			System.out.println();
			
			//ex11)
			Toothb t1 = new Toothb("성인용","미세모");
			t1.use();
			t1.setToothp(new Toothp("딱 한번 사용할 양이다.","딸기맛"));
			t1.use();
		
/*
# 개념과 코드 정리.
1. 	생성자와 메서드의 차이점을 기술하세요.
	- 생성자는 return값이 없고, 하나의 객체안에는 하나의 생성자만 사용할 수 있다. 
	//생성자는 리턴값이 없고, 객체생성시 한번만 생성이 되어 사용된다
	//메서드는 매개변수 리턴값이 있고, 객체 생성한 이후로 여러번 참조변수를 이용해서 사용할 수 있다.

2. 	default 생성자와 매개변수가 없는 생성자의 차이점과 장단점을 기술하세요.
	-default 생성자는 생성하지 않아도 메인메서드가 있는 곳에서 호출하는 순간에 객체가 생성된다.
	//default생성자란 클래스에서 생성자 선언이 없을때, 내장되어 public클래스명(){}으로
	 * 선언되어 있는 것을 말한다. 이 생성자는 사용자 정의 생성자를 선언하는 순간 사라진다.
	 * 매개변수가 없는 생성자를 선언한 경우, default생성자와 차이는 다른 오버로딩 되는 생성자와
	 * 함께 사용할 수 있는 점이 있다.
	 * 장단점이기 보다는 필요할 시 위의 특성을 이용하여 해당하는 경우에 사용하면 된다.

3.	"객체를 생성하면 생성자를 하나만 선택할 수 있다는 말"이라는 말을 
	클래스 내 생성자 선언과 관련하여 기술하세요.
	- 클래스와 생성자의 이름은 같아야 하기 때문에 하나의 클래스에는 하나의 생성자만이 올 수 있다.
	//클래스에는 여러 생성자를 오버로딩 규칙에 의해 선언할 수 있다.
	 * 그러나 객체 생성자 선택적으로 선언된 생성자를 new생성자명 ()으로 참조변수에 할당 할 수 밖에 없기 때문에
	 * 메서드와 같이 같은 주소값이 같은 참조변수에 여러개의 생성자를 사용할 수 없다.
	 *
	 class Rainbow{
	 	Rainbow(){}
	 	Rainbow(int ch){}
	 	Rainbow(int ch, String color){}
	 	}
	 	main()
	 	Rainbow rb1 = new Rainbow();
	 	Rainbow rb2 = new Rainbow(2);
	 	Rainbow rb3 = new Rainbow(3,"빨강");
	
4.	메서드의 구성요소 4가지를 메서드 예제 선언과 함께 설명하세요.

			리턴데이터type 메서드명(매개변수1, 매개변수2){
					//처리될 프로세스..
			}return 실제 리턴할 값;
			
			double avg(int kor, int eng, int math){
				return(kor+eng+math)/3.0;
			}


5. 	다음과 같은 메서드를 선언해 보세요.
	1)매개변수 정수형으로 1~7
	2)리턴값 문자열로 된 색상
	3)프로세스 처리...
		1~7번에 따라 무지개 색상 선택 빨/주/노/초/파/남/보
		String chCOlor(int chNum){
		//1~7번까지 입력이 되고, 나머지는 0처리
		int idx=chNum>0&&chNum<8?chNum:0;
		//0,1...7
		String[]colors={"선택안됨","빨","주","노","초","파","남","보"}
		//colors[0], colors[1], colors[2], colors[3],
		return colors[idx]
		}

6.	메서드에서도 overloading이 사용된다. 예제를 만들어 설명하세요.
	이름이 같더라도 매개변수의 형식에 따라 선언 가능할 것을 말한다.
	void calcu(int num01)
	void calcu(int num01, int num0) //1. 매개변수의 갯수가 다르면 선언 가능
	void calcu(int num01, String name)//2. 매개변수의 타입이 다르면 선언 가능
	void calcu(String name, int num01)//3. 매개변수의 갯수가 같지만 타입이 다르기 때문에 선언 가능

7.	final이 클래스의 구성요소에 쓰일 때, 각각의 형식과 차이점을 기술하세요.
	필드명 앞에 쓰일경우	: 초기값 할당 이후 더 이상 변경할수 없는 값이 된다.
	클래스명 앞에 쓰일 경우 : 더 이상 상속할 수 없는 클래스가 된다.
	메서드명 앞에 쓰일 경우 : 상속받은 하위 클래스에서 재정의 하여 사용할 수 없다.
	

8.	위에 final 내용 중에 메서드에서 쓰일 때에 예제를 간단하게 코딩해보세요.
	
9.	static이란 무엇인가?간단한 변수 앞에 쓰일 때, 어떻게 처리되는지 기술해보세요.
	=> 같은 클래스 안에서 여러 객체들에 사용하고 싶을때 static을 사용함으로써
	여러 객체들이 사용할 수 있는 변수로 만들어 준다.
	class Count{
		int cnt1;
		static int cnt2;
	}
	Count는 객체를 생성하면 cnt1은 각 객체마다 변수를 가지고 있지만,
		Count c1 = new Count(); c1.cnt1++; c1.cnt1++;  c1.cnt1++;  (2)
		Count.cnt2++; Count.cnt2++; c1.cnt2(2)
		Count c2 = new Count(); c2.cnt1++; c2.cnt1++;  c1.cnt1++;  (2)
		Count.cnt2++; Count.cnt2++; c2.cnt2(4), c1.cnt2(4)	
		
	cnt2는 객체가 아닌 클래스 단위로 변수를 처리할 수 있다.

10.	클래스안에 static으로 메서드를 구현한 내용으로 가위/바위/보 3중에 하나가
	임의로 나오는 메서드를 구현하여 main()에서 호출 처리해보세요.
	
	
	class Game{
		static String play(){
			int ranIdx=(int)(Math.random()*3);
			String[] arr={"가위, 바위, 보};
			return arr[ranIdx
		}	
	}
	main()
		syso(Game.play());
		//static으로 선언된 메서드는 클래스명.메서드명()
	
	
11.	칫솔 클래스와 치약 클래스를 1:1 관계로 설정하여, 종속관계를 만들고 출력해보세요.
  
12. 만약 static과 final이 함께 쓰인다면 어떤 효과가 발생하는지 기술해보세요.
	static은 클래스 변수, final은 상수....
	
	final만 붙으면 객체 단위로 상수가 만들어진다.
	클래스 단위로 하나의 상수만 쓰일 수 있게 된다.
  

*/

		Number n01 = new Number(1,1,1);
		Number n02 = new Number(2,2,2);
		Number n03 = new Number(3,3,3);
		System.out.println("static 변수1:"+n01.cnt1); 
		System.out.println("static 변수2:"+n02.cnt1); 
		System.out.println("static 변수3:"+n03.cnt1); 
		//static변수:3 = class 공유 메모리로 마지막 할당된 데이터가 나온다.
		System.out.println("final : 변수1:"+n01.CNT2);
		System.out.println("final : 변수2:"+n02.CNT2);
		System.out.println("final : 변수3:"+n03.CNT2);
		//final 상수는 각각의 객체마다 변경되지 않는 데이터를 가지고 있다.
		//n02.CNT2++; 상수이기 때문에 초기화된 데이터만 사용, 변경 불가능..
		//static final은 클래스 단위 상수이기에 객체마다 가지고 있지 않고,
		//클래스 선언할 때, 선언이 되어야 한다.
		System.out.println("static final 상수:" +Number.CNT3);
		
		}	
		
}
class Number{
	static int cnt1;
	final int CNT2;
	static final int CNT3=5; //클래스 단위로 상수가 설정
	int cnt4; //일반 변수
	
	Number(int cnt1, int cnt2, int cnt3){
		this.cnt1=cnt1;
		this.CNT2=cnt2;
		this.cnt4=cnt3;
		//this.CNT3=cnt3;	객체단위로 안되기 때문에 에러 발생.
	}
}
