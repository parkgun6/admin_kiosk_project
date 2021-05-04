<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Matrix lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Matrix admin lite design, Matrix admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Matrix Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>HOLE IN THE WALL</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/owner/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link href="/owner/resources/dist/css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	<div class="main-wrapper">
		<!-- ============================================================== -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- ============================================================== -->
		<div class="preloader">
			<div class="lds-ripple">
				<div class="lds-pos"></div>
				<div class="lds-pos"></div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Login box.scss -->
		<!-- ============================================================== -->
		<div
			class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
			<div class="auth-box bg-dark border-top border-secondary">
				<div>
					<div class="text-center pt-3 pb-3">
						<span class="db"><img
							src="/owner/resources/assets/images/logo.png" alt="logo" /></span>
					</div>
					<input type='hidden' name="${_csrf.parameterName }"
						value="${_csrf.token}" />
					<div class="row pb-4">
						<div class="col-12">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-success text-white h-100"
										id="basic-addon1"><i class="ti-user"></i></span>
								</div>
								<input type="text" class="form-control form-control-lg"
									placeholder="아이디" aria-label="Username"
									aria-describedby="basic-addon1" required name="userid">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-warning text-white h-100"
										id="basic-addon2"><i class="ti-pencil"></i></span>
								</div>
								<input type="password" class="form-control form-control-lg"
									placeholder="비밀번호" aria-label="Password"
									aria-describedby="basic-addon1" required name="userpw">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-info text-white h-100"
										id="basic-addon2"><i class="ti-pencil"></i></span>
								</div>
								<input type="password" class="form-control form-control-lg"
									placeholder="비밀번호확인" aria-label="Password"
									aria-describedby="basic-addon1" required name="checkpw">
							</div>
							<!-- 이름 -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-danger text-white h-100"
										id="basic-addon1"><i class="ti-email"></i></span>
								</div>
								<input type="text" class="form-control form-control-lg"
									placeholder="이름" aria-label="Username"
									aria-describedby="basic-addon1" required name="userName">
							</div>
						</div>
					</div>
					<div class="row border-top border-secondary">
						<div class="col-12">
							<div class="form-group">
								<div class="pt-3 d-grid">
									<button class="btn btn-block btn-lg btn-info signupBtn">Sign
										Up</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Login box.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper scss in scafholding.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper scss in scafholding.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Right Sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Right Sidebar -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- All Required js -->
	<!-- ============================================================== -->
	<script src="/owner/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="/owner/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- ============================================================== -->
	<!-- This page plugin js -->
	<!-- ============================================================== -->
	<script>
    $(".preloader").fadeOut();

	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	console.log(csrfHeaderName)
	console.log(csrfTokenValue)
    
    document.querySelector(".signupBtn").addEventListener("click",function () {
    	
    	const userid = document.querySelector("input[name='userid']").value;
    	const userpw = document.querySelector("input[name='userpw']").value;
    	const userName = document.querySelector("input[name='userName']").value;
    	const checkpw = document.querySelector("input[name='checkpw']").value;
    	
    	const data = {userid, userpw, userName}
    	
    	if(userpw != checkpw){
    		alert("비밀번호가 일치하지 않습니다.")
    		return;
    	}

     	fetch("/owner/signup",
    	{
    		method: 'post',
    		headers: {
    			'X-CSRF-Token' : csrfTokenValue,
    			'Content-type': 'application/json; charset=UTF-8'
    			},
    		body: JSON.stringify(data)
    	})
    	self.location="login";
    },false)
    </script>
</body>

</html>