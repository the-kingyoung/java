package a01_1211Exp;

import java.util.Scanner;

/*
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
*/

public class Ex10_Food {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Scanner sc2 = new Scanner(System.in);
		System.out.println("어서오세요 행복반점입니다.");
		String menus[]= {"짜장면","짬뽕","탕수육"};
		int prices[]= {5000,6000,12000};
		int totPay=0;
		
		while(true) {
			System.out.println("# 메 뉴 ");
			System.out.println("1. 짜장면(5000원)");
			System.out.println("2. 짬뽕(6000원)");
			System.out.println("3. 탕수육(12000원)");
			System.out.println("# 주문 번호를 입력하세요(1~3):");
			int chIdx = sc.nextInt()-1;//번호와 index는 -1관계
			System.out.println("# 주문 수량을 입력하세요.(1~):");
			int cnt = sc.nextInt();
			System.out.println(menus[chIdx]+"를 "+cnt+"그릇 주문하셨습니다!");
			totPay+=prices[chIdx]*cnt;
			System.out.println("계속 주문하시겠습니까?(Y/N)");
			
			if(!sc2.nextLine().equals("Y")) {
				System.out.println("주문 완료!");
				System.out.println("Have a happy time!");
				break;
			}
		}
		System.out.println("총 비용은 "+totPay+"원 입니다!");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
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
		}*/
		
	}

}
