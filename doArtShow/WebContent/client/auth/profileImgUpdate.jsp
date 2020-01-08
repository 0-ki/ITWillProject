<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="../js/checkEmail.js"></script>
<title>프로필 사진 수정</title>
<style>
    #emailChkModalBtn{
    	margin : 1vw;
    }
    #img_preview{
    	height : 50vh;
    	overflow : hidden;
    }
    img{
    	height : 30vh;
    	overflow : hidden;
    }
</style>

<script language="javascript">
function readURL(input) {
 if (input.files && input.files[0]) {
  var reader = new FileReader();
  
  reader.onload = function (e) {
   $('#img_preview').attr('src', e.target.result);  
  }
  
  reader.readAsDataURL(input.files[0]);
  }
}
	  
$("#profileImg").change(function(){
   readURL(this);
   console.log($("#profileImg").attr('src'));
});	

function setId(){
	opener.document.updateForm.profileImg.value=document.imgUpdateForm.profileImg.value;
	self.close();
}
</script>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<div class="container" id="mainContainer">
	<form name="imgUpdateForm">
        <table align="center">
        	<tr>
        		<td id="formTitle">프로필 사진</td>
        	</tr>
        	<tr>
        		<td><input class="form-control" type="file" name="profileImg" id="profileImg"></td>
        	</tr>       	
            <tr>
            	<td>
            		<div id="img_preview"><img src="#"/></div>
            	</td>
            </tr>
            <tr colspan="2">
				<td>
				<input class="btn" type="button" value="이미지 사용" id="imgUseBtn" onclick="setId()"></td>
			</tr>
        </table>
    </form>
</div>
<script type="text/javascript">
$(document).
</script>
</body>
</html>