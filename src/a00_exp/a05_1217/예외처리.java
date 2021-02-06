package a00_exp.a05_1217;

public class 예외처리 {
	public static void main(String[] args) {
		try {
			System.out.println("수행1");
			System.out.println("수행2");
			System.out.println("수행1" + 1 / 0);
			System.out.println("수행4");
		} catch (ArithmeticException e) {
			System.out.println("예외 발생" + e.getMessage());
		} finally {
			System.out.println("예외 상관없이 수행할 내용");
		}
		System.out.println("수행5");
		
		try {
		String name=null;
		System.out.println("카운트1");
		System.out.println(name.toString());
		}catch(NullPointerException ne){
			System.out.println("# 데이터에 입력값이 null입니다. #");
			System.out.println("예외내용:"+ne.getMessage());
		}catch(Exception e) {
			System.out.println("# 기타 예외 발생 #");
			System.out.println("예외 내용:"+e.getMessage());
		}finally {
			System.out.println("예외 상관없이 처리할 코드");
		}
		System.out.println("수행3");
		
		
		
		
		
		
		

	}

}
