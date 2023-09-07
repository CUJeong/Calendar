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
	        	width: 50%;
	        	text-align: center;
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
	        	font-family: 'Montserrat', sans-serif;
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
	        	margin-bottom: 0px;
	        	font-size: 0.8em;
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
	        
			.common-toast{
	            position: fixed;
	            left: 50%;
	            bottom: 0%;
	            transform: translate(-50%, -50%);
	            width: 500px;
	            padding-top: 20px;
	            padding-bottom: 20px;
	            background-color: #0A174E;
	            border-radius: 20px;
	            box-shadow: 1px 1px 6px 1px #0004;
	            color: white;
				font-size: 1.2em;
				font-weight: bold;
				text-align: center;
				cursor: pointer;
	        }
	        
	        .second-modal span{
	        	background-color: #dc3545;
	        	color: white;
	        	padding-left: 5px;
	            padding-right: 5px;
	        	padding-top: 3px;
	            padding-bottom: 3px;
	            border-radius: 5px;
	            font-weight: bold;
	            cursor: pointer;
	        }
	        
	        input{
			    font-family: 'Noto Sans KR','Noto Sans Korean', "Nanum Gothic", sans-serif !important;
			    -webkit-appearance: none;
			    -webkit-border-radius: 0;
			    border: 0;
			    outline: none;
			    font-size: 10px;
			}
			input[type="number"]::-webkit-outer-spin-button,
			input[type="number"]::-webkit-inner-spin-button {
			    -webkit-appearance: none;
			    margin: 0;
			}
			input::placeholder{
			  color: #aaa
			}
			input[type="number"]{
				-webkit-text-security: disc;
			}
			.dust-class{
			  width: 90%;
			  margin-top: 10px;
			  transform: translate(-5%, 0);
			  box-sizeing: border-box;
			  position: relative;
			}
			.dust-class label{
			  display: inline-block;
			  position: absolute;
			  top: 0px;
			  left: 14px;
			  padding-left: 10px;
			  padding-right: 10px;
			  padding-top: 5px;
			  padding-bottom: 5px;
			  background: white;
			  font-size: 14px;
			  color: #444;
			  font-weight: bold;
			}
			.dust-class label span{
			  color: #da4841;
			  font-weight: bold;
			  vertical-align: -1px;
			}
			.dust-class input{
			    width: 100%;
			    border: 2px solid rgb(245, 208, 66) !important;
			    font-size: 0.8rem;
			    line-height: 1.2;
			    letter-spacing: -0.04rem;
			    border-radius: 8px;
			    padding: 16px;
			    margin-top: 12px;
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
		        
		        .common-modal{
		            width: 80%;
		        }
		        
		        .common-toast{
		            width: 80%;
		        }
		        
		        .second-modal h3{
		        	font-size: 1em;
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
			        		<div class="common-btn" onclick="f_showModal()">상담 예약 조회</div>
			        		<div class="common-btn" onclick="f_goReserv()">방문 상담 예약</div>
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
    		<div>
    			<p>상담 예약시 입력하신 연락처와 비밀번호를 입력해주세요.</p>
 				<div class="dust-class">
					<label for="inputPhone"><span>* </span>연락처</label>
					<input name="reservPhone" type="tel" pattern="\d*" class="txt-input" id="inputPhone" placeholder="ex) 01012345678" value="">
				</div>
				<div class="dust-class">
					<label for="inputPw"><span>* </span>비밀번호</label>
					<input name="reservPw" type="number" pattern="\d*" class="txt-input" id="inputPw" placeholder="4자리 숫자 입력" value="" >
				</div>
    		</div>
    		<div>
    			<div class="common-btn" id="confirmBtn">확인</div>
    			<div class="common-btn" onclick="f_close()">취소</div>
    		</div>
    	</div>
    	
    	<div class="common-modal second-modal display-none">
    		<div id="modalContent">
    			<p>상담 예약시 입력하신 연락처와 비밀번호를 입력해주세요.</p>
    		</div>
    		<div>
    			<div class="common-btn" id="leftBtn">수정</div>
    			<div class="common-btn" id="rightBtn">취소</div>
    		</div>
    	</div>
    	
    	<div class="common-toast display-none" onclick="f_goReserv()">
   			방문 상담 예약
    	</div>
        
	    <script>
	 		// 웹 페이지가 로드되면 buildCalendar 실행
	        window.onload = function(){ 
	        	buildCalendar(); 
	        	f_showToast();
	        }    
	
	        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	        let today = new Date();     // 페이지를 로드한 날짜를 저장
	        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
	        
	        let v_reservList = JSON.parse('${reservList}');
	        console.log(v_reservList);
	
	        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	        function buildCalendar() {
	        	
     			// v_reservList 로부터 화면에 그릴 데이터 만들기
     			// 날짜별로 묶어서 몇명인지 파악
     			let v_drawData = {};
     			for(let i = 0; i < v_reservList.length; i++){
     				
     				if(!v_drawData[v_reservList[i]["reservDate"]]){
     					v_drawData[v_reservList[i]["reservDate"]] = {name: '', cnt: 0};
     				}
     				
     				v_drawData[v_reservList[i]["reservDate"]]["cnt"] += 1;
     				
     				if(!v_drawData[v_reservList[i]["reservDate"]]["name"]){
     					v_drawData[v_reservList[i]["reservDate"]]["name"] = v_reservList[i]["reservName"].charAt(0) + "**";
     				}
     			}
	
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
	            	calendarDate[i].style.height = (calendarDate[0].parentElement.offsetWidth / 7) * 0.8 + "px";
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
	                
	                let v_keyDate = nowDay.getFullYear() + "-" + leftPad(nowDay.getMonth()+1) + "-" + leftPad(nowDay.getDate());
	                
	                
	                // 임시로 예약자 담기
	                if(v_drawData[v_keyDate]){
		                let newReserv = document.createElement("div");
		                newReserv.className = "date-reserv";
		                let nameReserv = document.createElement("div");
		                nameReserv.className = "btn-reserv";
		                nameReserv.innerHTML = v_drawData[v_keyDate]["name"];
		                let newSpan = document.createElement("span");
		                newSpan.innerHTML = v_drawData[v_keyDate]["cnt"];
		                nameReserv.appendChild(newSpan);
		                newReserv.appendChild(nameReserv);
		                calendarDate[v_count].appendChild(newReserv);
	                }
	                
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
	        }
	
	        // 날짜 선택 (클릭 이벤트)
	        let v_choiceDate = "";
	        function choiceDate(newDIV) {
	            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
	                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	            }
	            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	            
	            // 상담 예약으로 넘어갈때 넘겨주기 위해 날짜 저장
	            v_choiceDate = document.getElementById("calYear").innerText + "-" + document.getElementById("calMonth").innerText + "-" + newDIV.children[0].innerHTML;
	            
	            f_showToast();
	            
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
	        const v_leftBtn = document.getElementById("leftBtn");
	        const v_rightBtn = document.getElementById("rightBtn");
	        
	        const v_inputPhone = document.getElementById("inputPhone");
	        const v_inputPw = document.getElementById("inputPw");
	        
	     	// 상담 예약 클릭 시 모달창 띄워주기
	        v_confirmBtn.addEventListener("click", function(){
	        	
	            // 서버에 AJAX 요청 보낸 후 이미 예약한 사람이 아닌지 확인 한 후
	            // 예약 내역이 없으면 예약 진행 문구, 예약 내역이 있으면 기존 예약은 취소된다는 문구
	            let v_ajax = new XMLHttpRequest();
	            
	            let v_url = '${pageContext.request.contextPath }/getReserv';
	            
	            
	            v_ajax.open('POST', v_url);
	            
	            // POST 방식으로 AJAX 요청시 헤더 설정을 해주어야 한다.
	            v_ajax.setRequestHeader("Content-Type", "application/json");
	            let v_data = {
	            	reservPhone : v_inputPhone.value,
            		reservPw : v_inputPw.value
	            };
	            
	            //let v_data = "inputName=" + v_inputName.value;
	            //v_data += "&inputPhone=" + v_inputPhone.value;
	            
	            v_ajax.onload = function(){
	            	console.log(v_ajax.response);
	            	
	            	let v_data = JSON.parse(v_ajax.response);
	            	if(v_data["data"]){	            		
		            	
		            	let v_name = v_data["data"]["reservName"] + " 님의 예약일자";
		            	let v_dateTime = v_data["data"]["reservDate"] + " " + v_data["data"]["reservTime"];
		            	
	            		v_modalContent.innerHTML = "<h3>" + v_name + "</h3>";
	            		let v_h3 = document.createElement("h3");
	            		let v_span = document.createElement("span");
	            		v_span.onclick = function(){
	            			f_cancelReserve(v_data);
	            		}
	            		v_span.innerHTML = "삭제";
	            		v_h3.innerHTML = v_dateTime + " ";
	            		v_h3.appendChild(v_span);
	            		v_modalContent.appendChild(v_h3);
	            		v_leftBtn.innerHTML = "변경";
	            		v_leftBtn.style.backgroundColor = "#FFC107";
	            		v_rightBtn.innerHTML = "닫기";
	            		
	            		v_leftBtn.addEventListener("click", function(){
	            			f_goReserv(v_data);
	            			f_close();
	            		});
	            		
	            		v_rightBtn.addEventListener("click", function(){
	            			document.querySelector(".second-modal").classList.add("display-none");
	            			f_close();
	            		});
	            		
	            		document.querySelector(".second-modal").classList.remove("display-none");
	            	}else{
	            		v_modalContent.innerHTML = "<h3>해당 연락처로 예약한 정보가 없거나 비밀번호가 틀립니다.</h3>";
	            		v_leftBtn.innerHTML = "이전";
	            		v_leftBtn.style.backgroundColor = "#0A174E";
	            		v_rightBtn.innerHTML = "닫기";
	            		
	            		v_leftBtn.addEventListener("click", function(){
	            			document.querySelector(".second-modal").classList.add("display-none");
	            		});
	            		
	            		v_rightBtn.addEventListener("click", function(){
	            			document.querySelector(".second-modal").classList.add("display-none");
	            			f_close();
	            		});
	            		
	            		document.querySelector(".second-modal").classList.remove("display-none");
	            	}
	            };
	            
	            v_ajax.send(JSON.stringify(v_data));
	            //v_ajax.send(v_data);
	        	
	        });
	        
	        v_inputPhone.addEventListener("input", function(){
				if(event.target.value.length > 11){
					event.target.value = event.target.value.substr(0, event.target.value.length - 1);
				}       	
	        });
	        
	        v_inputPw.addEventListener("input", function(){
				if(event.target.value.length > 4){
					event.target.value = event.target.value.substr(0, event.target.value.length - 1);
				}  
	        });
	        
	        v_inputPw.addEventListener("keydown", function(){
	        	if(event.keyCode == 13){
	        		v_confirmBtn.click();
	        	}
	        });
	        
	        function f_close(){
	        	document.querySelector(".black-wall").classList.add("display-none");
	        	document.querySelector(".common-modal").classList.add("display-none");
	        	document.querySelector(".second-modal").classList.add("display-none");
	        	f_showToast();
	        }
	        
	        function f_showModal(){
	        	f_closeToast();
	        	document.querySelector(".black-wall").classList.remove("display-none");
	        	document.querySelector(".common-modal").classList.remove("display-none");
	        }
	        
	        function f_showToast(){
	        	document.querySelector(".common-toast").classList.remove("display-none");
	        }
	        
	        function f_closeToast(){
	        	document.querySelector(".common-toast").classList.add("display-none");
	        }
	        
	        
	        function f_goReserv(p_data){
	        	console.log(p_data);
	        	
	        	if(p_data){
		        	let v_queryStr = "&reservName=" + p_data["data"]["reservName"];
		        	v_queryStr += "&reservPhone=" + p_data["data"]["reservPhone"];
		        	
		        	location.href = "${pageContext.request.contextPath }/insertReservView?choiceDate=" + v_choiceDate + v_queryStr;
	        	}else{
		        	if(!v_choiceDate){
		        		let today = new Date();
		        		v_choiceDate = today.getFullYear() + "-" + leftPad(today.getMonth() + 1) + "-" + leftPad(today.getDate());
		        	}
		        	
		        	location.href = "${pageContext.request.contextPath }/insertReservView?choiceDate=" + v_choiceDate;
	        	}
	        }
	        
	        function f_cancelReserve(p_data){
	        	console.log(p_data);
	        	
	        	if(!confirm('상담 예약을 취소하시겠습니까?')){
	        		return;
	        	}
	        	
				let v_ajax = new XMLHttpRequest();
	            
	            let v_url = '${pageContext.request.contextPath }/cancelReserv';
	            
	            
	            v_ajax.open('POST', v_url);
	            
	            // POST 방식으로 AJAX 요청시 헤더 설정을 해주어야 한다.
	            v_ajax.setRequestHeader("Content-Type", "application/json");
	            let v_data = {
	            	reservName : p_data["data"]["reservName"],
	            	reservPhone : p_data["data"]["reservPhone"]
	            };
	            
	            v_ajax.onload = function(){
	            	
	            	if(v_ajax.response == 'true'){
	            		location.href = '${pageContext.request.contextPath }/reservView';
	            	}else{
	            		alert('서버에 문제가 발생하였습니다.');
	            		location.href = '${pageContext.request.contextPath }/reservView';
	            	}
	            	
	            }
	            
	            v_ajax.send(JSON.stringify(v_data));
	        }
	        
	        
        </script>
	</body>
</html>

