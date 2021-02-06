package a02_object.a03_method;

public class A02_CalculatorMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator c1 = new Calculator();
		int num01 = 25;
		int num02 = 5;
		
		int sum = c1.plus(num01, num02);
		System.out.println("첫번째 결과값:" + sum);
		
		
		sum = c1.minus(num01, num02);
		System.out.println("두번째 결과값:" + sum);
		
		
		sum = c1.multi(num01, num02);
		System.out.println("세번째 결과값:" + sum);
		
		
		double sum2 = c1.divide(num01, num02);
		System.out.println("네번째 결과값:" + sum2);

	}

}
