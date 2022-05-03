<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
     <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 로그인 메소드 -->
    <script type="text/javascript">
    
	    //카카오 앱키 등록 
	  	 Kakao.init('64ed36d1841e64546a5f0ad441b1cfe8');
	   
	    function Fnkakao() {
	    	Kakao.Auth.login({
	    		success: function(auth) {
	    		    Kakao.API.request({
	    		        url: '/v2/user/me',
	    		        success: function(response) {
	    		           /*  console.log(response); */
	    		            var account = response.kakao_account;
							
							$('#form-kakao-login input[name=member_email]').val(account.email);
							$('#form-kakao-login input[name=member_name]').val(account.profile.nickname);
							
							/* //섬네일 이미지
							console.log(account.profile.thumbnail_image_url);
							
							//프로필 이미지
							console.log(account.profile.profile_image_url);
							 */
							
							$('#form-kakao-login input[name=member_photo]').val(account.profile.thumbnail_image_url);
							// 사용자 정보가 포함된 폼을 서버로 제출한다.
							  document.querySelector('#form-kakao-login').submit();
	    		            
	    		        },
	    		        fail: function(error) {
	    		            console.log(error);
	    		        }
	    		    });
	    		    
	    		  },
	    		  fail: function(error) {
	    		    console.log("카카오 로그인 실패");
	    		  },

	    	});
	    	
		  
		}
    </script>
    
<title>Insert title here</title>
<style>
	main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }
</style>
</head>
<body>
	<c:import url="/header.do"></c:import>
	
	<main>
    <div class="container" style="text-align: center; margin-top: 10%;">
        <div class="row">
            <div class="col-sm">
            </div>
            <div class="col-sm">
                <button type="button" onclick="Fnkakao()" class="btn btn-outline-warning" style="width: 49%;">카카오</button>
                <button type="button" class="btn btn-outline-success" style="width: 49%;">네이버</button>
                <br><br>
                <form action="login.do" method="post" id="login">
                    <div class="form-floating mb-3">
                        <input type="email" name="member_email" class="form-control" id="floatingInput" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" name="member_password" class="form-control" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <br>
                    <button type="button" onclick="document.getElementById('login').submit();"  class="btn btn-outline-info" style="width: 100%;">로그인</button>
                    <br>
                    <br>
                    <a href="emailpw_find.do">이메일, 비밀번호 찾기</a> 
                    |
                    <a href="join_select.do">회원가입</a>
                </form>
            </div>
            <div class="col-sm">
            
            </div>
            
        </div>
    </div>
    </main>
     <form id="form-kakao-login" method="post" action="join_kakao.do">
		    			<input type="hidden" name="member_email"/>
		    			<input type="hidden" name="member_name"/>
		    			<input type="hidden" name="member_photo"/>
		    				
	</form>
    <c:import url="/footer.do"></c:import>
</body>
</html>