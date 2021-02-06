package a02_object.a03_method;

public class Mart {
	
	
	void showProduct() {
		System.out.println("# 마트에서 파는 물건 #");
		System.out.println("1. 컵라면");
		System.out.println("2. 음료");
		System.out.println("3. 제과");
	}
	//String으로 리턴되는 메서드 선언..
	
	
	String buy(int chNum) {
		String chMenu = "";
		//조건에 따라서 return메뉴가 다르게 처리..
		if(chNum==1) {
			chMenu = "컵라면";
		}
		else if(chNum==2) {
			chMenu = "음료";
		}
		else if(chNum==3) {
			chMenu = "제과";
		}
		else {
			chMenu = "선택된 메뉴가 없습니다.";
		}
		return chMenu;
		
	}

}
