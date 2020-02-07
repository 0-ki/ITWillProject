$(document).ready(function(){
	$('#responseEmailForm').submit(function(){
		  alert('전송하였습니다.');
	  });
});

function cancelResponse() {
	var conf = confirm("취소하시겠습니까?");
	
	if (conf == true) {
		history.go(-1);
	}
}