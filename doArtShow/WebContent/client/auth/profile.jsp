<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.seeAll{
      text-align : right;
      float: right;
      padding-top: 5px;
    }
.box a:link, .iconDiv a:link {
color: gray;
text-decoration: none;
}

.box a:visited,.iconDiv a:visited {
color: gray;
text-decoration: none;
}

.box a:hover,.iconDiv a:hover {
color: gray;
text-decoration: underline;
}

.box a {
vertical-align: middle;
line-height: 250px;
}

.iconDiv label {
color: gray;
font-size: 1.2em;
}

.boxFull{
		min-height : 500px;
		overflow: hidden;
	}

@media(max-width: 1200px){
	.boxFull{
		min-width: 100%;
		height:auto;
	}
	.oneRev{
		min-width: 40vw;
	}

}
@media(min-width: 1200px){
	.boxFull{
		min-width: 100%;
		height:auto;
	}
	.oneRev{
		min-width : 30vw;
	}
}
@media(max-width: 1200px){	
	#profileImg{
	padding: 30px;
	
	min-width: 35vw;
	min-height: 35vh;
	
	float: left;
	
	}
	#profileImg img{
	min-width : 200px;
	height : auto;
	}
	#profile{
	padding: 30px;
	
	min-width: 40vw;
	min-height: 35vh;
	float : left;
	}
	
}

@media(min-width: 1200px){
	#profileImg{
	padding: 30px;
	
	min-width: 25vw;
	min-height: 35vh;
	}
	#profileImg img{
	width : 15vw;
	height : auto;
	}
	#profile{
	padding: 30px;
	
	min-width: 25vw;
	}
}
.iconDiv{
	width : 100px;
	float : left;
}
</style>
<!-- ======================= profileDiv ================================= -->


<div class="container col-lg-2" id="profileDiv" style="margin-top:25px; padding-rigth:20px;">
    <div id="profileImg">
        <img  style="max-width : 200px;" src="/doArtShow/memberProfileImages/${member.profileImg}" alt="${member.profileImg}">
    </div>
    <div id="profile">
        <div id="profileName" style="font-size: 3em; margin-top:20px;font-weight:bold; margin-bottom:100px;">
            ${member.name}
        </div>
        <div id="profileIcon">
        
	        <div class="iconDiv">
	        <a style="width:90px;" href="<%=request.getContextPath()%>/client/auth/reviewList.do">
	        <img src="/doArtShow/resourcesImages/myreview.png">
	        </a>
	        </div>
	        <div class="iconDiv">
	        <a style="width:90px;" href="<%=request.getContextPath()%>/client/auth/wishList.do">
	        <img src="/doArtShow/resourcesImages/wishList.png">
	        </a>
	        </div>
	        <div class="iconDiv">
	        <a style="width:90px;" href="<%=request.getContextPath()%>/client/auth/memberDetail.do">
	        <img src="/doArtShow/resourcesImages/setting.png">
	        </a>
	        </div>
	     </div>
    </div>
</div>
<!-- ====================================================================== -->