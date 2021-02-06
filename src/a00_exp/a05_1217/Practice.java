package a00_exp.a05_1217;

public class Practice {
	public static void main(String[] args) {
		try {
			for (int i = 0; i < 3; i++) {
				System.out.println(i + 1 + "번째 과일:" + args[i]);
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("예외발생1" + e.getMessage());
		} catch (Exception a) {
			System.out.println("예외발생2" + a.getMessage());
		} finally {
			System.out.println("아무일도 없었다.");
		}

	}
}
