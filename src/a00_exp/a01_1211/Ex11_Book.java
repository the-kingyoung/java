package a00_exp.a01_1211;
/*
 * 11. Book 클래스를 만들고,
	생성자로 도서명을 입력받고
	buy(..,..)를 통해서 가격과, 갯수를 입력받아 처리하고
	tot()를 통해서 총액을 계산을 return받아 처리하고
	prn()을 통해서 현재 구매한 도서의 도서명, 가격, 갯수 출력하세요.
	도서를 3권으로 구매처리하고, 총비용을 출력하세요.
 */

public class Ex11_Book {
	private String name;
	private int price;
	private int cnt;
	
	public Ex11_Book(String name) {
		super();
		this.name = name;
	}
	void buy(int price, int cnt) {
		this.price=price;
		this.cnt=cnt;
	}
	int tot() {
		return (price*cnt);
	}
	void prn() {
		System.out.println("# 책 정보 #");
		System.out.println("책 제목 : "+ name);
		System.out.println("책 가격 : "+ price);
		System.out.println("책 수량 : "+ cnt);
	}
	

}
