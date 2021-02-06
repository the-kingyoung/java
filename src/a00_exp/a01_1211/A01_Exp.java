package a00_exp.a01_1211;

import java.util.Scanner;

public class A01_Exp {
	public static void main(String[] args) {
		System.out.println("ex3)");
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력하시오.");
		String id = scan.nextLine();

		System.out.println("패스워드를 입력하시오");
		String pass = scan.nextLine();

		System.out.println(id.equals("himan") && pass.equals("7777") ? "로그인 성공" : "로그인 실패");
		
		System.out.println("==============================================================");
		System.out.println("ex4)");
		double fee = 50000;
		System.out.println("나이가 어떻게 되십니까?");
		Scanner sc = new Scanner(System.in);
		int age = sc.nextInt();

		if (age <= 3 || age >= 65) {
			System.out.println("기존 입장료 :" + fee + "원\n" + "3세 이하, 65세 이상은 입장료가 무료입니다.");
		} else if (4 <= age && age <= 7) {
			System.out.println("기존 입장료 :" + fee + "원\n" + "4세~7세는 50% 할인된 가격인 " + fee * 0.5 + "원 입니다.");
		} else if (8 <= age && age <= 13) {
			System.out.println("기존 입장료 :" + fee + "원\n" + "8세~13세는 40% 할인된 가격인 " + fee * 0.6 + "원 입니다.");
		} else if (14 <= age && age <= 19) {
			System.out.println("기존 입장료 :" + fee + "원\n" + "14세~19세는 20% 할인된 가격인 " + fee * 0.8 + "원 입니다.");
		} else {
			System.out.println("입장료는 50000원 입니다.");
		}
		System.out.println();
		
		
		System.out.println("ex5)");
		Ex05_Bus bus = new Ex05_Bus(3007,"홍길동아파트","쌍용학원");
		bus.route();
		/*
public class Ex5_Bus {
	int num;
	String start;
	String last;

	public Ex5_Bus(int num, String start, String last) {
	//생성자는 일반적으로 매개변수를 통해서 필드에 할당하여
	//각 객체의 필드값으로 초기화 시킨다.
		super();
		this.num = num;
		this.start = start;
		this.last = last;
	}

	void route() {
		System.out.println(num + "번 버스 노선 : " + start + "~" + last);
	}

}

		 */
		
		System.out.println("ex6)");
		/*
public class Ex6_Card {
	String num;
	String shape;
	
	public Ex6_Card(String num, String shape) {
		super();
		this.num = num;
		this.shape = shape;
	}
	void care() {
		System.out.println(num+" "+shape);
	}

}
		 */
		System.out.println("ex7)");
		
		System.out.println("ex8)");
		for(int i=1
				;i<4;i++) {
			for(int j=1;j<11;j++) {
				System.out.print(i+"학년 "+j+"반"+"\t\t");
			}System.out.println();
		}
		System.out.println("ex9)");
		System.out.print("가위(1), 바위(2), 보(3)를 입력하세요.");
		Scanner scan01 = new Scanner(System.in);
		int game = scan01.nextInt();
		int dice = (int)((Math.random()*3)+1);	

		if (1 > game || game > 3) {
			System.out.println("숫자를 다시 입력해주세요.");
		}else {

			switch(game) {
				case 1:System.out.println((dice == 1) ? "무승부" : (dice == 2) ? "컴퓨터 바위로 사용자패배" : "컴퓨터 보자기로 사용자승리"); break;
				case 2:System.out.println((dice == 2) ? "무승부" : (dice == 3) ? "컴퓨터 보자기로 사용자패배" : "컴퓨터 가위로 사용자승리"); break;
				case 3:System.out.println((dice == 3) ? "무승부" : (dice == 1) ? "컴퓨터 가위로 사용자패배" : "컴퓨터 바위로 사용자승리"); break;
			}
		}

		System.out.println("ex10)");
		Scanner scan02 = new Scanner(System.in);
		System.out.print("# 어서 오세요 행복 반점입니다. #\n #메뉴\n 1.짜장면(5000원)\n "
				+ "2.짬뽕(6000원)\n 3.탕수육(12000원)\n"+"# 주문 번호를 입력하세요(1~3) : ");

		int num = scan02.nextInt();
		if (num>=1&&num<=3) {
			System.out.println((num==1)?"짜장면을 선택하셨습니다.":(num==2)?"짬뽕을 선택하셨습니다.":"탕수육을 선택하셨습니다.");
		}else {
			System.out.println("번호를 다시 입력해주세요.");
		}
		System.out.print("# 주문할 수량을 입력하세요(1~)");
		int cnt = scan02.nextInt();
		if(num<0) {
			System.out.println("주문 수량을 다시 입력해주세요.");
		}else {
			System.out.println("주문하신 수량은 "+cnt+"개 입니다.");
		}
		
		System.out.println("ex11)");
		Ex11_Book book = new Ex11_Book("삼국지");
		book.buy(3000, 60);
		book.prn();
		System.out.println("구매한 책의 총 가격 : "+book.tot()+"원");
		
	}
	
}
	

/*
#한주간을 정리하면서..
1.	자바의 핵심 메모리 두가지를 primitive와 객체와 비교하여 할당방법을 설명하세요.
	-자바의 핵심 메모리로는 stack과 heap이 있다.
	primitive에서는  		
		데이터 유형, 변수명;
		변수명 = 데이터;
 		ex) int num01;
 			num01 = 10;
 	와 같은 식으로 할당이 되고
 	객체에서는 stack영역에는 heap의 주소값, heap영역에는 실제 객체를 할당한다.
 	==>	stack : primitive데이터 유형할당, 객체의 heap 영역 주소 할당
 		heap  : 생성된 객체를 할당.
	
	

2.	String의 메모리 할당의 특성을 비교연산자와 equals를 통해서 기술하세요.
	String name1="홍길동"; "홍길동"으로 된 모든 문자열은 heap영역에 같은 주소를 쓴다.
	String name2="홍길동"; name1==name2는 true값 나온다.
	String name3=new String ("홍길동");
	String name3=new String ("홍길동");
	new String()은 다른 heap영역에 주소값에 객체가 생성이 되기에 name3==name4는
	false값으로 처리된다. 문자열만 비교할 때는 문자열1.equals(문자열2)를 통해서 
	비교하여야 한다. name1.equals(name2), name1.equals(name3),
	name3.equals(name4), 모두 다 문자열 자체에 대한 비교이므로 true로 처리된다.

3.	Scanner을 통해서 id와 pass입력을 하고, himan/7777일 때,
	로그인 성공 그렇지 않을 때, 로그인 실패를 처리하는 프로그램을 만들어보세요.
	
	Scanner sc = new Scanner(System.in);
	System.out.print("아이디를 입력하세요 : ");
	String id = sc.nextLine();
	System.out.print("패스워드를 입력하세요 : ");
	String pass = sc.nextLine();
	System.out.println(id.equals("himan")&&pass.equals("7777")?"로그인 성공":"로그인 실패");
	
	
	
	
4. 조건문 활용 예제(난이도 중) Scanner을 통해서 나이 이력 받아서 처리
		*나이에 따른 할인률 적용.
		*3세이하, 65세 이상 무료
		*4~7 	: 50%할인
		*8~13 	: 40%할인
		*14~19 	: 20%할인
		*그외에는 전액
		*
		*1)변수 나이에 따른 할인율을 출력하세요
		*2)요금이 50000일때, 할인율 적용된 금액까지 출력하세요.
int pay=50000;
Scanner sc = new Scanner(System.in);
System.out.println("나이를 입력하세요:");
int age = sc.nextInt();//나이
System.out.println("원래 가격 : " + pay);
double dis = 0.0;

if(age~~~~){
	System.out.println("가격은 무료입니다.")
}else if(age~~~~~~){
	dis=0.5//50%할인
	System.out.println("할인률은 50%)
	.
	.
	.
	else{
		System.out.println(할인율은 0);
	}
	pay=(int)(pay - (pay*dis)); //50000에서 할인금액(50000*할인율)을 뺀 금액.
	System.out.println("총비용:"




		
		

5. 	버스 클래스를 만들고 필드로 번호, 시작점, 마지막종착점 선언,
	생성자를 통해서 해당 필드값을 초기화 처리..
	메서드를 통해서 @@번 버스 @@@~@@@노선
	
6. Card :
	필드	:	번호, 모양			52를 배열을 선언
			번호 : A 2 3 4 5 ... J Q K
			모양 : ♠	♣ ◈	♥
		메서드 : show() 번호와 모양을 출력
		1) ArrayList<Card> 카드 52개 만들기
		2) 이 중에서 임의로 7장 뽑아서 출력 show()

7.	Math.random()을 이용해서 주사위가 1~6번호가 나오게 하고, 실행할 때마다
	해당 번호가 나온 확률을 표기하세요. (중급)
	반복문으로 6회 실행하여
	나온 번호 : @@
	1:@@@%, 2:@@@%, 3:@@@%, 4:@@@%, 5:@@@%, 6:@@@%
	
8.	상위는 학년 하위는 반을 출력하세요 (학년은 1~3) (반은 1~10)
	1학년 1반~~~~1학년 10반
	2학년 1반~~~~2학년 10반
	3학년 1반~~~~3학년 10반...(반복문 활용)
	
9.	컴퓨터와 하는 가위 바위 보
	가위! 바위! 보!(1,2,3)를 입력하세요!!
	컴퓨터 vs 나
	결과 : 승/무/패
	
10. # 어서 오세요 행복 반점입니다 #
		#메뉴
		1.짜장면(5000원)
		2.짬뽕(6000원)
		3.탕수육(12000원)
		# 주문 번호를 입력하세요(1~3):@@
		# 주문할 수량을 입력하세요(1~):@@
		@@@를 @@개 주문했습니다.
		계속 주문하시겠습니까?(Y/N):@@
		---------------------------
		총비용은 @@@원 입니다.
		
11. Book 클래스를 만들고,
	생성자로 도서명을 입력받고
	buy(..,..)를 통해서 가격과, 갯수를 입력받아 처리하고
	tot()를 통해서 총액을 계산을 return받아 처리하고
	prn()을 통해서 현재 구매한 도서의 도서명, 가격, 갯수 출력하세요.
	도서를 3권으로 구매처리하고, 총비용을 출력하세요.
 */
