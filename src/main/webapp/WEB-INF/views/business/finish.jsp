<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<!-- Page Heading -->
<script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.2.10/firebase-firestore.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.3.1/firebase-analytics.js"></script>
<script src="/owner/resources/js/firebaseConfig.js"></script>
<div class="container-fluid">
	<h1 class="mt-4"></h1>
	<div class="timeZone"></div>
	<div class="row">
		<div class="col-md-6 col-lg-4 col-xlg-3">
			<div class="card card-hover">
				<div class="box bg-cyan text-center">
				    <a class='big text-white stretched-link' href='/owner/business/order'></a>
					<h1 class="font-light text-white">
						<i class="mdi mdi-chart-areaspline"></i>
					</h1>
					<h6 class="text-white">주문 내역</h6>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-lg-4 col-xlg-3">
			<div class="card card-hover">
				<div class="box bg-cyan text-center">
					<a class='big text-white stretched-link' href='/owner/business/finish'></a>
					<h1 class="font-light text-white">
						<i class="mdi mdi-chart-areaspline"></i>
					</h1>
					<h6 class="text-white">조리 내역</h6>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-lg-4 col-xlg-3">
			<div class="card card-hover">
				<div class="box bg-cyan text-center">
					<h1 class="font-light text-white">
						<i class="mdi mdi-chart-areaspline"></i>
					</h1>
					<h6 class="text-white">결제 내역</h6>
				</div>
			</div>
		</div>
		<ol class="breadcrumb mb-4">
		</ol>
		<div class="container-fluid">
			<div class="row new-order"></div>
		</div>
	</div>
</div>
<script>

	const dqs = document.querySelector.bind(document);
	
	const newOrder = dqs(".new-order");
	const timeZone = dqs(".timeZone");
	
	console.log(newOrder)
	

	
	function init(){
	   // setInterval(getTime, 1000);
	}
	
	init();
		
	/*---------------------------실시간 데이터 조회----------------------------*/
	 
	
	//where("store","==","내가게이름")
	db.collection("Tests").where('store', '==', '김밥천국').where('orderState', '==', 'done').onSnapshot(snapshot => {
	    //console.log("-------------------------------------------------------------------------------")
	    //console.log("-------------------------------------------------------------------------------")
	    //console.log("-------------------------------------------------------------------------------")
	
	    //실시간 데이터 조회
	    snapshot.docChanges().forEach(change => {
	        //console.log(change.type);
	        if (change.type === 'added') {
	            //주문데이터
	            //console.log(change.doc.data());
	            //주문아이디
	            //console.log(change.doc.id)
				const docId = change.doc.id;
	            const jsonData = change.doc.data();
	            
	          	//시간 변환 처리
                const date = new Date((Number(jsonData.time.seconds)) * 1000)
                const year = date.getFullYear()
                const month = date.getMonth()
                const day = date.getDay()
                const hour = date.getHours()
                const min = date.getMinutes()
                const second = date.getSeconds()
                const time = year + "년 " + month + "월 " + day + "일 " + hour + "시 " + min + "분 " + second + "초";
	            
	            for (let i = 0, len = jsonData.order.length || 0; i < len; i++) {
	               // console.log(jsonData.order[i])
	            }
	
                //newOrder.innerHTML += jsonData.store;
                let str = "";

                str += "<div class='col-xl-3 col-md-6 "+docId+"'>"
                str += "	<div class='card card-hover' onclick=clickTest(\'"+docId+"\')>"
                str += "		<div class='card bg-danger text-white mb-4'>"
                str += "			<div class='card-order font-big'>"
                for (let i = 0, len = jsonData.order.length || 0; i < len; i++) {
                    //console.log(jsonData.order[i])
                    str += "			<div>" + jsonData.order[i].menu + " " + jsonData.order[i].quantity + "개</div>"
                }
                str += "				<div>주문번호: " + jsonData.orderNum + "</div>"
                str += "				<div>" + time + "</div>"
                str += "			</div>"
                str += "			<div class='card-footer d-flex align-items-center justify-content-between'>"
                str += "				<a class='big text-white stretched-link' href='#'>클릭 시 조리완료 취소</a>"
                str += "				<div class='big text-white'>"
                str += "					<i class='fas fa-angle-right'></i>"
                str += "				</div>"
                str += "			</div>"
                str += "		</div>"
                str += "	</div>"
                str += "</div>"

                newOrder.insertAdjacentHTML('afterbegin',str);

            }//endif
        })//end for
    })

    /*--------------------------------조리완료---------------------------------*/
    function clickTest(id){
        console.log("aaa"+id);
        //alert("aa")
        
        //주문 완료로 변경
        db.collection("Tests").doc(id).update({
            orderState: 'new'
        })
            .then(docRef => {
                console.log("Document written with ID: ", docRef);

            })
            .catch((error) => {
                console.error("Error adding document: ", error);
            });
        
 		dqs('.'+id).remove();
    }
	
</script>

<%@include file="../includes/footer.jsp"%>