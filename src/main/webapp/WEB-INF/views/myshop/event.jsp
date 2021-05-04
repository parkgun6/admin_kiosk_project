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

<button class='modBtn btn btn-warning' type="button">수정하기</button>
<div style="height:10px"></div>

<br>
<div class="card-header">
	<h3>${event.sname }</h3>
</div>
<div class="col-12">
	<div class="card">
		<div class="card-body content-body">
			<input type='hidden' name='sno' value='${event.sno}'>
			<input type='hidden' name='userid' value='${event.userid}'>
			<h5 class="card-title"></h5>
			${event.guide}
		</div>
	</div>
</div>

<form class='actionForm' method="get">
	<input type="hidden" name="sno" value="" readonly="readonly">
</form>

<%@include file="../includes/footer.jsp"%>
<script>

const dqs = document.querySelector.bind(document);
const actionForm = dqs(".actionForm");
console.log(actionForm);
/* ------------------------------수정/삭제 이동 이벤트------------------------------ */

	dqs(".modBtn").addEventListener("click", function(e) {
		self.location="/owner/myshop/user00/event/modify";

	}, false);
/* ------------------------------가게 소개 페이지 이동------------------------------ */
	document.querySelector('.bg-cyan').addEventListener("click", function(e){
		e.preventDefault();
		//console.log("aaa");
		self.location="/owner/myshop/user00/intro";
	},false);
/* ------------------------------안내 및 혜택 페이지 이동------------------------------ */
	document.querySelector('.bg-success').addEventListener("click", function(e){
		e.preventDefault();
		//console.log("aaa");
		self.location="/owner/myshop/user00/event";
	},false);
/* ------------------------------점포 정보 관리 페이지 이동------------------------------ */
	document.querySelector('.bg-warning').addEventListener("click", function(e){
		e.preventDefault();
		//console.log("aaa");
		self.location="/owner/myshop/user00/info";
	},false);
/* ------------------------------새 메뉴 추가 페이지 이동------------------------------ */
	document.querySelector('.bg-danger').addEventListener("click", function(e){
		e.preventDefault();
		//console.log("aaa");
		self.location="/owner/myshop/"+${event.sno}+"/menu";
	},false);
/* ------------------------------검색 이벤트------------------------------ */

</script>