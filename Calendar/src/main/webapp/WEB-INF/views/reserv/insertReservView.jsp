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
	
			#reservation{
				width: 1100px;
				margin: auto;
				user-select: none;
			}
			
			#reservation > div{
				display: flex;
				justify-content: center;
			}
			
			/* calendar-container 의 크기에 따라 내부 달력의 크기가 변한다. (정사각형 권장) */
			.calendar-container{
				width: 600px;
				margin-bottom: 30px;
				border: 1px solid black;
				transition-duration: 0.2s;  /* 이게 걸려있으면 JS로 UI 변경 시 애니메이션처럼 변한다. */
			}
			
	        .calendar {
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
	        	height: 100%;
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
				justify-content: start;
				flex-wrap: wrap;
			}
			
	        .calendar-date > div {
	            font-family: 'Montserrat', sans-serif;
	            border-radius: calc(100%/2);
	            font-size: 1.2em;
	            transition-duration: 0.4s;
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
	        
	        .holiday{
	        	color: rgb(252,76,78);
	        }
	        
	        .reserv-container{
	        	width: 500px;
	        	height: 600px;
	        }
	        
	        .reserv-container > .time-table{
	        	height: 40%;
	        }
	        
	        /* 상담 시간 선택 */
	        .reserv-container > .time-table > .time-header{
      		    display:flex;
	        	align-items: center;
	        	
	        	margin-top: 20px;
	        	margin-left: calc(100%/9);
	        }
	        
	        .reserv-container > .time-table > .time-header > span{
	        	margin-left: 10px;
	        	font-size: 1.2em;
	        	font-weight: 600;
	        }
	        
	        .reserv-container > .time-table > .time-list{
	        	height: 70%;
	        	
	        	padding-top: 20px;
	        	
	        	width: 80%;
	        	margin: auto;
	        	
	        	display:flex;
	        	flex-wrap: wrap;
	        	align-items: center;
	        }
	        
	        .reserv-container > .time-table > .time-list > div{
	        	width: calc(100%/4 - 8px);
	        	height: calc(100%/5 - 3px);
	        	
	        	display:flex;
	        	justify-content: center;
	        	align-items: center;
	        
	        	margin-right: 5px;
	        	margin-bottom: 5px;
	        	padding-bottom: 3px;
	        	
	        	font-family: 'Montserrat', sans-serif;
	        }

	        .reserv-container > .time-table > .time-list > .time-enable{
	        	border: 1px solid rgb(200, 225, 175);
	        	background-color: rgb(237, 251, 220);
	        	cursor: pointer;
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-disable{
	        	border: 1px solid #ccc;
	        	background-color: #eee;
	        	color: #ccc;
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-enable:hover{
				color: rgb(3, 199, 90);    	
	        	border: 1px solid rgb(3, 199, 90);
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-select{
	        	border: 1px solid rgb(0, 199, 61);
	        	background-color: rgb(0, 199, 61);
	        	color: #fff;
	        	font-weight: bold;
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-select:hover{
	        	border: 1px solid rgb(0, 199, 61);
	        	background-color: rgb(0, 199, 61);
	        	color: #fff;
	        	font-weight: bold;
	        }
	        
	        
	        .reserv-container > .calendar-date{
	        	height: 60%;
	        }
	        
	        input{
			    font-family: 'Noto Sans KR','Noto Sans Korean', "Nanum Gothic", sans-serif !important;
			    -webkit-appearance: none;
			    -webkit-border-radius: 0;
			    border: 0;
			    outline: none;
			    font-size: 10px;
			}
			input::placeholder{
			  color: #aaa
			}
			.dust-class{
			  width: 70%;
			  margin: auto; 
			  margin-bottom: 10px;
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
			    font-size: 1rem;
			    line-height: 1.45;
			    letter-spacing: -0.04rem;
			    border-radius: 8px;
			    padding: 16px;
			    margin-top: 12px;
			}
			
			.reserv-container p{
				font-weight: bold;
			    width: 100%;
			    color: red;
			    font-size: 14px;
			    margin: 0;
			    text-align: center;
			    transform: translate(0, -40%);
			    transition-duration: 0.2s;
			}
			
			.reserv-container button{
				background-color: #0A174E;
				width: 78%;
				display: block;
				margin: auto;
				color: white;
				font-size: 1.3em;
				margin-top: 15px;
				
				border-radius: 17px;
				padding-top: 11px;
				padding-bottom: 11px;
				
				cursor: pointer;
			}
			
			@media (max-width: 1000px){
      			#reservation{
					width: 100%;
				}
	        
				#reservation > div{
					display: block;
					width: 100%;
				}
				
				.calendar-container{
					width: 100%;
				}
				
				.reserv-container{
		        	width: 100%;
		        }
	        }
	        
	        @media (max-width: 500px){
				.reserv-container p{
				    font-size: 11px;
				}
	        }
	        
        </style>
    </head>
    <body>
    	<section id="reservation">
    		<div>
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
			    
			    <div class="reserv-container">
			    	<div class="time-table">
			    		<div class="time-header">
			    			<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 0c6.623 0 12 5.377 12 12s-5.377 12-12 12-12-5.377-12-12 5.377-12 12-12zm0 1c6.071 0 11 4.929 11 11s-4.929 11-11 11-11-4.929-11-11 4.929-11 11-11zm0 11h6v1h-7v-9h1v8z"/></svg>
			    			<span>상담 예약 시간 선택</span>
			    		</div>
			    		<div class="time-list">
			    			<c:forEach items="${enableTimeList }" var="enableTime">
			    				<c:if test="${enableTime.isEnable() eq true }">
				    				<div class="time-enable">${enableTime.time }</div>
			    				</c:if>
			    				<c:if test="${enableTime.isEnable() eq false}">
				    				<div class="time-disable">${enableTime.time }</div>
			    				</c:if>
			    			</c:forEach>
			    		</div>
			    	</div>
			    	<div class="reserv-input">
			    		<form action="<c:url value="/insertReservDo" />" method="POST">
			    			
			    			<input name="reservDate" id="inputDate" type="hidden">
			    			<input name="reservTime" id="inputTime" type="hidden">
			    			
							<div class="dust-class">
							  <label for="itemname"><span>* </span>이름</label>
							  <input name="reservName" type="text" class="txt-input" id="itemname" placeholder="이름을 입력해주세요." value="">
							</div>
							<div class="dust-class">
							  <label for="itempw"><span>* </span>연락처</label>
							  <input name="reservPhone" type="text" class="txt-input" id="itempw" placeholder="ex) 01012345678" value="">
							</div>
							<div class="dust-class">
							  <label for="itemnew"><span>* </span>비밀번호</label>
							  <input name="reservPw" type="password" class="txt-input" id="itemnew" placeholder="" value="">
							</div>
						    <p>비밀번호는 상담 예약 확인 및 수정/삭제를 위해 사용됩니다.</p>
						    
						    <button>상담 예약</button>
			    		</form>
			    	</div>
			    </div>
    		</div>    	
    	</section>
        
	    <script>
	 		// 웹 페이지가 로드되면 buildCalendar 실행
	        window.onload = function(){ 
	        	buildCalendar(); 
	        }    
	
	        const v_inputTime = document.getElementById("inputTime");
	        const v_inputDate = document.getElementById("inputDate");
	        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	        let today = new Date();     // 페이지를 로드한 날짜를 저장
	        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
	        
	        let v_calendarContainerHeight = null;
	
	        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	        // 한줄(div display:flex)에 7개씩 넣어서 반응형 대응으로 만들기 
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
	                newDIV.style.width = (calendarDate.offsetWidth / 7 - 20) + "px";
	                newDIV.style.height = (calendarDate.offsetWidth / 7 - 20) + "px";
	                calendarDate.appendChild(newDIV);
	            }
	
	         	// day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
	            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   
	
	                let newDIV = document.createElement("div");
	                v_count++;
	                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
	                newDIV.style.width = (calendarDate.offsetWidth / 7 - 20) + "px";
	                newDIV.style.height = (calendarDate.offsetWidth / 7 - 20) + "px";
	                
	                // 일요일은 빨갛게
	                if(nowDay.getDay() == 0 && !(nowDay < today)){
	                	newDIV.classList.add("holiday");
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
	                
	                calendarDate.appendChild(newDIV);
	            }
	         	
	         	
	         	// 7줄 까지 넘어가면 달력의 컨테이너 크기 조정
         		let calContainer = document.querySelector(".calendar-container");
	         	
	         	if(v_calendarContainerHeight == null){
		            v_calendarContainerHeight = calContainer.offsetHeight;
	         	}
	         	if(v_count > 35){
	         		calContainer.style.height = v_calendarContainerHeight + (calendarDate.offsetWidth / 7) + 16 + "px";
	         	}else{
	         		let v_container = calContainer.parentElement;
	         		calContainer.style.height = v_calendarContainerHeight + "px";
	         	}
	        }
	
	        // 날짜 선택 (클릭 이벤트)
	        function choiceDate(newDIV) {
	            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
	                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
	            }
	            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
	            
	            // 서버에 AJAX 요청 보낸 후 응답 받아온 걸로 화면에 예약 가능 시간 그려줘야함
	            let v_ajax = new XMLHttpRequest();
	            
	            let v_url = '${pageContext.request.contextPath }/enableTimeList';
	            
	            console.log(v_url);
	            console.log(newDIV.innerHTML);
	            
	            let v_choiceDate = document.getElementById("calYear").innerText + "-" + document.getElementById("calMonth").innerText + "-" + newDIV.innerHTML;
	            
	            let v_param = "?" + "choiceDate=" + v_choiceDate;
		        
	            v_inputDate.value = v_choiceDate;
	            
	            console.log(v_param);
	            
	            console.log(v_url + v_param);
	            
	            v_ajax.open('GET', v_url + v_param);
	            
	            v_ajax.onload = function(){
	            	console.log(v_ajax.response);
	            	
	            	let v_enableTimeList = JSON.parse(v_ajax.response);
	            	let v_timeList = document.querySelector(".time-list");
	            	v_timeList.innerHTML = "";
	            	
	            	for(let i = 0; i < v_enableTimeList.length; i++){
	            		let v_str = '<div class="time-enable">' + v_enableTimeList[i].time + '</div>';
	            		if(!v_enableTimeList[i].isEnable){
		            		v_str = '<div class="time-disable">' + v_enableTimeList[i].time + '</div>';
	            		}
	            		v_timeList.innerHTML += v_str;
	            	}
	            	
	            	v_addClickEvent();
	            }
	            
	            v_ajax.send();
	            
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
	        

	        
	        // 예약시간들에 클릭 이벤트 추가
	        function v_addClickEvent(){
		        const v_timeList = document.querySelectorAll(".time-list > .time-enable");
		        for(let i = 0; i < v_timeList.length; i++){
		        	v_timeList[i].addEventListener("click", function(){
		        		console.log(event.target.innerHTML);
		        		
		        		if(document.querySelectorAll(".time-select").length > 0){
			        		document.querySelector(".time-select").classList.remove("time-select");
		        		}
		        		
		        		event.target.classList.add("time-select");
		        		
		        		v_inputTime.value = event.target.innerHTML;
		        		console.log(v_inputTime.value);
		        	});
		        }
	        }
	        
	        v_addClickEvent();
	        
	        
	    </script>        
    </body>
</html>

