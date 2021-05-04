<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../../includes/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d183e7ead3f34d35c44545aaa0da8909&libraries=services"></script>


<!-- Page Heading -->

<div style="height:70px"></div>


<button class="modBtn btn btn-primary" type="button">수정완료</button>

<div style="height:10px"></div>

<table class="table table-bordered">
	<input type="hidden" name="sno" value="${info.sno }">
	<tr>
		<th>이름</th>
		<td><input type="text" class="form-controlInfo" name="sname"
			value="${info.sname}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" class="form-controlInfo" name="tel"
			value="${info.tel}"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" class="form-controlInfo address"
			style="cursor:pointer;" name="address"
			value='${info.address}' readonly="readonly"></td>
	</tr>
	<tr>
		<th>영업시간</th>
		<td><textarea rows="5" class="form-controlInfo" name="businessHour">${info.businessHour}</textarea></td>
	</tr>
	<tr>
		<th>휴무일</th>
		<td><textarea rows="5" class="form-controlInfo" name="holiday">${info.holiday}</textarea></td>
	</tr>
	<tr>
		<th>위도</th>
		<td><input type="text" class="form-controlInfo" name="lat"
			value='${info.lat}'></td>
	</tr>
	<tr>
		<th>경도</th>
		<td><input type="text" class="form-controlInfo" name="lng"
			value='${info.lng}'></td>
	</tr>
</table>

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
<div style="height:280px"></div>
<%@include file="../../includes/footer.jsp"%>

<script>

const dqs = document.querySelector.bind(document);
const table = dqs(".table");


/* ------------------------------게시글로이동------------------------------ */
function movePage(){
	//alert("aaaa");
	self.location="/owner/myshop/user00/info";
}
/* ------------------------------수정Ajax------------------------------ */
function sendAjax(data){
	console.log("sendAjax...",data)

	
	return fetch("/owner/myshop/info/modify",
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
	
	const snoValue = table.querySelector("input[name=sno]").value;
	const snameValue = table.querySelector("input[name=sname]").value;
	const telValue = table.querySelector("input[name=tel]").value
	const addressValue = table.querySelector("input[name=address]").value
	const businessHourValue = table.querySelector("textarea[name=businessHour]").value
	const holidayValue = table.querySelector("textarea[name=holiday]").value
	const latValue = table.querySelector("input[name=lat]").value
	const lngValue = table.querySelector("input[name=lng]").value
	
	const data = {sno:snoValue,sname:snameValue,tel:telValue,address:addressValue,businessHour:businessHourValue,holiday:holidayValue,lat:latValue,lng:lngValue};
	
	sendAjax(data)
	
},false)

/* ------------------------------주소 이벤트------------------------------ */

dqs(".address").addEventListener("click",function(e){
	e.preventDefault();
	
	const address = table.querySelector("input[name=address]")
	const lat = table.querySelector("input[name=lat]")
	const lng = table.querySelector("input[name=lng]")
	//console.log("aaa");
	
	new daum.Postcode({
   		oncomplete: function(data) {
 
        	
   			const addressval = data.address
        	
   			console.log(addressval)
   			
   			address.value = addressval;

    		//주소를 좌표로 변경하는 코드
            Promise.resolve(data).then(o => {
                const { address } = data;

                return new Promise((resolve, reject) => {
                    const geocoder = new daum.maps.services.Geocoder();

                    geocoder.addressSearch(address, (result, status) =>{
                        if(status === daum.maps.services.Status.OK){
                            const { x, y } = result[0];

                            resolve({ lat: y, lon: x })
                        }else{
                            reject();
                        }
                    });
                })
            }).then(result => {
                console.log(result.lat)
                lat.value = result.lat;
                console.log(result.lon)
                lng.value = result.lon;
            });
        },
        width: "100%",
        height: window.innerHeight

	}).open(); 
},false)
</script>