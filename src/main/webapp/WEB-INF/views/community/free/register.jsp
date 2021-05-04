<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../../includes/header.jsp" %>

<!-- Page Heading -->

<h1 class="h3 mb-4 text-gray-800">REGISTE PAGE</h1>

<button class="registerBtn btn btn-primary" type="button">완료</button>
<!-- editor -->
<div class="row">
	<div class="col-12">
		<div class="card">
			<h4 class="card-title">
				<input type="text" class="form-control" name="title"
					placeholder="제목을 입력해 주세요.">
				<input type="hidden" class="form-control" name="writer" value="<sec:authentication property="principal.username"/>" readonly="readonly">
				<input type="hidden" class="form-control" name="category" value="free" readonly="readonly">
			</h4>
			<!-- Create the editor container -->
			<div id="editor" style="height: 650px;"></div>
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

<div class="modal" id="registerModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">NOTICE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>등록이 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-primary" onclick="movePage()">Save changes</button> -->
        <button type="button" class="btn btn-secondary" onclick="movePage()" data-dismiss="modal" >Close</button>
      </div>
    </div>
  </div>
</div>

<%@include file="../../includes/footer.jsp" %>


<script>

const dqs = document.querySelector.bind(document);
const card = dqs('.card-title');
console.log(card)
const contentValue = dqs('#editor').value;

//console.log('aaaa'+table.querySelector('textarea[name=content]').innerText);
/* ------------------------------등록Ajax------------------------------ */
function sendAjax(data){
	console.log("sendAjax..",data)
	
	return fetch("/owner/community/free/register",
		{method:"post",
		headers:{'X-CSRF-Token' : '${_csrf.token}','Content-Type':'application/json'},
		body: JSON.stringify(data)})
		/* 지금 상태는 Promise로 되어있는 상태다. */
	.then(res => {
		if(!res.ok){
			throw new Error(res)
		}
		return res.text();
		})
	.catch(error =>{
		console.log("catch...........")
		console.log(error)
		return error;
	}).then(result => {
		console.log("RESULT : "+ result);
		$("#registerModal").modal('show')
	})
}


/* ------------------------------모달이동------------------------------ */
/* 모달 yes누르면 list로 이동 */
function movePage(){
//	alert("movePage")
	self.location="/owner/community/free"
}

/* ---------------------------------------------------------------------------------- */
/* --------------------------------------파일 업로드------------------------------------ */
/* ---------------------------------------------------------------------------------- */
document.querySelector(".registerBtn").addEventListener("click", function(e){
	const titleval = card.querySelector("input[name=title]").value
	const writerval = card.querySelector("input[name=writer]").value
	const categoryval = card.querySelector("input[name=category]").value
	const text = quill.root.innerHTML;
	
	console.log("-------------------------")

	const data = {title:titleval,content:text,writer:writerval,category:categoryval,fileList: arr};
	
	console.log(data);

	console.log(text);
	
  fetch("/owner/community/free/register",
		  {
	  		method: 'post',
	  		headers: {'X-CSRF-Token' :'${_csrf.token}','Content-type': 'application/json; charset=UTF-8'},
	  		body: JSON.stringify(data)
		  })
	$("#registerModal").modal('show')
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
		headers:{'X-CSRF-Token' : '${_csrf.token}'},
		body:formData
	}).then(res => res.json())
	.then(jsonObj => {
		console.log(jsonObj);
		
		let htmlCode = "";
		for (let i = 0; i < jsonObj.length; i++) {
			
			let fileObj = jsonObj[i];
			arr.push(fileObj)
			htmlCode +="<li id='li_"+fileObj.uuid+"'><span class='li-attach'>"+fileObj.fileName+"</span><button class='btn btn-outline-danger' onclick='removeFile("+JSON.stringify(fileObj)+")'>X</button></li>";
			quill.root.innerHTML += "<img src='/owner/view?file="+fileObj.link+"'>";
			
		}
		
		
		//+= 가 아닌 =면 기존의것이 초기화된상태로 추가된다.
		uploadUL.innerHTML += htmlCode;
		//document.querySelector("#editor")innerHTML += "<img src='/view?file="+fileObj.link+"'>"
		//cloneUploadFile 삭제 
		//uploadFile.remove();
		
		//console.log(cloneUploadFile);
		
		document.querySelector("input[name=uploadFile]").remove();
		
		
		
		document.querySelector(".custom-file").insertAdjacentHTML('afterbegin',outerHTML);
		console.dir(document.querySelector("input[name=uploadFile]"));
		//input = cloneUploadFile;
		//console.log(input.value);
		
		//input.value="";
		//console.log(input.value);
		//console.dir(input.innerHTML );
	})
}



/* -----------------------------li 삭제 함수------------------------------ */


function removeFile(param){
	console.log(param);
	
	fetch("/owner/removeFile",
			{
			method: 'delete',
			headers: {'X-CSRF-Token' : '${_csrf.token}','Content-Type':'application/json'},
			body: JSON.stringify(param)
			})
	
	document.querySelector("#li_"+param.uuid).remove();
}

/* ------------------------------업로드 이벤트----------------------------- */
/*  document.querySelector(".registerBtn").addEventListener("click",function(e){
	
	const formData = new FormData();
	const input = document.querySelector("input[name=uploadFile]");
	
	fetch("http://192.168.0.101:8080/owner/free/register", {
		method:"post",
		body:formData
	}).then(res => res.json())
	.then(jsonObj => {
		console.log(jsonObj);
	})
	
	
},false);  */




</script>

