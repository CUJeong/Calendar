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
	
			/* calendar-container 의 크기에 따라 내부 달력의 크기가 변한다. (1000x600px 비율 권장) */
			.calendar-container{
				width: 1000px;
				height: 600px;
			}
			
	        .calendar {
				width: 100%;
				height: 100%;
	            background-color : white;
	            user-select: none;
	            border: 1px solid black;
	            transition-duration: 0.2s;  /* 이게 걸려있으면 JS로 UI 변경 시 애니메이션처럼 변한다. */
	        }
	        
	        /* 최 상단 버튼과 년월 표기 */
	        .calendar-header{
	        	height: 15%;
	        	display: flex;
	        	justify-content: space-between;
	        	align-items: center;
	        	text-align: center;
	        	
	        	font-family: 'Questrial', sans-serif;
	            font-size: 1.3em;
	            font-weight: bold;
	        }
	        
	        .calendar-header > div{
	        	height: 100%;
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
	        	height: calc(8% - 2px);
	        	display: flex;
	        	align-items: center;
	        	border-top: 1px solid #ccc;
	        	border-bottom: 1px solid #ccc;
	        }
	        
	        .calendar-week > div{
	        	height: 100%;
	        	background-color: #eee;
	        	font-family: 'Questrial', sans-serif;
	            font-weight: 600;
	            font-size: 1.1em;
	            display: flex;
	            justify-content: center;
	        	align-items: center;
	        	width: calc(100%/7 - 0.9px);
	        	border-right: 1px solid #ccc;
	        }
	        

	        
	
			/* 날짜 표기 부분 */
			.calendar-date {
				height: 77%;
				display: flex;
				align-items: center;
				flex-wrap: wrap;
			}
			
	        .calendar-date > div {
	            transition-duration: 0.5s;
				width: calc(100%/7 - 0.9px);
				height: calc(100%/5 - 1px);
				border-right: 1px solid #eee;
				border-bottom: 1px solid #ccc;
	        }    
	        
	        .calendar-date > div > .date-header{
	            font-family: 'Montserrat', sans-serif;
	            font-size: 1.1em;
	            
	            height: 20%;
	            display: flex;
	            justify-content: start;
	        	align-items: center;
	        	padding-left: 10px;
	        	padding-top: 10px;
	        }
	        
	        .calendar-date > div > .date-reserv{
	            height: 80%;
	            
	            display: flex;
	            justify-content: center;
	        	align-items: center;
	        }    
	        
	        .date-reserv > .btn-reserv{
	        	background-color: rgb(13, 110, 253);
	        	border-radius: 12px;
	        	padding-top: 7px;
	        	padding-bottom: 7px;
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
	        	height: 21px;
	        	padding-bottom: 4px;
	        	display: flex;
	            justify-content: center;
	        	align-items: center;
	        	background-color: rgb(220, 53, 69);
	        	transform: translate(50%, -50%);
	        }
	        
	
	        .pastDay {
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
        </style>
    </head>
    <body>
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
	        	<div class="calendar-week">
	        		<div>일</div>
	        		<div>월</div>
	        		<div>화</div>
	        		<div>수</div>
	        		<div>목</div>
	        		<div>금</div>
	        		<div>토</div>
	        	</div>
	        	<div class="calendar-date">
	        	
	        	</div>
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
	
	        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	        function buildCalendar() {
	
	            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
	            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
	
	            let calendarDate = document.querySelector(".calendar-date");
	            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
	            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
	
	            // 이전 출력결과가 남아있는 경우 초기화
	            calendarDate.innerHTML = "";
	            
	            // 날짜 칸 카운팅
	            let v_count = 0;
	            
	         	// 이번달 1일의 요일만큼 칸 추가
	            for (let j = 0; j < firstDate.getDay(); j++) {  
	                let newDIV = document.createElement("div");
	                v_count++;
	                calendarDate.appendChild(newDIV);
	            }
	
	         	// day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
	            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   
	
	                let newDIV = document.createElement("div");
	                let newDate = document.createElement("div");
	                newDate.className = "date-header";
	                v_count++;
	                newDate.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
	                
	                if(nowDay.getDay() == 0 && !(nowDay < today)){
	                	newDate.classList.add("holiday");
	                }
	                
	                if (nowDay < today) {                       // 지난날인 경우
	                    newDIV.classList.add("pastDay");
	                }else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
	                    newDIV.classList.add("today");
	                    newDIV.onclick = function (){ 
	                    	choiceDate(this); 
	                    }
	                }else {                                      // 미래인 경우
	                    newDIV.classList.add("futureDay");
	                    newDIV.onclick = function(){ 
	                    	choiceDate(this); 
	                    }
	                }
	                
	                newDIV.appendChild(newDate);
	                
	                // 임시로 예약자 담기
	                let newReserv = document.createElement("div");
	                newReserv.className = "date-reserv";
	                let nameReserv = document.createElement("div");
	                nameReserv.className = "btn-reserv";
	                nameReserv.innerHTML = "정*웅 외";
	                let newSpan = document.createElement("span");
	                newSpan.innerHTML = "3";
	                nameReserv.appendChild(newSpan);
	                newReserv.appendChild(nameReserv);
	                newDIV.appendChild(newReserv);
	                //
	                
	                calendarDate.appendChild(newDIV);
	            }
	         	
	         	// 5줄 넘어가면 달력의 컨테이너 크기 조정
         		let calContainer = document.querySelector(".calendar");
	         	if(v_count > 35){
	         		let v_dates = document.querySelectorAll(".calendar-date > div");
	         		for(let i = 0; i < v_dates.length; i++){
	         			v_dates[i].style.height = "calc(100%/6 - 1px)";
	         		}
	         		calContainer.style.height = calContainer.offsetHeight + v_dates[0].offsetHeight + 6 + "px";
	         		
	         		// 마지막까지 채움 (6줄인 경우)
		            for (let j = 0; j < 42 - v_count; j++) {  
		                let newDIV = document.createElement("div");
		                newDIV.style.height = "calc(100%/6 - 1px)";
		                calendarDate.appendChild(newDIV);
		            }
	         	}else{
	         		let v_container = calContainer.parentElement;
	         		calContainer.style.height = v_container.offsetHeight + "px";
	         		
	         		// 마지막까지 채움 (5줄인 경우)
	         		// *매우 낮은 확률로 2월달은 4줄(row)일 수 있으나 개발사항에 고려하지 않음
		            for (let j = 0; j < 35 - v_count; j++) {  
		                let newDIV = document.createElement("div");
		                newDIV.style.height = "calc(100%/5 - 1px)";
		                calendarDate.appendChild(newDIV);
		            }
	         	}
	        }
	
	        // 날짜 선택 (클릭 이벤트)
	        function choiceDate(newDIV) {
	            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
	                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	            }
	            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	            
	            // 서버에 AJAX 요청 보낸 후 응답 받아온 걸로 화면에 예약 가능 시간 그려줘야함
	            
	        }
	
	        // 이전달 버튼 클릭
	        function prevCalendar() {
	            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	            buildCalendar();    // 달력 다시 생성
	        }
	        // 다음달 버튼 클릭
	        function nextCalendar() {
	        	let todayMonth = new Date();
	        	// 현재 캘린더의 Month가 오늘 Month + 1보다 같거나 작은경우에만 다음 Month 보기 가능
	        	// 즉, 캘린더의 Month는 오늘 Month에 대해 다다음달까지만 보여준다.
	        	if(nowMonth.getMonth() <= todayMonth.getMonth() + 2){        		
		            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
		            buildCalendar();    // 달력 다시 생성
	        	}
	        }
	
	        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	        function leftPad(value) {
	            if (value < 10) {
	                value = "0" + value;
	            }
	            return value;
	        }
	    </script>        
    </body>
</html>

