<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../../includes/header.jsp"%>

<!-- Page Heading -->

<button class="modBtn btn btn-success" type="button">수정완료</button>
<div style="height:10px"></div>

<!-- editor -->
<div class="row">
	<div class="col-12">
		<div class="card">
			<h4 class="card-title">
				<input type="hidden" name="sno" value="${intro.sno }">
			</h4>
			<!-- Create the editor container -->
			<div id="editor" style="height: 700px;">${intro.info}</div>
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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>수정 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="movePage()" data-dismiss="modal" >Close</button>
      </div>
    </div>
  </div>
</div>


<%@include file="../../includes/footer.jsp"%>

<script>

const dqs = document.querySelector.bind(document);
const card = dqs(".card-title");
//const snoval = card.querySelector("input[name=sno]").value;
//console.log(snoval);
/* ------------------------------게시글로이동------------------------------ */
function movePage(){
	//alert("aaaa");
	self.location="/owner/myshop/user00/intro";
}
/* ------------------------------수정Ajax------------------------------ */
function sendAjax(data){
	console.log("sendAjax...",data)

	
	return fetch("/owner/myshop/intro/modify",
		{method:"post",
		headers:{'X-CSRF-Token' : '${_csrf.token}','Content-Type' : 'application/json'},
		body:JSON.stringify(data)}).then(res => {return res.text()})
		.then(result => {console.log("Result:"+result)
			$("#modModal").modal("show")	
			});

	
}
//console.log(sendAjax(data))

/* ---------------------------------------------------------------------------------- */
/* -----------------------------------수정완료(파일업로드)-------------------------------- */
/* ---------------------------------------------------------------------------------- */
document.querySelector(".modBtn").addEventListener("click", function(e){
	
	e.preventDefault();
	
	const snoval = card.querySelector("input[name=sno]").value;
	//console.log(snoval);
	const text = quill.root.innerHTML;
	const data = {sno:snoval,info:text,fileList:arr};
	
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
		headers:{'X-CSRF-Token' : '${_csrf.token}'},
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