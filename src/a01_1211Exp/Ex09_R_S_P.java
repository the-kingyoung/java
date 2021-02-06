package a01_1211Exp;
/*
 * String []games = {"가위","바위","보"}
 * System.out.println("가위,바위,보를 입력하세요);
 * System.out.print("가위(1), 바위(2), 보(3)를 입력하세요.");
 * int myIdx = sc.nextInt()-1; //배열과 인덱스와 번호의 차이로 -1
 * System.out.println("내가 낸 내용:"+games[chIdx]);
 * int comIdx = (int)(Math.random()*games.length);//0,1,2 중에 임의로 출력
 * System.out.println("컴퓨터의 결과:"+games[ranIdx]);
//games[0],games[1],games[2] 중에 하나가 나온다.
 * 가위		바위			보
 * 내가 승이 되는 경우
 * 컴퓨터 0일때, 내가 1
 * 컴퓨터 1일때, 내가 2
 * 컴ㅍ터 2일때, 내가 0
 * 컴퓨터의 (idx +1)%3 == 나의 index ==>내가 승리
 * if (비기는 경우){//두 index가 같은 경우
 * 
 * }else if(내가 이기는 경우){
 * 		컴퓨터의 index 번호에서 +1하고 나머지 3을 처리한 결과가
 * 		나의 index와 같으면 나의 승..
 * }else{
 * 		컴퓨터가 이기는 경우..
 * 		//컴퓨터의 index번호에서 +2하고 나머지 3을 처리한 결과가
 * 		//나의 index와 같으면 컴퓨터의 승
 * }
 * 
 * 
 * if(myIdx==comIdx){
 *		 System.out.println("무승부")
 *}else if((comIdx%3+1)==myIdx){
 *		내가 나온임의의 index값에서 %3처리하고 index값 1더했을때
 *		상대방의 idx와 동이하면 상대방이 승리.
 *		System.out.println("나의 승리");
 *}else{
 *		System.out.println("컴퓨터 승리);
 *}
 *
 * 
 */


import java.util.Scanner;

public class Ex09_R_S_P {
	public static void main(String[] args) {
		System.out.print("가위(1), 바위(2), 보(3)를 입력하세요.");
		Scanner scan = new Scanner(System.in);
		int game = scan.nextInt();
		int dice = (int)((Math.random()*3)+1);	

		if (1 > game || game > 3) {
			System.out.println("숫자를 다시 입력해주세요.");
		}else {

			switch(game) {
				case 1:System.out.println((dice == 1) ? "무승부" : (dice == 2) ? "컴퓨터 바위로 사용자패배" : "컴퓨터 보자기로 사용자승리"); break;
				case 2:System.out.println((dice == 2) ? "무승부" : (dice == 3) ? "컴퓨터 보자기로 사용자패배" : "컴퓨터 가위로 사용자승리"); break;
				case 3:System.out.println((dice == 3) ? "무승부" : (dice == 1) ? "컴퓨터 가위로 사용자패배" : "컴퓨터 바위로 사용자승리"); break;
			}
		}
	}
}
