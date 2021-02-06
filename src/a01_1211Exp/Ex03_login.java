package a01_1211Exp;

import java.util.Scanner;

/*
3.	Scanner을 통해서 id와 pass입력을 하고, himan/7777일 때,
	로그인 성공 그렇지 않을 때, 로그인 실패를 처리하는 프로그램을 만들어보세요.
 */

public class Ex03_login {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력하시오.");
		String id = scan.nextLine();
		
		System.out.println("패스워드를 입력하시오");
		String pass = scan.nextLine();
		
		System.out.println(id.equals("himan")&&pass.equals("7777")?"로그인 성공":"로그인 실패");
	}

}
