package a02_object.a03_method;

public class MartMain {
	public static void main(String[] args) {

		Mart m1 = new Mart();
		String chMenu = m1.buy(2); // 리턴값이 있는 메서드
		System.out.println("선택된 메뉴 : " + chMenu);
		System.out.println("선택된 메뉴 : " + m1.buy(5));

	}

}