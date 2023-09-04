<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>홈 화면</title>
        
        <style type="text/css">
			@import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');
	
			/* container 의 크기에 따라 내부 달력의 크기가 변한다. (정사각형 권장) */
			.container{
				width: 600px;
				height: 600px;
				border: 1px solid black;
			}
			
	        .calendar-container {
	        	width: 100%;
	            height: 100%;
	            background-color : white;
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
	        	height: 10%;
	        	display: flex;
	        	align-items: center;
	        }
	        
	        .calendar-week > div{
	        	width: calc(100%/7);
	        	height: calc(100%/7);
	        	font-family: 'Questrial', sans-serif;
	            font-weight: 600;
	            font-size: 1.2em;
	            display: flex;
	            justify-content: center;
	        	align-items: center;
	        }
	
			/* 날짜 표기 부분 */
			.calendar-date {
				height: 75%;
				display: flex;
				align-items: center;
				flex-wrap: wrap;
			}
			
	        .calendar-date > div {
	            font-family: 'Montserrat', sans-serif;
	            border-radius: calc(100%/2);
	            font-size: 1.2em;
	            transition-duration: .2s;
	            display: flex;
				justify-content: center;
				align-items: center;
				margin: 10px;
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
        </style>
    </head>
    <body>
    	<div class="container">
	        <div class="calendar-container">
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
	            
	         	// 이번달 1일의 요일만큼 칸 추가
	            for (let j = 0; j < firstDate.getDay(); j++) {  
	                let newDIV = document.createElement("div");
	                newDIV.style.width = (calendarDate.offsetWidth / 7 - 20) + "px";
	                newDIV.style.height = (calendarDate.offsetWidth / 7 - 20) + "px";
	                calendarDate.appendChild(newDIV);
	            }
	
	         	// day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
	            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   
	
	                let newDIV = document.createElement("div");
	                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
	                newDIV.style.width = (calendarDate.offsetWidth / 7 - 20) + "px";
	                newDIV.style.height = (calendarDate.offsetWidth / 7 - 20) + "px";
	
	                if (nowDay < today) {                       // 지난날인 경우
	                    newDIV.className = "pastDay";
	                }else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
	                    newDIV.className = "today";
	                    newDIV.onclick = function (){ 
	                    	choiceDate(this); 
	                    }
	                }else {                                      // 미래인 경우
	                    newDIV.className = "futureDay";
	                    newDIV.onclick = function(){ 
	                    	choiceDate(this); 
	                    }
	                }
	                
	                calendarDate.appendChild(newDIV);
	            }
	        }
	
	        // 날짜 선택
	        function choiceDate(newDIV) {
	            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
	                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	            }
	            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	        }
	
	        // 이전달 버튼 클릭
	        function prevCalendar() {
	            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	            buildCalendar();    // 달력 다시 생성
	        }
	        // 다음달 버튼 클릭
	        function nextCalendar() {
	            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
	            buildCalendar();    // 달력 다시 생성
	        }
	
	        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	        function leftPad(value) {
	            if (value < 10) {
	                value = "0" + value;
	                return value;
	            }
	            return value;
	        }
	    </script>        
    </body>
</html>

