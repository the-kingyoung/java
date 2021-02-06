package a02_object.a03_method;

public class A03_AutoSellingMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AutoSellingMachine am = new AutoSellingMachine();
		am.inputMoney(1000);
		am.inputMoney(500);
		am.inputMoney(2500);
		am.showMenu();
		String bev = am.choiceButton(2);
		System.out.println("자판기를 통해 나온 음료" + bev);
		System.out.println("자판기를 통해 나온 음료" + am.choiceButton(3));

/*
 ex) Mart 클래스
 	메서드1) showProduct() 마트에서 판매하는 물건
 				1.컵라면  2.음료  3.제과
 	메서드2) buy() 선택한 물건 번호로 선택해서 return값으로 선택한 물건이 나오게 처리
 
 
 *
 */
	}

}
