<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../../includes/header.jsp"%>

<!-- Page Heading -->


<div style="height: 10px"></div>
<div class="col-md-6"  style="float:left;">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">메뉴 기본 정보</h5>
			<table class="table table-bordered">
			<input type="hidden" class="form-controlInfo" name="sno" value="1">
				<tr>
					<th>이름</th>
					<td><input type="text" class="form-controlInfo" name="name"
						value=""></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="number" class="form-controlInfo" name="price"
						value=""></td>
				</tr>
				<tr>
					<th>메뉴 설명</th>
					<td><textarea rows="5" class="form-control"
							name="explanation"></textarea></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<div class="col-md-9">
							<select class="select2 form-select shadow-none mt-3"
								multiple="multiple" style="height: 36px; width: 100%;">
								<optgroup label="카테고리">
									<option value="1">한식</option>
									<option value="2">중식</option>
									<option value="3">일식</option>
									<option value="4">양식</option>
									<option value="5">아시안</option>
									<option value="6">해산물</option>
									<option value="7">치킨</option>
									<option value="8">피자</option>
									<option value="9">버거</option>
									<option value="10">도시락</option>
									<option value="11">샐러드</option>
									<option value="12">샌드위치</option>
									<option value="13">멕시칸</option>
									<option value="14">채식</option>
									<option value="15">커피&차</option>
									<option value="16">디저트</option>
									<option value="17">베이커리</option>
									<option value="18">간식</option>
									<option value="19">죽</option>
								</optgroup>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>사진 첨부</th>
					<td>
						<div class="col-md-9">
							<div class="fileAttach">
								<div class="custom-file">
									<input type="file" class="form-control form-control-lg"
										id="formFileLg" name='uploadFile' onchange="preview()"
										multiple='multiple' required> <label
										class="form-label" for="formFileLg"></label>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="border-top">
			<div class="card-body">
				<button type="button" class="registerBtn btn btn-primary">등록하기</button>
			</div>
		</div>
	</div>
</div>
<div class="picture" style="float: left;
    background-color: white;
    width: 500px;
    height: 500px;
    margin-top: 140px;
    margin-left: 50px;">
</div>

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


<%@include file="../../includes/footer.jsp"%>

<script>


const dqs = document.querySelector.bind(document);
const table = dqs(".table");
const picture = dqs(".picture");

const snoValue = table.querySelector("input[name=sno]").value;
console.log(snoValue)

/* ------------------------------게시글로이동------------------------------ */
function movePage(){
	//alert("aaaa");
	self.location="/owner/myshop/1/menu";
}
/* ------------------------------수정Ajax------------------------------ */
function sendAjax(data){
	console.log("sendAjax...",data)

	
	return fetch("/owner/myshop/menu/register",
		{method:"post",
		headers:{'Content-Type' : 'application/json'},
		body:JSON.stringify(data)}).then(res => {return res.text()})
		.then(result => {console.log("Result:"+result)
			$("#registerModal").modal("show")	
			});

	
}
//console.log(sendAjax(data))

/* ---------------------------------------------------------------------------------- */
/* -----------------------------------수정완료(파일업로드)-------------------------------- */
/* ---------------------------------------------------------------------------------- */
document.querySelector(".registerBtn").addEventListener("click", function(e){
	
	e.preventDefault();
	const nameValue = table.querySelector("input[name=name]").value;
	const priceValue = table.querySelector("input[name=price]").value;
	const explanationValue = table.querySelector("textarea[name=explanation]").value
	//const categoryValue = table.querySelector(".select2")
	//const categoryVal = categoryValue.options[categoryValue.selectedIndex].value;
	
	const data = {sno:snoValue,name:nameValue,price:priceValue,explanation:explanationValue,fileList:arr};
	
	sendAjax(data)
	
	//console.log(categoryVal);
	
	console.log("-------------------------")

	console.log(data);

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
		
		for (let i = 0; i < jsonObj.length; i++) {
			
			//변수를 선언해주는것이 좋다.
			let fileObj = jsonObj[i];
			arr.push(fileObj)
			//돔은 한번만 만들어서 한번에 append해주는게 성능상 좋다.
			//remove(remove(JSON.stringify))를 해줘야지만 동작한다.
			picture.innerHTML += "<img src='/owner/view?file="+fileObj.link+"' style='width:500px;'>";
		}
		
	})
}

</script>
