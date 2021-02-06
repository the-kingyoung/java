package a05_exception;

public class A02_Hierarchy {
	public static void main(String[] args) {
/*
# 예외의 계층 구조.
1. 	예외는 Exception을 상위로 하여, 상속받는 하위의 여러가지 예외클래스로
	계층구조화 될 수 있다. 예외에 대한 메모리 처리를 효과적으로 하기 위하여 계층화 한다.

2.	이런 계층 구조화된 예외는
	try{
	}catch(최하위 예외){
	
	}catch(하위 예외){
	
	}catch(상위 예외){
	
	}	//형식으로 계층화된 예외를 처리하여야 한다.
	F11 : 디버그 모드로 하면 이렇게 됩니다.
	ctrl + F11 : 실행모드로 하면 정상으로 나옵니다.
 */
		System.out.println("입력한 과일");
		try {
			for(int i=0;i<3;i++) {
				System.out.println(i+1+"번째 과일:"+args[i]);
			}
			System.out.println(4/0);
		}catch(ArrayIndexOutOfBoundsException e) {//하위예외,,
			System.out.println("예외처리1:"+e.getMessage());			
		}catch(Exception e) {
			System.out.println("예외처리2:"+e.getMessage());
		}finally {
			System.out.println("예외 상관 없이 처리할 내용.!!");
		}
		
	}

}
