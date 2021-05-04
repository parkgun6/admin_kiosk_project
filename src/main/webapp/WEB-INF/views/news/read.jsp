<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">VIEW PAGE</h1>
<%-- 
<h2>${board }</h2>
<h3>${pageDTO }</h3> --%>

<button class="listBtn btn btn-primary" type="button">목록</button>
<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="isAuthenticated()">
<c:if test="${pinfo.username eq board.writer }">
<button class='modBtn btn btn-warning' type="button">수정/삭제</button>
</c:if>
</sec:authorize>

<br>
<div class="card-header">
	<h3>${board.title }</h3>
</div>
<div class="d-flex flex-row comment-row mt-0 user-info">
	<div class="p-2">
		<img src="/owner/resources/assets/images/users/1.jpg" alt="user" width="50"
			class="rounded-circle">
	</div>
	<div class="comment-text w-100">
		<h5 class="font-large">${board.writer}</h5>
		<span class="mb-3 d-block"></span>
		<div class="comment-footer">
			<span class="text-muted">${board.regdate}</span>
		</div>
	</div>
</div>
<div class="col-12">
	<div class="card">
		<div class="card-body content-body">
		<input type="hidden" class="form-control" name="bano" value="${board.bano }" readonly="readonly">
		<input type="hidden" class="form-control" name="mid" value="${board.writer}" readonly="readonly">
			<h5 class="card-title"></h5>
			${board.content }
		</div>
	</div>
</div>
<div class="listPage">
<table class="table">
  <thead class="thead-dark">
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
      <th scope="row">${board.bano }</th>
      <td><a class ='listA' href="<c:out value='${board.bano }'/>"><c:out value="${board.title }"></c:out></a></td>
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
<button class="registerBtn btn btn-primary" type="button">글쓰기</button>
<span class='input-group searchDiv' aria-controls="dataTable"> <select
	name='stype' class="form-control-select stype">
		<option value='tc' ${pageDTO.type == "tc"?"selected":"" }>제목+내용</option>
		<option value='t' ${pageDTO.type == "t"?"selected":"" }>제목만</option>
		<option value='c' ${pageDTO.type == "c"?"selected":"" }>내용</option>
		<option value='w' ${pageDTO.type == "w"?"selected":"" }>작성자</option>

</select>
 <span class="input-group-append"> <input type="text"
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



<%@include file="../includes/footer.jsp" %>

<script>

const dqs = document.querySelector.bind(document);
//const obj = dqs(".listBtn")
const actionForm = document.querySelector(".actionForm");
//console.log(obj)


//console.log(dqs(".table").querySelector("textarea[name=content]").value)
const bano = dqs(".card-body").querySelector("input[name='bano']").value
console.log(bano)

console.log(dqs(".card-body").querySelector("input[name='bano']").value)
console.log(actionForm.querySelector("input[name='bano']"))


/* ------------------------------목록 이동 이벤트------------------------------ */


dqs(".listBtn").addEventListener("click",function(e){

actionForm.setAttribute("action","/owner/news/notice")
actionForm.submit();

},false)


/* ------------------------------수정/삭제 이동 이벤트------------------------------ */

if(dqs(".modBtn") != null){
dqs(".modBtn").addEventListener("click",function(e){
	actionForm.innerHTML+="<input type='hidden' name='bano' value='${board.bano}'>"
	actionForm.setAttribute("action","/owner/news/modify")
	actionForm.submit();
	
	
},false)
}



/* ------------------------------페이지 이동 이벤트------------------------------ */

document.querySelector(".pagination").addEventListener("click",e=>{
	e.preventDefault();
	const target = e.target;
	console.log(target);
	const pageNum = target.getAttribute("href");
	if(pageNum == null){
	return;
	}
	console.log(pageNum);
	
	document.querySelector(".actionForm input[name='page']").value=pageNum;
	actionForm.innerHTML += "<input type='hidden' name='bano' value='"+bano+"'>";
	actionForm.submit();
	
},false);

/* ------------------------------게시글 이동 이벤트------------------------------ */

document.querySelectorAll(".listA").forEach(a => {
	a.addEventListener("click",function(e) {
		e.preventDefault();
		const bano = e.target.getAttribute("href");
		;
		actionForm.setAttribute("action","read");
		//console.log(bano)
		
		actionForm.innerHTML += "<input type='hidden' name='bano' value='"+bano+"'>";
		console.log(actionForm.querySelector("input[name=bano]"))
		actionForm.submit();
	},false);
})
/* ------------------------------검색(엔터) 이벤트------------------------------ */
document.querySelector(".searchInput").addEventListener('keypress',function(e){
	if(e.key === 'Enter'){
		//검색타입과 키워드를 가져와야한다
	
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


/* ------------------------------검색 이벤트------------------------------ */

document.querySelector(".searchBtn").addEventListener("click",function(e){
	
	//검색타입과 키워드를 가져와야한다
	//console.log(actionForm.querySelector(".stype").selectedIndex);
	const stype = document.querySelector(".stype");
	const idx = stype.selectedIndex;
	const type = stype[idx].value;
	
	//alert(type);
	//검색시 페이지 1로 초기화
	actionForm.querySelector("input[name='page']").value = 1;
	actionForm.querySelector("input[name='type']").value = type;
	actionForm.querySelector("input[name='keyword']").value = 
		document.querySelector("input[name='skeyword']").value;
	actionForm.setAttribute("action","notice");
	actionForm.submit();
},false)

/* ------------------------------글쓰기 이벤트------------------------------ */

dqs(".registerBtn").addEventListener("click",function(){
	
	self.location="/owner/news/register";
	
},false)

/* ------------------------------------------------------------ */
/* ---------------------------댓글 처리-------------------------- */
/* ------------------------------------------------------------ */


    const replyService = (function () {
	
    
        function getList(data) {
        
        const page = actionForm.querySelector("input[name='page']").value;
        
            return fetch("http://192.168.0.101:8080/replys/read/" + bano + "/" + page,
                {
                    method: 'get'
                }
            ).then(res => res.json())
        }
        
        return {getList:getList}
    })();
    

    document.addEventListener('DOMContentLoaded', function () {

        const banoValue = actionForm.querySelector("input[name='bano']").value;
        const pageValue = actionForm.querySelector("input[name='page']").value;
        
        console.log(banoValue);
        console.log(pageValue);
        
        var replyUL = document.querySelector(".chat");
        
		//console.log(replyService.getList(banoValue,pageValue).then(res=>res);
		
		console.log(replyService.getList({bano: banoValue, page: pageValue || 1}));
		console.log(replyService.getList({bano: banoValue, page: pageValue || 1}).then(list => console.log(list)));
		
        function showList(pageValue) {
            replyService.getList({bano: banoValue, page: pageValue || 1}).then(list => {
                var str = "";
                if (list == null || list.length == 0) {
                    replyUL.html("");
                    return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class = 'left clearfix' data-rno='" + list[i].rno + "'>";
					str += "<div><div class='header'>";
					str += "<strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "<small class='pull-right text-muted'>" + list[i].replyDate + "</small>";
					str += "</div><p>"+list[i].reply+"</p></div></li>";
                }
                replyUL.innerHTML=str;
            });
        }
        
console.log(showList(pageValue));
    });

</script>