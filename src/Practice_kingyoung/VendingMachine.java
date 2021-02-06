package Practice_kingyoung;

import java.util.ArrayList;

public class VendingMachine {
	private int inputMoney;
	private ArrayList<Drink> drinks;
	
	public VendingMachine() {
		drinks = new ArrayList<>();
	}
	public void addMoney(int inputMoney) {
		this.inputMoney += inputMoney;
		displayMoney();
	}
	public void displayMoney() {
		System.out.println("투입금액:"+inputMoney);
	}
	public void showMenu() {
		System.out.println("# 자판기 메뉴 #");
		if(drinks != null) {
			int i = 1;
			for(Drink d : drinks) {
				System.out.println(i+","+d.getName()+"("+d.getPrice()+"),"+d.getCnt()+"개");
				i++;
			}
		}
	}
	public void addMenu(Drink drink) {
		drinks.add(drink);
	}
	public void choiceMenu(int num) {
		if(!(num>drinks.size())) {
			if(inputMoney>=drinks.get(num).getPrice()) {
				if(drinks.get(num).getCnt()>0) {
					drinks.get(num).setCnt((drinks.get(num).getCnt()-1));
					inputMoney-=drinks.get(num).getPrice();
					System.out.println(drinks.get(num).getName()+"를 구매하였습니다.");
					displayMoney();
				}else {
					System.out.println("해당 메뉴는 품절 되었습니다.");
				}
			}else {
				System.out.println("투입금액이 모자랍니다.");
			}
		}else {
			System.out.println("해당 메뉴는 존재하지 않습니다.");
		}
	}
	public void returnMoney() {
		System.out.println("거스름돈:"+inputMoney);
		int[]moneys= {10000,5000,1000,500,100,50,10};
		for(int i=0;i<moneys.length;i++) {
			if(inputMoney/moneys[i]>0) {
				System.out.println(moneys[i]+"원"+inputMoney/moneys[i]+"개");
			}
			inputMoney%=moneys[i];
		}
	}

}
class Drink{
	private String name;
	private int price;
	private int cnt;
	
	public Drink(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return name;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
