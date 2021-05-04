<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<!-- Page Heading -->

<!-- ============================================================== -->
<!-- Start Page Content -->
<!-- ============================================================== -->
<div class="row">
	<!-- Column -->
	<div class="col-md-6 col-lg-3">
		<div class="card card-hover">
			<div class="box bg-cyan text-center">
				<h1 class="font-light text-white">
					<i class="mdi mdi-view-dashboard"></i>
				</h1>
				<h6 class="text-white">가게 소개</h6>
			</div>
		</div>
	</div>
	<!-- Column -->
	<div class="col-md-6 col-lg-3">
		<div class="card card-hover">
			<div class="box bg-success text-center">
				<h1 class="font-light text-white">
					<i class="mdi mdi-chart-areaspline"></i>
				</h1>
				<h6 class="text-white">안내 및 혜택</h6>
			</div>
		</div>
	</div>
	<!-- Column -->
	<div class="col-md-6 col-lg-3">
		<div class="card card-hover">
			<div class="box bg-warning text-center">
				<h1 class="font-light text-white">
					<i class="mdi mdi-collage"></i>
				</h1>
				<h6 class="text-white">점포 정보 관리</h6>
			</div>
		</div>
	</div>
	<!-- Column -->
	<div class="col-md-6 col-lg-3">
		<div class="card card-hover">
			<div class="box bg-danger text-center">
				<h1 class="font-light text-white">
					<i class="mdi mdi-border-outside"></i>
				</h1>
				<h6 class="text-white">메뉴 관리</h6>
			</div>
		</div>
	</div>
</div>
<div style="height: 50px;">
	<button class='registerBtn btn btn-warning' type="button">메뉴
		추가</button>
</div>

<div class="row el-element-overlay">
	<c:forEach items="${menu }" var="menu">
		<div class="col-lg-3 col-md-6">
			<div class="card">
				<div class="el-card-item">
					<div class="el-card-avatar el-overlay-1">
						<c:forEach items="${menu.fileList}" var="attach">
							<c:if test="${null ne attach.uuid}" >
								<img src='/owner/view?file=${attach.link }' style='width: 100%;' alt="user" />
							</c:if>
						</c:forEach>
						<a class='menu el-overlay' href='/owner/myshop/menu/${menu.mno }/modify'></a>
					</div>
					<div class="el-card-content">
						<h4 class="mb-0">${menu.name }</h4>
						<div class="text-muted">${menu.explanation }</div>
						<div class="text-muted">${menu.category }</div>
						<div class="text-muted">${menu.price }</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<script>
const dqs = document.querySelector.bind(document);
const menu = document.querySelectorAll('.menu');
console.log("aaa");
console.log();
/* ------------------------------가게 소개 페이지 이동------------------------------ */
	dqs('.bg-cyan').addEventListener("click", function(e) {
		e.preventDefault();
		//console.log("aaa");
		self.location = "/owner/myshop/user00/intro";
	}, false);
/* ------------------------------안내 및 혜택 페이지 이동------------------------------ */
	dqs('.bg-success').addEventListener("click",
			function(e) {
				e.preventDefault();
				//console.log("aaa");
				self.location = "/owner/myshop/user00/event";
			}, false);
/* ------------------------------점포 정보 관리 페이지 이동------------------------------ */
	dqs('.bg-warning').addEventListener("click",
			function(e) {
				e.preventDefault();
				//console.log("aaa");
				self.location = "/owner/myshop/user00/info";
			}, false);
/* ------------------------------새 메뉴 추가 페이지 이동------------------------------ */
	dqs('.bg-danger').addEventListener("click", function(e) {
		e.preventDefault();
		//console.log("aaa");
		self.location = "/owner/myshop/1/menu";
	}, false);

/* ------------------------------수정/삭제 이동 이벤트------------------------------ */

dqs(".registerBtn").addEventListener("click",function(e){
	self.location="/owner/myshop/menu/register";
},false)


</script>
<%@include file="../includes/footer.jsp"%>

