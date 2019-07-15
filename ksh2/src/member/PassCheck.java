package member;

import java.util.regex.Pattern;

public class PassCheck {

	
		public  int pass_check(String cid) {
			/*
			 * Matcher 클래스
			 * - 문자열이 정규표현식을 포함하는지 등 상세 판별이 가능한 클래스
			 */
			
			// 영문자, 숫자, 특수문자 중 2가지 이상을 포함하는 8자 이상의 패스워드 검증
			 
			int result = 0;
			
				String lenRegex = "[A-Za-z0-9!@#$%]{8,}"; // 길이 체크 정규표현식
				String engRegex = "[A-Za-z]"; // 영문자 체크
				String numRegex = "[0-9]"; // 숫자 체크
				String specRegex = "[!@#$%]"; // 특수문자 체크
				
				
				
				int has = 0; // 정규표현식 일치 여부를 확인하기 위해 점수를 누적할 변수
				
				// 패스워드 길이 검사(전체 규칙이 부합되어야 하므로 Pattern.matches() 로 검사)
				if(Pattern.matches(lenRegex, cid)) { 
					// 길이가 8자 이상인 경우
					// 영문자, 숫자, 특수문자를 각각 체크하여 포함되면 has 변수 값 1 증가
					// => 영문자, 숫자, 특수문자 정규표현식 내용이 포함되는지 여부를 판별하므로
					//    Matcher 클래스를 사용하여 find() 메서드를 호출하여 판별
					//    => 이 때, Matcher 타입 객체를 생성하기 위해
					//       1) Pattern.compile(정규표현식) 메서드를 호출하여 Pattern 객체를 생성하고
					//       2) 생성된 객체에 matcher(검증할데이터) 메서드를 호출하여 Matcher 객체를 생성한 뒤
					//       3) Matcher 객체에 find() 메서드를 호출하여 포함 여부 판별
					has += Pattern.compile(engRegex).matcher(cid).find() ? 1 : 0;
					has += Pattern.compile(numRegex).matcher(cid).find() ? 1 : 0;
					has += Pattern.compile(specRegex).matcher(cid).find() ? 1 : 0;
					
					if(has < 2) {
						//result ="영문자, 숫자, 특수문자 중 두 가지 이상 조합 필수!";
					result=0;
					} else {
						//result = "적합한 패스워드!";
						result=1;
					}
					
				} else {
					//result = "영문자, 숫자, 특수문자만 포함하여 8자리 이상 필수!";
					result=2;
				}
				return result;
			}
		

}
