<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">MODIFY PAGE</h1>

<button class="modBtn btn btn-success" type="button">수정완료</button>
<button class='listBtn btn btn-primary' type="button">목록</button>
<button class='removeBtn btn btn-danger' type="button">삭제</button>


<!-- editor -->
<div class="row">
	<div class="col-12">
		<div class="card">
			<h4 class="card-title">
				<input type="hidden" name="bano" value="${board.bano }"
					readonly="readonly"> <input type="text"
					class="form-control" name="title" value='${board.title}'> <input
					type="hidden" class="form-control" name="writer" value="user00"
					readonly="readonly"> <input type="hidden"
					class="form-control" name="category" value="1" readonly="readonly">
			</h4>
			<!-- Create the editor container -->
			<div id="editor" style="height: 650px;">${board.content }</div>
		</div>
	</div>
</div>

<div class="fileAttach">
	<div class="custom-file">
		<input type="file" class="form-control form-control-lg"
			id="formFileLg" name='uploadFile' onchange="preview()"
			multiple='multiple' required> <label class="form-label"
			for="formFileLg"></label>

	</div>
</div>
<ul class="uploadResult">

</ul>

<div class="modal" id="modModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">NOTICE</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>수정 완료되었습니다.</p>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-primary" onclick="movePage()">Save changes</button> -->
				<button type="button" class="btn btn-secondary" onclick="movePage()"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="removeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">NOTICE</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="modalRemoveBtn btn btn-primary">Remove</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="removeCheckModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>삭제됐어여</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" onclick="moveList()"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<form class='actionForm' action="/board/list" method="get">
	<input type="hidden" name="page" value="${pageDTO.page }"> <input
		type="hidden" name="perSheet" value="${pageDTO.perSheet }"> <input
		type="hidden" name="type" value="${pageDTO.type}"> <input
		type="hidden" name="keyword" value="${pageDTO.keyword}"> <input
		type="hidden" name="bano" value="${board.bano }">

</form>

<script>

const dqs = document.querySelector.bind(document);
const actionForm = dqs(".actionForm");
const card = dqs(".card-title");
console.log(card)
//const banoval = table.querySelector("input[name=bano]").value
//const titleval = table.querySelector("input[name=title]").value
//const contentval = table.querySelector("input[name=content]").value

/* ------------------------------게시글로이동------------------------------ */
function movePage(){
	//alert("aaaa");
	actionForm.setAttribute("action","/owner/news/read")
	actionForm.submit();
}
/* ------------------------------목록이동------------------------------ */
function moveList(){
	actionForm.setAttribute("action","/owner/news/notice")
	actionForm.submit();
}
/* ------------------------------수정Ajax------------------------------ */
 function sendAjax(data){
	console.log("sendAjax...",data)

	
	return fetch("/owner/news/modify",
		{method:"post",
		headers:{'X-CSRF-Token' : '${_csrf.token}','Content-Type' : 'application/json'},
		body:JSON.stringify(data)}).then(res => {return res.text()})
		.then(result => {console.log("Result:"+result)
			$("#modModal").modal("show")	
			});

	
} 
//console.log(sendAjax(data))

/* ------------------------------수정 완료 이벤트------------------------------ */

dqs(".modBtn").addEventListener("click",function(e){
	e.preventDefault();
	
	const banoval = card.querySelector("input[name=bano]").value
	const titleval = card.querySelector("input[name=title]").value
	//console.log(titleval)
	const writerval = card.querySelector("input[name=writer]").value
	const categoryval = card.querySelector("input[name=category]").value
	const text = quill.root.innerHTML;
	const data = {bano:banoval,title:titleval,content:text,writer:writerval,category:categoryval};
	
	sendAjax(data)
	
},false)

/* ------------------------------목록 이동 이벤트------------------------------ */

dqs(".listBtn").addEventListener("click",function(){
	//alert("aaa");
	actionForm.setAttribute("action","/owner/news/notice")
	actionForm.submit()
},false)


/* ------------------------------삭제 Ajax------------------------------ */

	function sendRemoveAjax(){
	console.log('remove');
	$('#removeModal').modal('hide');
	return fetch("/owner/news/remove",
			{
			method:'post',
		    headers:{'X-CSRF-Token' : '${_csrf.token}','Content-Type':'application/x-www-form-urlencoded'},
		    body:"bano=" + $("input[name='bano']").val()
		}).then(res =>  { 
			res
			$('#removeCheckModal').modal('show');
		})
	
}
/* ---------------------------삭제(모달) 이벤트--------------------------- */

dqs(".removeBtn").addEventListener("click",function(){
	console.log($("input[name='bano']").val())
	sendRemoveAjax()
},false);
/* ---------------------------------------------------------------------------------- */
/* -----------------------------------수정완료(파일업로드)-------------------------------- */
/* ---------------------------------------------------------------------------------- */
document.querySelector(".modBtn").addEventListener("click", function(e){
	
	const banoval = card.querySelector("input[name=bano]").value
	const titleval = card.querySelector("input[name=title]").value
	//console.log(titleval)
	const writerval = card.querySelector("input[name=writer]").value
	const categoryval = card.querySelector("input[name=category]").value
	const text = quill.root.innerHTML;
	const data = {bano:banoval,title:titleval,content:text,writer:writerval,category:categoryval,fileList: arr};
	
	sendAjax(data)
	
	console.log("-------------------------")

	console.log(data);

	console.log(text);
	
	//sendAjax(data);

}, false); 

const uploadUL = dqs(".uploadResult");

const arr = [];

const uploadFile = dqs("input[name='uploadFile']");

const outerHTML = uploadFile.outerHTML;


function preview(){
	
	
	//alert('aaa');
	const formData = new FormData();
	const input = dqs("input[name=uploadFile]");

	//jquery라면 input[0].files; 가 된다.
	const files = input.files;
	
	//log를찍으면 element만 나오고 안에 올라간파일을 알 수 없다.
	console.dir(input);
	
	for (var i = 0; i < files.length; i++) {
		//controller에 있는 파라미터명과 맞춰주어야한다.
		formData.append("files",files[i]);
	}
	
	fetch("http://localhost:8080/owner/upload", {
		method:"post",
		headers:{'X-CSRF-Token' : '${_csrf.token}','Content-Type':'application/json'},
		body:formData
	}).then(res => res.json())
	.then(jsonObj => {
		console.log(jsonObj);
		
		let htmlCode = "";
		for (let i = 0; i < jsonObj.length; i++) {
			
			//변수를 선언해주는것이 좋다.
			let fileObj = jsonObj[i];
			arr.push(fileObj)
			//돔은 한번만 만들어서 한번에 append해주는게 성능상 좋다.
			//remove(remove(JSON.stringify))를 해줘야지만 동작한다.
			htmlCode +="<li id='li_"+fileObj.uuid+"'><span class='li-attach'>"+fileObj.fileName+"</span><button class='btn btn-outline-danger' onclick='removeFile("+JSON.stringify(fileObj)+")'>X</button></li>";
			quill.root.innerHTML += "<img src='/owner/view?file="+fileObj.link+"'>";
			
		}
		
		
		uploadUL.innerHTML += htmlCode;
	
		document.querySelector("input[name=uploadFile]").remove();
		
		
		
		document.querySelector(".custom-file").insertAdjacentHTML('afterbegin',outerHTML);
	})
}



/* -----------------------------li 삭제 함수------------------------------ */


function removeFile(param){
	console.log(param);
	//alert("remove file");
	
	fetch("/owner/removeFile",
			{
			method: 'delete',
			headers: {'X-CSRF-Token' : '${_csrf.token}','Content-Type':'application/json'},
			body: JSON.stringify(param)
			})
	
	document.querySelector("#li_"+param.uuid).remove();
}


</script>
<%@include file="../includes/footer.jsp"%>
