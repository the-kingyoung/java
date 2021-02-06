package a01_1211Exp;
/*
7.	Math.random()을 이용해서 주사위가 1~6번호가 나오게 하고, 실행할 때마다
	해당 번호가 나온 확률을 표기하세요. (중급)
	반복문으로 6회 실행하여
	나온 번호 : @@
	1:@@@%, 2:@@@%, 3:@@@%, 4:@@@%, 5:@@@%, 6:@@@%
 */

public class Ex07_Dice {
	public static void main(String[] args) {
		//1~6까지 해당 수가 나오면 counting 처리할 변수 선언.
		int no1=0; int no2=0; int no3=0; int no4=0; int no5=0; int no6=0;
		for(int cnt=1;cnt<=6;cnt++) {
			System.out.println(cnt+"번째 주사위 던지기");
			int dice = (int)(Math.random()*6+1);//1~6임의의 수 나오기
			System.out.println("나온 주사위 번호:"+dice);
			//나온 번호에 따른 번호별 횟수 카운트 업
			if(dice==1) no1++;
			if(dice==2) no2++;
			if(dice==3) no3++;
			if(dice==4) no4++;
			if(dice==5) no5++;
			if(dice==6) no6++;
			//no1/cnt : 소수점 이하의확률이 나온다. 3/횟수 ==> 0.5
			//*100 : % 로 변환 50.0
			//(int) : 정수로 casting처리..
		}
		System.out.println("\n\t# 나온 확률 #");
		System.out.println("1: "+(int)((no1/6.0)*100)+"%\t");
		System.out.println("2: "+(int)((no2/6.0)*100)+"%\t");
		System.out.println("3: "+(int)((no3/6.0)*100)+"%\t");
		System.out.println("4: "+(int)((no4/6.0)*100)+"%\t");
		System.out.println("5: "+(int)((no5/6.0)*100)+"%\t");
		System.out.println("6: "+(int)((no6/6.0)*100)+"%\t");
		
	}

}
