<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Hole In The Wall - Login</title>

<!-- Custom fonts for this template-->
<link href="/owner/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/owner/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Login</h1>
									</div>
									<form class="user" action="login" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												name="username" placeholder="아이디를 입력해주세요.">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												name="password" placeholder="패스워드를 입력해주세요.">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">자동
													로그인</label>
											</div>
										</div>

										<input type='hidden' name="_csrf" value="${_csrf.token }">

										<button class="btn btn-primary btn-user btn-block">
											Login</button>
										<hr>
										<a href="index.html" class="btn btn-google btn-user btn-block">
											<i class="fab fa-google fa-fw"></i> Login with Google
										</a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="/owner/signup">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/owner/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="/owner/resources/assets/libs/bootstrap/dist/jsbootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/owner/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/owner/resources/js/sb-admin-2.min.js"></script>

</body>

</html>