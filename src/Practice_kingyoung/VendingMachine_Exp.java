package Practice_kingyoung;

import java.util.Scanner;

public class VendingMachine_Exp {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		
		VendingMachine machine = new VendingMachine();
		machine.addMenu(new Drink("콜라",1500,3));
		machine.addMenu(new Drink("사이다",1300,1));
		machine.addMenu(new Drink("환타",1000,2));
		
		while(true) {
			machine.displayMoney();
			System.out.println("금액을 투입하시겠습니까 ?(Y/N)");
			if(sc.next().equals("Y")) {
				System.out.println("투입 금액을 입력하세요>>");
				machine.addMoney(sc.nextInt());
			}
			machine.showMenu();
			System.out.println("메뉴를 선택하세요.");
			machine.choiceMenu(sc.nextInt()-1);
			System.out.println("더 구매하시겠습니까?(Y/N)");
			if(!(sc.next().equals("Y")))break;
		}
		machine.returnMoney();
		System.out.println();
	}

}
