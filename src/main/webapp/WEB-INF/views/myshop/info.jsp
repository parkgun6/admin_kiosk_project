<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<!-- Page Heading -->
<%-- 
<h2>${board }</h2>
<h3>${pageDTO }</h3> --%>
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

<table class="table table-bordered">
	<tr>
		<th>이름</th>
		<td><input type="text" class="form-controlInfo" name="sname"
			value="${info.sname}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" class="form-controlInfo" name="tel"
			value="${info.tel}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" class="form-controlInfo" name="address"
			value='${info.address}' readonly="readonly"></td>
	</tr>
	<tr>
		<th>영업시간</th>
		<td><textarea rows="5" class="form-controlInfo" name="businesshour"
				readonly="readonly">${info.businessHour}</textarea></td>
	</tr>
	<tr>
		<th>휴무일</th>
		<td><textarea rows="5" class="form-controlInfo" name="holiday"
				readonly="readonly">${info.holiday}</textarea></td>
	</tr>
	<tr>
		<th>위도</th>
		<td><input type="text" class="form-controlInfo" name="lat"
			value='${info.lat}' readonly="readonly"></td>
	</tr>
	<tr>
		<th>경도</th>
		<td><input type="text" class="form-controlInfo" name="lng"
			value='${info.lng}' readonly="readonly"></td>
	</tr>
</table>

<div style="height:214px"></div>

<%@include file="../includes/footer.jsp"%>

<script>


const dqs = document.querySelector.bind(document);

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
	self.location="/owner/myshop/"+${info.sno}+"/menu";
},false);

/* ------------------------------수정 이동 이벤트------------------------------ */


dqs(".modBtn").addEventListener("click",function(e){
	self.location="/owner/myshop/user00/info/modify";
},false)



</script>
