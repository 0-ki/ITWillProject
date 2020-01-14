<!DOCTYPE html>
<html lang="kr">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>NaverLoginSDK</title>
</head>

<body>
   <script src="/doArtShow/js/jquery-3.4.1.js"></script>
   <script src="/doArtShow/js/naveridlogin_js_sdk_2.0.0.js"></script>
   <script>
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "QvLk55msCCyAfv2p50Yg",
            callbackUrl: "http://localhost:8888/doArtShow/NaverCallback",
            isPopup: false,
            callbackHandle: true
         }
      );
      naverLogin.init();

      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {

            if (status) {
                var email = naverLogin.user.getEmail();
                var name = naverLogin.user.getNickName();
   				var profileImage = naverLogin.user.getProfileImage();
   				var birthday = naverLogin.user.getBirthday();			
   				var uniqId = naverLogin.user.getId();
   				var age = naverLogin.user.getAge();
   				var gender = naverLogin.user.getGender();
               if( email == undefined || email == null) {
                  alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                  naverLogin.reprompt();
                  return;
               }
               alert( email ); // 로그인 한 이메일 ***@naver.com 이 출력된다.
               window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/doArtShow");
            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
   </script>
</body>

</html>