<!DOCTYPE html>
<html><!--  lang="kr" -->

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>NaverLoginSDK</title>
</head>

<body>
   <script src="/doArtShow/js/jquery-3.4.1.js" type="text/javascript"></script>
   <script src="/doArtShow/js/naveridlogin_js_sdk_2.0.0.js" type="text/javascript"></script>
   <script type="text/javascript"  type="text/javascript" charset="utf-8">

   var email,name,profileImage,birthday,uniqId,age,gender;
   var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "QvLk55msCCyAfv2p50Yg",
            callbackUrl: "http://localhost:8888/doArtShow/NaverCallback",
            /* contentType: "application/x-www-form-urlencoded; charset=UTF-8", */
            isPopup: false,
            callbackHandle: true
         }
      );
      naverLogin.init();

      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {

            if (status) {
                 email = naverLogin.user.getEmail();
                 name = naverLogin.user.getNickName();
   				 profileImage = naverLogin.user.getProfileImage();
   				 birthday = naverLogin.user.getBirthday();			
   				 uniqId = naverLogin.user.getId();
   				 age = naverLogin.user.getAge();
   				 gender = naverLogin.user.getGender();
   				
   				// if문에 걸려서 alert가 호출시에 URL Encoding이 된 상태로 출력됨.한글 깨짐
               if( email == undefined || email == null) {
                  alert('Email is required. Please agree to provide information.');
                  //alert(new String(str.getBytes("utf-8"), '이메일은 필수항목입니다.'));
                  //alert(URLDecoder.decode( '이메일은 필수항목입니다.',"utf-8"));
                  //alert(encodeURIComponent(encodeURIComponent('이메일은 필수항목입니다.')));
                  //alert(encodeURIComponent('이메일은 필수항목입니다.')+'\n'+decodeURIComponent('이메일좀줘'));
                  naverLogin.reprompt();
                  return;
               }
               if( name == undefined || name == null) {
                  alert("Name is required. Please agree to provide information.");
                  naverLogin.reprompt();
                  return;
               }
               if( birthday == undefined || birthday == null) {
                  alert("Birthday is required. Please agree to provide information.");
                  naverLogin.reprompt();
                  return;
               }
               if( gender == undefined || gender == null) {
                  alert("Gender is required. Please agree to provide information.");
                  naverLogin.reprompt();
                  return;
               }
               birthday = '0000-'+birthday;
              /*  if(gender=='M'){
            	   gender='남성';
               }else if(gender=='F'){
            	   gender='여성';
               } */
               alert( email +'\n'+name+'\n'+profileImage+'\n'+birthday+'\n'+uniqId+'\n'+age+'\n'+gender); // 로그인 한 이메일 ***@naver.com 이 출력된다.
               //////////////////////////////////////////

               	  $.ajax({
		        		type: "POST",
		        		url: "/doArtShow/naverLogin.do",
		        		async: false,
		        		data: {'nid':uniqId, 'email':email, 'name':name,'birth':birthday,'gender':gender},
		        		success: function(data){
		        																	console.log("성공");
		        					  if(data.res==1){
		        																	console.log("로그인처리됨");
		        					location.reload(true);
		        				}else if(data.res==2){
		        					alert("네이버 계정에서 사용중인 이메일이 이미 사용중입니다.\n이메일로 로그인 해주세요.\n Email Already Used");
		           				}else if(data.res==3){
		           					alert('로그인/회원가입 처리중 오류가 발생하였습니다.\n다시 시도하시거나 관리자에게 문의해주세요.');
		           				}
		        		},
		        		error: function(e){
		        			alert('네이버 로그인에 실패했습니다.\n다시 시도하시거나 관리자에게 문의해주세요.');
		        		}
		        	});
               
               //////////////////////////////////////////
               window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/doArtShow");
            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
   </script>
</body>

</html>