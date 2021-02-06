package a01_1211Exp;

import java.util.Scanner;

public class Ex04_priceExp {
	public static void main(String[] args) {
		double fee=50000;
		System.out.println("나이가 어떻게 되십니까?");
		Scanner scan = new Scanner(System.in);
		int age = scan.nextInt();
		
		if(age<=3||age>=65) {
			System.out.println("기존 입장료 :"+fee+"원\n"+"3세 이하, 65세 이상은 입장료가 무료입니다.");	
		}else if(4<=age&&age<=7) {
			System.out.println("기존 입장료 :"+fee+"원\n"+"4세~7세는 50% 할인된 가격인 "+fee*0.5+"원 입니다.");
		}else if(8<=age&&age<=13) {
			System.out.println("기존 입장료 :"+fee+"원\n"+"8세~13세는 40% 할인된 가격인 "+fee*0.6+"원 입니다.");
		}else if(14<=age&&age<=19) {
			System.out.println("기존 입장료 :"+fee+"원\n"+"14세~19세는 20% 할인된 가격인 "+fee*0.8+"원 입니다.");
		}else {
			System.out.println("입장료는 50000원 입니다.");
		}
	}

}
/*
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

 */
