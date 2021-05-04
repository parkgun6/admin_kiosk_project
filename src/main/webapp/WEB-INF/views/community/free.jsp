<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../includes/header.jsp" %>

<!-- Page Heading -->

<h1 class="mt-4">NOTICE PAGE</h1>
	
<button class="registerBtn btn btn-primary" type="button">글쓰기</button>


<div class="listPage">
<table class="table">
  <thead class="thead-dark" style="width: 50%">
    <tr>
      <th scope="col" style="width: 1%">번호</th>
      <th scope="col" style="width: 20%">제목</th>
      <th scope="col" style="width: 3%">작성자</th>
      <th scope="col" style="width: 3%">날짜</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="board">
    <tr>
      <th scope="row">${board.buno }</th>
      <td><a class ='listA' href="<c:out value='${board.buno }'/>"><c:out value="${board.title }"></c:out></a></td>
      <td>${board.writer }</td>
      <td>${board.regdate }</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
</div>
<%-- <h3>${pageMaker }</h3> --%>
<br>
<br>
<span class='input-group searchDiv' aria-controls="dataTable"> <select
	name='stype' class="form-control-select stype">
		<option value='tc' ${pageDTO.type == "tc"?"selected":"" }>제목+내용</option>
		<option value='t' ${pageDTO.type == "t"?"selected":"" }>제목만</option>
		<option value='c' ${pageDTO.type == "c"?"selected":"" }>내용</option>
		<option value='w' ${pageDTO.type == "w"?"selected":"" }>작성자</option>

</select> <span class="input-group-append"> <input type="text"
		class="searchInput" name='skeyword' placeholder="Search for..."
		value='${pageDTO.keyword }'> <span class="input-group-append">
			<button class="btn searchBtn btn-search" type="button">
				<i class="fas fa-search fa-sm"></i>
			</button>
	</span>
</span>
</span>
<br>
<br>
<ul class="pagination" >
	<c:if test="${pageMaker.prev}">
		<li class="page-item"><a class="page-link"
			href="${pageMaker.start - 1}" tabindex="-1">Previous</a></li>
	</c:if>
	<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
		<li class="page-item ${num == pageMaker.pageInfo.page ? "active" : ""}">
			<a class="page-link" href="${num }">${num}</a>
		</li>
	</c:forEach>
	<c:if test="${pageMaker.next}">
		<li class="page-item"><a class="page-link"
			href="${pageMaker.end + 1 }">Next</a></li>
	</c:if>
</ul>

<form class='actionForm' method="get">
	<input type="hidden" name="page" value="${pageDTO.page }"> 
	<input type="hidden" name="perSheet" value="${pageDTO.perSheet }">
	<input type="hidden" name="type" value="${pageDTO.type}">
	<input type="hidden" name="keyword" value="${pageDTO.keyword}">
</form>
<script>

const dqs = document.querySelector.bind(document);
const actionForm = document.querySelector(".actionForm")

/* ------------------------------페이지 이동 이벤트------------------------------ */
document.querySelector(".pagination").addEventListener("click",function(e) {
	e.preventDefault();
	
	const target = e.target;
	console.log(target);
	const pageNum = target.getAttribute("href");
	if(pageNum == null){
	return;
	}
	console.log(pageNum);
	
	document.querySelector(".actionForm input[name='page']").value=pageNum;
	document.querySelector(".actionForm").submit();
},false);

/* ------------------------------게시글 이동 이벤트------------------------------ */

document.querySelectorAll(".listA").forEach(a => {
	a.addEventListener("click",function(e) {
		e.preventDefault();
		const buno = e.target.getAttribute("href");
		
		actionForm.setAttribute("action","free/read");
		actionForm.innerHTML += "<input type='hidden' name='buno' value='"+buno+"'>";
		actionForm.submit();
	},false);
})

/* ------------------------------검색(클릭) 이벤트------------------------------ */

document.querySelector(".searchBtn").addEventListener("click",function(e){
	
	//검색타입과 키워드를 가져와야한다
	//console.log(actionForm.querySelector(".stype").selectedIndex);
	//console.log(actionForm.querySelector(".stype"));
	const stype = document.querySelector(".stype");
	const idx = stype.selectedIndex;
	const type = stype[idx].value;
	
	//alert(type);
	//검색시 페이지 1로 초기화
	actionForm.querySelector("input[name='page']").value = 1;
	actionForm.querySelector("input[name='type']").value = type;
	actionForm.querySelector("input[name='keyword']").value = 
		document.querySelector("input[name='skeyword']").value;
	
	actionForm.submit();
},false)
/* ------------------------------검색(엔터) 이벤트------------------------------ */
document.querySelector(".searchInput").addEventListener('keypress',function(e){
	if(e.key === 'Enter'){
		//검색타입과 키워드를 가져와야한다
	//console.log(actionForm.querySelector(".stype").selectedIndex);
	//console.log(actionForm.querySelector(".stype"));
	const stype = document.querySelector(".stype");
	const idx = stype.selectedIndex;
	const type = stype[idx].value;
	
	//alert(type);
	//검색시 페이지 1로 초기화
	actionForm.querySelector("input[name='page']").value = 1;
	actionForm.querySelector("input[name='type']").value = type;
	actionForm.querySelector("input[name='keyword']").value = 
		document.querySelector("input[name='skeyword']").value;
	
	actionForm.submit();
	}
},false)



/* ------------------------------글쓰기 이벤트------------------------------ */

dqs(".registerBtn").addEventListener("click",function(){
	
	self.location="/owner/community/free/register";
	
},false)


</script>
<%@include file="../includes/footer.jsp" %>

