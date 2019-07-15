<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <title>비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 6~16자리)</title>
 <script type="text/javascript">
 function post_check()
 {

   // 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 6~16자리)
   var ObjUserPassword = document.wform.pwd;
  
   //if(ObjUserPassword.value != objUserPasswordRe.value)
   //{
   //  alert("입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다");
   //  return false;
   //}
  
   if(ObjUserPassword.value.length<6) {
     alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다.");
     return false;
   }
  
   if(!ObjUserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
     alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다.");
     return false;
   }
  
   //if(ObjUserID.value.indexOf(ObjUserPassword) > -1) {
   //  alert("비밀번호에 아이디를 사용할 수 없습니다.");
   //  return false;
   //}
  
   var SamePass_0 = 0; //동일문자 카운트
  var SamePass_1 = 0; //연속성(+) 카운드
  var SamePass_2 = 0; //연속성(-) 카운드
 
   for(var i=0; i < ObjUserPassword.value.length; i++) {
     var chr_pass_0 = ObjUserPassword.value.charAt(i);
     var chr_pass_1 = ObjUserPassword.value.charAt(i+1);
     
     //동일문자 카운트
    if(chr_pass_0 == chr_pass_1) {
       SamePass_0 = SamePass_0 + 1
     }
     
     var chr_pass_2 = ObjUserPassword.value.charAt(i+2);

     //연속성(+) 카운드
    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
       SamePass_1 = SamePass_1 + 1
     }
     
     //연속성(-) 카운드
    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
       SamePass_2 = SamePass_2 + 1
     }
   }
   if(SamePass_0 > 1) {
     alert("동일문자를 3번 이상 사용할 수 없습니다.");
     return false;
   }
  
   if(SamePass_1 > 1 || SamePass_2 > 1 ) {
     alert("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
     return false;
   }
   return true;
 }
 </script>
 </head>

 <body>
 <form name="wform" method="post" onSubmit="return post_check();" >
비밀번호 <input type="password" id="pwd" name="pwd" /><br>
 <input type="submit" value="글쓰기" />
 </form>