package a01_basic;

import java.util.Scanner;

/*
 * 반복문
 * 1. 반복적인 처리를 위해 사용되는 구문을 말한다/
 * 2. 종류
 * 	 1) for(초기값설정1;반복조건2;증감연산자4){
 * 			3반복할 코드 : 선언한 연산자와 함께 증가/감소하는 처리를 하는 반복문
 * 		}
 *		 1[234][234][234].....
 * 	 2) 반복문에 사용되는 키워드
 * 		break; continue; 조건문과 함께 반복처리를 효과적으로 해준다.
 * 		break문 : 반복을 중단시켜준다
 * 		continue 문 : 해당 단위 프로세스만 수행을 중지했다가 다음 프로세스에서는 반복 수행을
 * 						계속해주는 처리를 한다.
 * 
 * 
 * for 문의 index를 통한 배열 데이터 접근
 * 		1) 배열은 index로 접근할 수 있기 때문에
 * 		2) 배열명.length 배열의 index한계를 설정
 *		   idx <배열명.length
 *		3) 각 배열의 데이터는 index형식으로 접근하여 처리할 수 있다.
 *		   배열명[index번호]
 *for 의 단위 데이터 처리 형식
 */

public class A07_Loop {
	public static void main(String[] args) {
		System.out.println("1부터 10까지 반복");
		for (int cnt = 1; cnt <= 10; cnt++) {
			System.out.println("카운트!" + cnt);
		}
		// break문 사용 5일때, 중단 처리
		System.out.println("break문 사용");
		for (int cnt = 1; cnt <= 10; cnt++) {
			if (cnt == 5) {
				break;
			}
			System.out.println("카운트" + cnt);
		}
		// continue문 사용 5일때, 중단하고 계속 처리
		System.out.println("continue문 사용");
		for (int cnt = 1; cnt <= 10; cnt++) {
			if (cnt == 5) {
				continue;
				//continue 이후, 내용만 수행하지 않고
				//다음 반복 step을 진행한다.
			}
			System.out.println("카운트" + cnt);
		}
		// ex1)break연습 : 1에서부터 2씩 증가하면서 100까지 출력하되,
		// 1-100중에 임의의 숫자에서 중단처리되게 하세요. "중단합니다!! 표기"
		System.out.println("==============================================");
		System.out.println("break문 연습");
		int j = (int) (Math.random() * 100 + 1);
		for (int i = 1; i <= 100; i += 2) {
			if (i == j) {
				System.out.println("중단합니다!");
				break;
			}
			System.out.println("카운트!" + i);
		}
		// ex2) continue 50~100까지 출력하되, continue를 이용해서 짝수는 제외하여 출력하세요
		System.out.println("==============================================");
		System.out.println("continue문 연습");
		for (int i = 50; i <= 100; i++) {
			if (i % 2 == 0) {
				continue;
			}
			System.out.println(i);
		}
		// ex3)1부터 시작하여 3,6,9게임 형식으로 해당 번호가 나왔을 때,숫자가 아닌 짝이 표기되게 하세요
		System.out.println("==============================================");
		System.out.println("369게임");
		for (int i = 1; i <= 100; i++) {
			if (i % 3 == 0) {
				System.out.println("짝");
				continue;
			}
			System.out.print(i + "\t");

		}
		String fruits[] = { "사과", "바나나", "딸기" };
		// fruits[index번호] : 각각의 개별데이터 접근
		// fruits[0], fruits[1], fruits[2]
		// fruits.length : 배열의 길이, index번호는 배열의 길이보다 1작다
		// 위 데이터에서 배열의 길이는 3이지만 index번호는 2까지 있다.
		System.out.println("\n");
		for (int i = 0; i < fruits.length; i++) {
			System.out.print(i + 1 + "번째 과일 : ");
			System.out.println(fruits[i]);
		}
		// ex) 과일의 가격을 정수로 배열로 선언하고, 해당 과일명과 가격을 출력하세요
		int[] price = { 1000, 2000, 3000 };
		// 과일의 가격과 과일명은 index가 동일
		for (int i = 0; i < fruits.length; i++) {
			System.out.print(i + 1 + "번째 과일 : ");
			System.out.println(fruits[i] + "\t" + price[i]);
		}
		/*
		 * for (단위 데이터 : 배열형데이터)
		 */
		System.out.println("====================================");
		System.out.println("향상된 for문");
		for (String fruit : fruits) {
			System.out.println(fruit);
		}
		//객체형 배열 선언.
		Fruit frus[]= {new Fruit("사과", 3000,2),new Fruit("바나나", 4000,3),
				new Fruit("딸기", 12000,5)};
		for(Fruit fr : frus) {
			System.out.print(fr.name+"\t");
			System.out.print(fr.price+"\t");
			System.out.print(fr.cnt+"\t");
		}
		System.out.println("\n");
		//ex) 학생 3명의 이름, 국어, 영어, 수학 점수를 각각의 배열로 만들어서
		//	아래의 형식으로 출력하세요
		//		이름		국어		영어		수학		총점		평균
		//		홍길동	70		80		90		240		80
		//		김길동	80		90		95		240		80
		//		신길동	60		80		90		240		80
		String[] stu = {"홍길동", "김길동", "신길동"};
		int[]kor = {70,80,60};
		int[]eng = {80,90,80};
		int[]math = {90,95,90};
		
		System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
		for(int i = 0; i<kor.length; i++) {
			System.out.print(stu[i] + "\t");
			System.out.print(kor[i] + "\t");
			System.out.print(eng[i] + "\t");
			System.out.print(math[i] + "\t");
			int tot = kor[i]+eng[i]+math[i];
			System.out.print(tot+"\t");
			System.out.println(tot/3.0);
		}
/*
 * # while문
 * 1. 조건에 따라 반복을 계속할 지를 결정해서 처리하는 구문
 * 2. 기본형식
 * 		while(boolean조건){
 * 			boolean조건이 true일때, 반복수행할 내용
 * 		}
 * 		do{
 * 			//최소 한번은 수행하고, 반복 가능 여부를 check
 * 		}while(boolean조건);
 * 
 * 3. boolean조건이 true일 경우, 무한 반복을  할수도 있다.
 */
		System.out.println("프로그램 시작");
		//System.in : jvm에서 기본적으로 입력하는 객체
		//Scanner(입력스트림): console창에서 데이터를 입력받아 처리할 수 있는 객체이다.
		Scanner sc = new Scanner(System.in);
		//.nextLine() : 줄단위 문자열 입력.
		int pay=0; //구매할 금액
		while(true) {//무한반복
			System.out.println("# 현재 구매한 금액 #");
			pay+=2000; //반복시 마다 누적처리
			System.out.println("현재 구매 금액:" +pay);
			System.out.print("구매를 그만하시려면 Y 입력하세요");
			if(sc.nextLine().equals("Y")) {
				System.out.println("안녕히 가세요! Good bye");
				break;
			}
		}
		System.out.println("프로그램 종료");
		//ex)Meeting!!
		//		1번 만남
		//		그만 만나시겠습니까?(Y)
		//		2번째 만남...
		//		Y를 누르는 순간 
		//		Say Good bye!! 인연이 여기까지네요.
		
		System.out.println("데이트 시작");
		Scanner scan = new Scanner(System.in);
		int i = 0;
		while(true) {//무한 반복
			System.out.println("현재 만남 횟수");
			i++;
			System.out.println(i + "번째 만남");
			System.out.println("그만 만나시겠습니까?(Y)");
			if(scan.nextLine().equals("Y")) {
				System.out.println("Say Good bye!! 인연이 여기까지네요");
				break;
			}
		}System.out.println("데이트 종료");
	}

}
class Fruit{
	String name;
	int price;
	int cnt;
	Fruit(String name, int price, int cnt){
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	
}
