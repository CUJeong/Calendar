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
	            background-color : white;
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
	        	padding-top: 10px;
	        	padding-bottom: 10px;
	        	display: flex;
	        	align-items: center;
	        }
	        
	        .calendar-week > div{
	        	width: calc(100%/7);
	        	font-family: 'Questrial', sans-serif;
	            font-weight: 600;
	            font-size: 1.2em;
	            display: flex;
	            justify-content: center;
	        	align-items: center;
	        }
	
			/* 날짜 표기 부분 */
			.calendar-date {
			}
			
			.calendar-date > div {
	            display: flex;
	            justify-content: space-between;
	        }
			
	        .calendar-date > div > .each-date {
	            font-family: 'Montserrat', sans-serif;
	            border-radius: calc(100%/2);
	            font-size: 1.2em;
	            transition-duration: 0.2s;
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
	        	border: 1px solid rgba(245, 208, 66, 0.5);
	        	background-color: rgba(245, 208, 66, 0.2);
	        	cursor: pointer;
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-disable{
	        	border: 1px solid #ccc;
	        	background-color: #eee;
	        	color: #ccc;
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-enable:hover{
				color: rgb(245, 208, 66);    	
	        	border: 1px solid rgb(245, 208, 66);
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-select{
	        	border: 1px solid rgb(245, 208, 66);
	        	background-color: rgb(245, 208, 66);
	        	color: #fff;
	        	font-weight: bold;
	        }
	        
	        .reserv-container > .time-table > .time-list > .time-select:hover{
	        	border: 1px solid rgb(245, 208, 66);
	        	background-color: rgb(245, 208, 66);
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
			input[type="number"]::-webkit-outer-spin-button,
			input[type="number"]::-webkit-inner-spin-button {
			    -webkit-appearance: none;
			    margin: 0;
			}
			input::placeholder{
			  color: #aaa
			}
			input[type="tel"]{
				-webkit-text-security: disc;
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
		        
		        .common-modal{
		            width: 80%;
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
			    		<form id="insertForm" action="<c:url value="/insertReservDo" />" method="POST">
			    			
			    			<input name="reservDate" id="inputDate" type="hidden">
			    			<input name="reservTime" id="inputTime" type="hidden">
			    			
							<div class="dust-class">
							  <label for="inputName"><span>* </span>이름</label>
							  <input name="reservName" type="text" class="txt-input" id="inputName" placeholder="이름을 입력해주세요." value="" >
							</div>
							<div class="dust-class">
							  <label for="inputPhone"><span>* </span>연락처</label>
							  <input name="reservPhone" type="number" pattern="\d*" class="txt-input" id="inputPhone" placeholder="ex) 01012345678" value="">
							</div>
							<div class="dust-class">
							  <label for="inputPw"><span>* </span>비밀번호</label>
							  <input name="reservPw" type="tel" pattern="\d*" class="txt-input" id="inputPw" placeholder="4자리 숫자 입력" value="" >
							</div>
						    <p>비밀번호는 상담 예약 확인 및 수정/삭제를 위해 사용됩니다.</p>
						    
						    <button type="button" id="reservBtn">상담 예약</button>
			    		</form>
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
	
	        const v_inputTime = document.getElementById("inputTime");
	        const v_inputDate = document.getElementById("inputDate");
	        const v_modalContent = document.getElementById("modalContent");
	        const v_reservBtn = document.getElementById("reservBtn");
	        const v_insertForm = document.getElementById("insertForm");
	        
	        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
	        let today = new Date();     // 페이지를 로드한 날짜를 저장
	        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
	        
	        let v_calendarContainerHeight = null;
	        v_inputDate.value = '${choiceDate}';
	
	        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	        // 한줄(div display:flex)에 7개씩 넣어서 반응형 대응으로 만들기 
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
	
	            for(let i = 0; i < calendarDate.length; i++){
	            	calendarDate[i].innerHTML = "";
	            	calendarDate[i].style.width = (calendarDate[0].parentElement.offsetWidth / 7 - 20) + "px";
	            	calendarDate[i].style.height = (calendarDate[0].parentElement.offsetWidth / 7 - 20) + "px";
	            	calendarDate[i].classList.remove("pastDay", "today", "futureDay", "choiceDay");
	            }
	            
	            // 날짜 칸 카운팅
	            let v_count = 0;
	            
	         	// 이번달 1일의 요일만큼 v_count 증가 추가
	            for (let j = 0; j < firstDate.getDay(); j++) {  

	                v_count++;
	            }
	
	         	// day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
	            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   
	
	                calendarDate[v_count].innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
	            	calendarDate[v_count].style.width = (calendarDate[0].parentElement.offsetWidth / 7 - 20) + "px";
	            	calendarDate[v_count].style.height = (calendarDate[0].parentElement.offsetWidth / 7 - 20) + "px";
	                
	                // 일요일은 빨갛게
	                if(nowDay.getDay() == 0 && !(nowDay < today)){
	                	calendarDate[v_count].classList.add("holiday");
	                }
	                
	                if (nowDay < today) {                       // 지난날인 경우
	                	calendarDate[v_count].classList.add("pastDay");
	                	calendarDate[v_count].classList.remove("holiday");
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
	                
	                let v_nowDay = nowDay.getFullYear() + "-" + leftPad(nowDay.getMonth() + 1) + "-" + leftPad(nowDay.getDate());
	                if(v_nowDay == '${choiceDate}'){
	                	calendarDate[v_count].classList.add("choiceDay");
	                }
	                v_count++;
	            }
	         	
	         	
	         	// 7줄 까지 넘어가면 v_count 에 따라 줄(row) 조정
         		
	         	
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
	        
	        const v_inputName = document.getElementById("inputName");
	        const v_inputPhone = document.getElementById("inputPhone");
	        const v_inputPw = document.getElementById("inputPw");
	        
	        
	        // 상담 예약 클릭 시 모달창 띄워주기
	        v_reservBtn.addEventListener("click", function(){
	        	// validation 결과에 따라 이후 작업
	        	
	        	let v_valid = f_validation();
	        	if(v_valid == 0){
	        		document.querySelector("#modalContent").innerHTML = "<p>상담 예약 시간을 선택해주세요.</p>";
	        		f_show();
	            	document.querySelector("#confirmBtn").addEventListener("click", function(){
	            		f_close();
	            	});
	        		return;
	        	}else if(v_valid == 1) {
	        		document.querySelector("#modalContent").innerHTML = "<p>이름을 입력해주세요.</p>";
	        		f_show();
	            	document.querySelector("#confirmBtn").addEventListener("click", function(){
	            		f_close();
	            	});
	        		return;
	        	}else if(v_valid == 2){
	        		document.querySelector("#modalContent").innerHTML = "<p>올바른 연락처를 입력해주세요.</p>";
	        		f_show();
	            	document.querySelector("#confirmBtn").addEventListener("click", function(){
	            		f_close();
	            	});
	        		return;
	        	}else if(v_valid == 3){
	        		document.querySelector("#modalContent").innerHTML = "<p>비밀번호 4자리수를 입력해주세요.</p>";
	        		f_show();
	            	document.querySelector("#confirmBtn").addEventListener("click", function(){
	            		f_close();
	            	});
	        		return;
	        	}
	        	
	        	
	            // 서버에 AJAX 요청 보낸 후 이미 예약한 사람이 아닌지 확인 한 후
	            // 예약 내역이 없으면 예약 진행 문구, 예약 내역이 있으면 기존 예약은 취소된다는 문구
	            let v_ajax = new XMLHttpRequest();
	            
	            let v_url = '${pageContext.request.contextPath }/enableReservCheckDo';
	            
	            
	            v_ajax.open('POST', v_url);
	            
	            v_ajax.setRequestHeader("Content-Type", "application/json");
	            let v_data = {
	            	reservName : v_inputName.value,
	            	reservPhone : v_inputPhone.value
	            };
	            
	            //let v_data = "inputName=" + v_inputName.value;
	            //v_data += "&inputPhone=" + v_inputPhone.value;
	            
	            v_ajax.onload = function(){
	            	console.log(v_ajax.response);
	            	
	            	// 예약 신청 가능
	            	if(v_ajax.response == 'true'){
		            	document.querySelector("#modalContent").innerHTML = "<p>" + '<svg width="30" height="20" style="overflow: visible;" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 0c6.623 0 12 5.377 12 12s-5.377 12-12 12-12-5.377-12-12 5.377-12 12-12zm0 1c6.071 0 11 4.929 11 11s-4.929 11-11 11-11-4.929-11-11 4.929-11 11-11zm0 11h6v1h-7v-9h1v8z"/></svg>' + v_inputDate.value + "&nbsp;" + v_inputTime.value + "</p>" + "<p>상담 예약 신청하시겠습니까?</p>";
		            	document.querySelector("#confirmBtn").addEventListener("click", function(){
		            		v_insertForm.send();
		            	});
	            	}else{
	            		document.querySelector("#modalContent").innerHTML = "<p>" + '<svg width="30" height="20" style="overflow: visible;" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 0c6.623 0 12 5.377 12 12s-5.377 12-12 12-12-5.377-12-12 5.377-12 12-12zm0 1c6.071 0 11 4.929 11 11s-4.929 11-11 11-11-4.929-11-11 4.929-11 11-11zm0 11h6v1h-7v-9h1v8z"/></svg>' + v_inputDate.value + "&nbsp;" + v_inputTime.value + "</p>" + "<p>다른 날짜에 이미 예약신청중입니다.</p><p>기존 예약을 취소하고 현재 날짜로 다시 예약 신청하겠습니까?</p>";
		            	document.querySelector("#confirmBtn").addEventListener("click", function(){
		            		v_insertForm.action = '${pageContext.request.contextPath }/updateReservDo';
		            		v_insertForm.send();
		            	});
	            	}
	            	
	            	f_show();
	            	
	            };
	            
	            v_ajax.send(JSON.stringify(v_data));
	            //v_ajax.send(v_data);
	        	
	        });
	        
	        function f_show(){
	        	document.querySelector(".black-wall").classList.remove("display-none");
	        	document.querySelector(".common-modal").classList.remove("display-none");
	        }
	        
	        function f_close(){
	        	document.querySelector(".black-wall").classList.add("display-none");
	        	document.querySelector(".common-modal").classList.add("display-none");
	        }
	        
	        
	        v_inputPhone.addEventListener("input", function(){
				if(event.target.value.length > 11){
					event.target.value = event.target.value.substr(0, event.target.value.length - 1);
				}       	
	        });
	        
	        v_inputPw.addEventListener("input", function(){
	        	console.log(event.which);
				if(event.target.value.length > 4){
					event.target.value = event.target.value.substr(0, event.target.value.length - 1);
				}  
	        });
	        
	        v_inputPw.addEventListener("keydown", function(){
	        	console.log(event.keyCode);
	        	if(event.keyCode == 13){
	        		v_reservBtn.click();
	        	}
	        });
	        
	        // validation 검증 후 통과하면 true, 아니면 false 리턴
	        function f_validation(){
	        	let phoneRegex = /^[0-9]{11}$/;
	        	let pwRegex = /^[0-9]{4}$/;
	        	
	        	if(v_inputTime.value.length == 0){
	        		return 0;
	        	}else if(v_inputName.value.length == 0){
	        		return 1;
	        	}else if(!phoneRegex.test(v_inputPhone.value)){
	        		return 2;
	        	}else if(!pwRegex.test(v_inputPw.value)){
	        		return 3;
	        	}
	        	
	        	return 4;
	        }
	        
	    </script>        
    </body>
</html>

