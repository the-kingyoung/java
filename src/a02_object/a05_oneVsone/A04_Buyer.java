package a02_object.a05_oneVsone;

public class A04_Buyer {
	String name;
	//A04_Buyer객체를 만들면 종속적인 A03_Product객체를 
	//할당할 수 있게 선언
	A03_Product prod;
	
	public A04_Buyer(String name) {
		super();
		this.name = name;
	}

}
