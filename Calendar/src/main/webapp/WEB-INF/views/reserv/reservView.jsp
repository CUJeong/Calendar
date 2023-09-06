<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상담 신청</title>
        
        <style type="text/css">
			@import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');
	
	      	body {
		        margin: 0;
		    }
		    	
			.calendar-container{
				width: 100%;
			}
			
	        .calendar {
				width: 70%;
				margin: auto;
	            background-color : white;
	            user-select: none;
	            border: 1px solid black;
	            transition-duration: 0.2s;  /* 이게 걸려있으면 JS로 UI 변경 시 애니메이션처럼 변한다. */
	        }
	        
	        /* 최 상단 버튼과 년월 표기 */
	        .calendar-header{
	        	display: flex;
	        	justify-content: space-between;
	        	align-items: center;
	        	text-align: center;
	        	padding-top: 20px;
	        	padding-bottom: 20px;
	        	
	        	font-family: 'Questrial', sans-serif;
	            font-size: 1.3em;
	            font-weight: bold;
	        }
	        
	        .calendar-header > div{
	        	display: flex;
	        	justify-content: center;
	        	align-items: center;
	        }
	        
	        .calendar-header > div:nth-child(1),
	        .calendar-header > div:nth-child(3){
	        	width: calc(100%/7);
	        	cursor: pointer;
	        }
	        
	        .calendar-header > div:nth-child(2){
	        	width: calc(100%*5/7);
	        }
	        
	        /* 일 ~ 토 요일 표기 부분 */
	        .calendar-week{
	        	display: flex;
	        	align-items: center;
	        	border-top: 1px solid rgb(245, 208, 66);
	        	border-bottom: 1px solid rgb(245, 208, 66);
	        }
	        
	        .calendar-week > div{
	        	padding-top: 10px;
	        	padding-bottom: 10px;
	        	background-color: rgba(245, 208, 66, 0.2);
	        	font-family: 'Questrial', sans-serif;
	            font-weight: 600;
	            font-size: 1.1em;
	            display: flex;
	            justify-content: center;
	        	align-items: center;
	        	width: calc(100%/7 - 0.9px);
	        	border-right: 1px solid rgb(245, 208, 66);
	        }
	        
	        .calendar-info{
	        	padding-top: 10px;
				padding-bottom: 10px;
	        }
	        
	        .calendar-info > div{
	        	display: flex;
	        	justify-content: end;
	        	align-items: center;
	        }
	        
	        .calendar-info .common-btn{
	        	background-color: #F5D042;
				
				margin-right: 20px;
				color: white;
				font-size: 1.1em;
				font-weight: bold;
				
				border-radius: 15px;
				padding-top: 10px;
				padding-bottom: 10px;
				padding-left: 13px;
				padding-right: 13px;
				
				text-align: center;
				cursor: pointer;
	        }
	        
	
			/* 날짜 표기 부분 */
			.calendar-date {
			}
			
	        .calendar-date > div {
	            display: flex;
	            justify-content: space-between;
	        }
	        
	        .calendar-date > div > .each-date{
				border-right: 1px solid #eee;
				border-bottom: 1px solid #ccc;
	        }    
	        
	        .calendar-date > div > .each-date > .date-header{
	            font-family: 'Montserrat', sans-serif;
	            font-size: 1.1em;
	            
	            height: 20%;
	            display: flex;
	            justify-content: start;
	        	align-items: center;
	        	padding-left: 10px;
	        	padding-top: 10px;
	        }
	        
	        .calendar-date > div > .each-date > .date-reserv{
	            height: 80%;
	            
	            display: flex;
	            justify-content: center;
	        	align-items: center;
	        	
	        	font-size: 1em;
	        }    
	        
	        .date-reserv > .btn-reserv{
	        	background-color: rgb(13, 110, 253);
	        	border-radius: 12px;
	        	padding-top: 5px;
	        	padding-bottom: 5px;
	        	padding-left: 10px;
	        	padding-right: 10px;
	        	position: relative;
	        	color: white;
	        	transform: translate(0, -20%);
	        }
	        
	        
	        .date-reserv > .btn-reserv > span {
	        	position: absolute;
	        	top: 0;
	        	right: 0;
	        	color: white;
	        	border-radius: 13px;
	        	width: 25px;
	        	height: 23px;
	        	padding-bottom: 2px;
	        	display: flex;
	            justify-content: center;
	        	align-items: center;
	        	background-color: rgb(220, 53, 69);
	        	transform: translate(50%, -50%);
	        }
	        
	
	        .pastDay {
	        	background-color: #f5f5f5;
	            color: lightgray;
	        }
	
	        .today {
	            background-color: #F5D042;            
	            color: #fff;
	            font-weight: 600;
	            cursor: pointer;
	        }
	
	        .futureDay {
	            background-color: #FFFFFF;
	            cursor: pointer;
	        }
	        .futureDay:hover{
	            background:#eee;
	        }
	
	        .futureDay.choiceDay,
	        .today.choiceDay {
	            background: #0A174E;
	            color: #fff;
	            font-weight: 600;
	            cursor: pointer;
	        }
	        
	        .holiday{
	        	color: rgb(252,76,78);
	        }
	        
			.display-none{
				display: none;
			}
			
	        .common-modal{
	            position: fixed;
	            left: 50%;
	            top: 50%;
	            transform: translate(-50%, -50%);
	            width: 400px;
	            height: 300px;
	            background-color: white;
	            border-radius: 20px;
	            box-shadow: 1px 1px 6px 1px #0004;
	        }
	        
	        .common-modal > div:nth-child(1){
	        	height: 70%;
	        	display: flex;
	        	flex-direction: column;
	        	justify-content: center;
	        	align-items: center;
	        	font-size: 1.2em;
	        	font-weight: 600;
	        	padding-left: 40px;
	        	padding-right: 40px;
	        }
	        
	        .common-modal > div:nth-child(2){
	        	height: 30%;
	        	display: flex;
	        	justify-content: center;
	        	align-items: center;
	        }
	        
	        .common-modal > div:nth-child(1) > p{
	        	margin-top: 20px;
	        	margin-bottom: 5px;
	        }
	        
	        .common-modal .common-btn{
	        	background-color: #0A174E;
				width: 30%;
				height: 30%;
				
				margin-left: 20px;
				color: white;
				font-size: 1.3em;
				margin-top: 15px;
				
				border-radius: 17px;
				padding-top: 10px;
				padding-bottom: 10px;
				
				text-align: center;
				cursor: pointer;
	        }
	
	        .common-modal .common-btn:nth-child(2){
	        	background-color: rgb(211,211,211);
				color: #333;
	        }	
	
	        .black-wall{
	            position: fixed;
	            left: 0;
	            bottom: 0;
	            width: 100vw;
	            height: 100vh;
	            background-color: rgba(0,0,0,0.1);
	        }
			
			@media (max-width: 1000px){
		        .calendar {
					width: calc(100% - 2px);
		        }     
		        
	            .calendar-date > div > .each-date > .date-header{
		            font-size: 0.5em;
		            
		        	padding-left: 5px;
		        	padding-top: 5px;
		        }
		        
		        .calendar-week > div{
		        	padding-top: 5px;
		        	padding-bottom: 5px;
		            font-weight: 500;
		            font-size: 0.8em;
		        }
		        
		        .calendar-info .common-btn{
					
					margin-right: 10px;
					font-size: 0.8em;
					font-weight: bold;
					
					border-radius: 10px;
					padding-top: 5px;
					padding-bottom: 5px;
					padding-left: 7px;
					padding-right: 7px;
		        }
		        
		        .calendar-header{
		        	padding-top: 10px;
		        	padding-bottom: 10px;
		            font-size: 0.9em;
		            font-weight: bold;
		        }
		        
		        .date-reserv > .btn-reserv{
		        	border-radius: 5px;
		        	padding-top: 3px;
		        	padding-bottom: 2px;
		        	padding-left: 4px;
		        	padding-right: 4px;
		        	font-size: 0.6em;
		        }
		        
		        .date-reserv > .btn-reserv > span {
		        	border-radius: 6px;
		        	width: 12px;
		        	height: 12px;
		        	padding-bottom: 0px;
		        	font-size: 0.7em;
		        }
		        
	        }
	        
        </style>
    </head>
    <body>
    	<section>
	    	<div class="calendar-container">
		        <div class="calendar">
		        	<div class="calendar-header">
		        		<div onClick="prevCalendar();">&#60;</div>
		        		<div>
		        			<span id="calYear"></span>년
		        			&nbsp;
			                <span id="calMonth"></span>월
		        		</div>
		        		<div onClick="nextCalendar();">&#62;</div>
		        	</div>
		        	<div class="calendar-info">
		        		<div>
			        		<div class="common-btn">방문 상담 예약</div>
		        		</div>
		        	</div>
		        	<div class="calendar-week">
		        		<div class="holiday">일</div>
		        		<div>월</div>
		        		<div>화</div>
		        		<div>수</div>
		        		<div>목</div>
		        		<div>금</div>
		        		<div>토</div>
		        	</div>
		        	<div class="calendar-date">
		        		<div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        		</div>
		        		<div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        		</div>
		        		<div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        		</div>
		        		<div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        		</div>
		        		<div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        		</div>
		        		<div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        			<div class="each-date"></div>
		        		</div>
		        	</div>
			    </div>
		    </div>
    	</section>
	    
 	    <div class="black-wall display-none" onclick="f_close()"></div>
    	<div class="common-modal display-none">
    		<div id="modalContent">
    			
    		</div>
    		<div>
    			<div class="common-btn" id="confirmBtn">확인</div>
    			<div class="common-btn" onclick="f_close()">취소</div>
    		</div>
    	</div>
        
	    <script>
	 		// 웹 페이지가 로드되면 buildCalendar 실행
	        window.onload = function(){ 
	        	buildCalendar(); 
	        }    
	
	        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	        let today = new Date();     // 페이지를 로드한 날짜를 저장
	        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
	        
	        let v_reservList = JSON.parse('${reservList}');
	        console.log(v_reservList);
	
	        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	        function buildCalendar() {
	
	            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
	            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
	            let calendarDate = document.querySelectorAll(".each-date");

	            // 1일의 요일 (0:일요일, 1:월요일, ...);
	            let v_firstDay = firstDate.getDay();
	            // 마지막날 (1월이면 31 리턴)
	            let v_lastDay = lastDate.getDate();
	            
	            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
	            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
	
	            // 날짜칸 초기화
	            for(let i = 0; i < calendarDate.length; i++){
	            	calendarDate[i].innerHTML = "";
	            	calendarDate[i].style.width = (calendarDate[0].parentElement.offsetWidth / 7) + "px";
	            	calendarDate[i].style.height = (calendarDate[0].parentElement.offsetWidth / 7) * 0.7 + "px";
	            	calendarDate[i].classList.remove("pastDay", "today", "futureDay", "choiceDay");
	            }
	            
	            // 날짜 칸 카운팅
	            let v_count = 0;
	            
	         	// 이번달 1일의 요일만큼 칸 추가
	            for (let j = 0; j < firstDate.getDay(); j++) {  
	                v_count++;
	            }
	
	         	// day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
	            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   
	
	                let newDate = document.createElement("div");
	                newDate.className = "date-header";
	                newDate.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
	                
	                if(nowDay.getDay() == 0 && !(nowDay < today)){
	                	newDate.classList.add("holiday");
	                }
	                
	                if (nowDay < today) {                       // 지난날인 경우
	                	calendarDate[v_count].classList.add("pastDay");
	                }else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
	                	calendarDate[v_count].classList.add("today");
	                	calendarDate[v_count].onclick = function (){ 
	                    	choiceDate(this); 
	                    }
	                }else {                                      // 미래인 경우
	                	calendarDate[v_count].classList.add("futureDay");
	                	calendarDate[v_count].onclick = function(){ 
	                    	choiceDate(this); 
	                    }
	                }
	                
	                calendarDate[v_count].appendChild(newDate);
	                
	                // 임시로 예약자 담기
	                
	                let newReserv = document.createElement("div");
	                newReserv.className = "date-reserv";
	                let nameReserv = document.createElement("div");
	                nameReserv.className = "btn-reserv";
	                nameReserv.innerHTML = "정*웅";
	                let newSpan = document.createElement("span");
	                newSpan.innerHTML = "3";
	                nameReserv.appendChild(newSpan);
	                newReserv.appendChild(nameReserv);
	                calendarDate[v_count].appendChild(newReserv);
	                
	                v_count++;
	            }
	         	
	         	// 4~6줄에 따라 줄(row) 조정
         		let calDateDivs = document.querySelectorAll(".calendar-date > div");

     			calDateDivs[4].style.display = "flex";
     			calDateDivs[5].style.display = "flex";
         		
     			// 4줄이 되는 경우
         		if(v_firstDay == 0 && v_lastDay == 28){
         			calDateDivs[4].style.display = "none";
         			calDateDivs[5].style.display = "none";
         		}else if(!((v_firstDay == 5 && v_lastDay == 31) || (v_firstDay == 6 && v_lastDay >= 30))){
         			// 5줄인 경우
         			calDateDivs[5].style.display = "none";
         		}
	         	
     			// v_reservList 로부터 화면에 그릴 데이터 만들기
     			// 날짜별로 묶어서 몇명인지 파악
	         	
	        }
	
	        // 날짜 선택 (클릭 이벤트)
	        function choiceDate(newDIV) {
	            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
	                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	            }
	            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	            
	            let v_choiceDate = document.getElementById("calYear").innerText + "-" + document.getElementById("calMonth").innerText + "-" + newDIV.children[0].innerHTML;
	            
	            
	            //location.href = '${pageContext.request.contextPath }/insertReservView?choiceDate=' + v_choiceDate;
	            
	        }
	
	        // 이전달 버튼 클릭
	        function prevCalendar() {
	            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	            
	            let v_choiceDate = nowMonth.getFullYear() + "-" + leftPad(nowMonth.getMonth() + 1) + "-" + leftPad(nowMonth.getDate());
	            f_reservList(v_choiceDate);
	        }
	        // 다음달 버튼 클릭
	        function nextCalendar() {
	        	let todayMonth = new Date();
	        	// 현재 캘린더의 Month가 오늘 Month + 1보다 같거나 작은경우에만 다음 Month 보기 가능
	        	// 즉, 캘린더의 Month는 오늘 Month에 대해 다다음달까지만 보여준다.
	        	if(nowMonth.getMonth() <= todayMonth.getMonth() + 2){        		
		            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
		            let v_choiceDate = nowMonth.getFullYear() + "-" + leftPad(nowMonth.getMonth() + 1) + "-" + leftPad(nowMonth.getDate());
		            f_reservList(v_choiceDate);
	        	}
	        }
	        
	        function f_reservList(p_date){
				let v_ajax = new XMLHttpRequest();
	            
	            let v_url = '${pageContext.request.contextPath }/reservList';
	            
	            v_ajax.open('POST', v_url);
	            
	            v_ajax.setRequestHeader("Content-Type", "application/json");
	            
	            v_ajax.onload = function(){
	            	console.log(v_ajax.response);
	            	
	            	v_reservList = JSON.parse(v_ajax.response);
	            	
	            	buildCalendar();    
	            }
	            
	            v_ajax.send(p_date);
	        }
	
	        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	        function leftPad(value) {
	            if (value < 10) {
	                value = "0" + value;
	            }
	            return value;
	        }
	        
	        const v_modalContent = document.getElementById("modalContent");
	        const v_confirmBtn = document.getElementById("confirmBtn");
	        
	        function f_close(){
	        	document.querySelector(".black-wall").classList.add("display-none");
	        	document.querySelector(".common-modal").classList.add("display-none");
	        }
	        
        </script>
	</body>
</html>

