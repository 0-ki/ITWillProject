	
	<div class="modal fade" id="shareModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" id="shareModal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> </h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <div id="sns-go">
                    	<span class="snslink">
                    		<a href="javascript:sendLinkFaceBook()" title="페이스북으로 공유하기"><img src="/doArtShow/resourcesImages/sns_face.png" width="36" alt="FaceBook"></a>
                    	</span>
                    	<span class="snslink">
                    		<a href="javascript:sendLinkTwitter()" title="트위터로 공유하기"><img src="/doArtShow/resourcesImages/sns_tw.png" width="36" alt="Twitter"></a>
                    	</span>
                    	<span class="snslink">
                    		<a href="javascript:sendLinkNaver()" title="네이버로 공유하기"><img src="/doArtShow/resourcesImages/sns_naver.png" width="36" alt="Naver"></a>
                    	</span>
                    	<span class="snslink">
                    		<a href="javascript:sendLinkKakao(this)" id="kakao-link-btn" title="카카오톡으로 공유하기"><img src="/doArtShow/resourcesImages/sns_ka.png" width="36" alt="KakaoTalk"></a>
                    	</span> 
                    </div>
                </div>
                
                <!-- Modal footer -->
                <div id="shareModal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">ë«ê¸°</button>
                </div>
            </div>
        </div>
    </div>
   
   
<script>
	function sendLinkFaceBook(){
	    var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(document.URL) + "&t=" + encodeURIComponent(document.title);
	    window.open(facebook_share_url,
	                'Share on Facebook',
	                'scrollbars=no, width=500, height=500');
	}
	function sendLinkTwitter(){
	    var twitter_share_text = encodeURIComponent(document.title);
	    var twitter_share_url = encodeURIComponent(document.URL);
	    window.open("https://twitter.com/share?text=" + twitter_share_text + "&url=" + twitter_share_url,
	                'Share on Twitter',
	                'scrollbars=no, width=500, height=500');
	}
	function sendLinkNaver(){
	    var raw_url = encodeURIComponent(document.URL);
	    var raw_title = encodeURIComponent(document.title);
	    var naver_root_url = "http://share.naver.com/web/shareView.nhn?url="
	    var naver_share_url = naver_root_url + encodeURI(raw_url) + "&title=" + encodeURI(raw_title);
	    window.open(naver_share_url,
	                'Share on Naver',
	                'scrollbars=no, width=500, height=500');    
	}
	
	/* Kakao.init('3f954d79af6a536ec76db999e7f2ba5b'); */
	function sendLinkKakao(){
		Kakao.Link.sendDefault({
			objectType: 'feed',
			content: {
				title: encodeURIComponent(document.title),
				imageUrl: /*  해당 전시회의 포스터 이미지*/,
				link: {
					mobileWeUrl: encodeURIComponent(document.URL),
					webUrl: encodeURIComponent(document.URL),
				}
			},
			
			buttons: [
				{
					title: '링크열기',
					link: {
						mobileWeUrl: encodeURIComponent(document.URL),
						webUrl: encodeURIComponent(document.URL)
					}
				}
			]
		)};
	}
</script>  
    