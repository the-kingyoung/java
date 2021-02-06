package a01_1211Exp;

import java.util.ArrayList;
import java.util.Collections;

/*
6. Card :
	필드	:	번호, 모양		52를 배열을 선언
	번호 : A 2 3 4 5 ... J Q K
	모양 : ♠	♣ ◈	♥
		메서드 : show() 번호와 모양을 출력
		1) ArrayList<Card> 카드 52개 만들기
		2) 이 중에서 임의로 7장 뽑아서 출력 show()
 */
public class Ex06_Card {
	private String num;
	private String shape;
	
	public Ex06_Card(String num, String shape) {
		super();
		this.num = num;
		this.shape = shape;
	}
	public void show() {
		System.out.println(shape+""+num+" ");
	}
//카드 구성
//ArrayList<Card> : Card로 된 ArrayList형 List객체를 생성한다.
//ArrayList는 기본적으로 모든 객체(Object)가 할당될 수 있지만, generic(<객체>)
//이용해서 해당 객체 type만 할당할 수 있게 선언.
	
public static void main(String[] args) {
	ArrayList<Ex06_Card> cards = new ArrayList<Ex06_Card>();
	//배열로 카드의 숫자 선언.
	String []nums= {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
	//배열로 카드의 모양 선언..
	String [] shapes = {"♠","♣","◈","♥"};
	//모양별로 숫자가 할당되게..
	//1. 모양 배열 호출..
	for(String shape:shapes) {
		//2. 이중 for문으로 모양별로 숫자가 할당.;.
		for(String num:nums) {
			//cards list 유형 데이터에..add()를 통해서 객체가 추가되게 처리..
			//new Ex06_Card(번호, 모양)할당되게 처리..
			cards.add(new Ex06_Card(num,shape));
		}
	}
	//ArrayList 객체.
	//1. add(추가 객체);
	//2. get(index) : 특정한 index에 있는 객체를 가져올 수 있다.
	//3. size() : 현재 ArrayList의 크기를 가져온다.
	System.out.println("카드의 갯수:"+cards.size());
	//총 52개의 카드가 만들어져서, 메서드를 통해서 확인할 수 있다.
	System.out.println("카드 list");
	for(Ex06_Card d:cards) {
		d.show();
	}
	System.out.println();
	
	System.out.println("# 랜덤으로 7장 카드 뽑기(중복도 가능) #");
	for(int cnt=1;cnt<=7;cnt++) {
		System.out.print(cnt+"번째 카드:");
		//카드의 갯수만큼 경우의 수 적출
		//Math.random()*경우의수52가지(0~51)임의의 수..
		int rIdx=(int)(Math.random()*cards.size());
		//cards.get(index)
		//리스트.get(임의의 인덱스 위치).show()출력..
		cards.get(rIdx).show();
	}
	System.out.println();
	//# 반복제거 방법
	//1. 배열의 알고리즘으로 반복 제거..(2중 for문)
	//2. collections.shuffle()메서드 활용..
	//	52장 카드를 섞어주는 처리
	//	list 객체를 섞어주는 api
	System.out.println("## 중복 제거 처리 ##");
	Collections.shuffle(cards);
	for(int idx=0;idx<7;idx++) {
		cards.get(idx).show();
	}
}
}

