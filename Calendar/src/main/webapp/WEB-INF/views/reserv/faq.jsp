<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아코디언</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <style>
        .arcodian-container {
            width: 1000px;
            margin: auto;
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading1">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                    1. 수강신청은 어떻게 하나요 ?
                </button>
            </h2>
            <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="heading1"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - HRD-Net 사이트, 홈페이지 신청, 카카오톡 채널 신청, 전화 신청 중 선택 후
  학원 방문해서 방문상담 진행 후 과정신청서 작성하면 가접수가 완료됩니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading2">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                    2. 국민내일배움카드 발급 대상은 어떻게 되나요 ?
                </button>
            </h2>
            <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 누구나 신청 가능 
  단, 아래에 해당되는 사람은 발급 불가능
  현직 공무원, 사립학교 교직원, 졸업예정학년이 아닌 고등학교 재학생, 졸업까지의 수업연한이 2년을 초과하여
  남은 대학재학생, 연 매출 1억 5천만원 이상의 자영업자, 월 임금 300만원 이상인 대규모기업종사자(45세 미만),
  월평균 소득 300만원 이상인 특수형태근로종사자 등은 제외
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading3">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                    3. 국민내일배움카드 발급은 어떻게 하나요 ?
                </button>
            </h2>
            <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - HRD-Net 사이트에서 온라인 신청 또는 고용센터 방문 후 신청
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading4">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                    4. 수강신청 후 절차는 어떻게 되나요 ?
                </button>
            </h2>
            <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 방문상담 후 방문상담시 기재한 핸드폰 번호로 확정된 OT 문자 발송(※ 참석/불참 회신 필수)
  OT 때 학원 방문하여 사전시험, 면접, 설명회 진행 후 합격자에 한해서 교육 수강 가능(정원을 넘으면 안되기 때문)
  합격자는 OT 끝나면 결과 확인 후 HRD-Net 사이트에서 해당 교육과정 수강신청
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading5">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                    5. 훈련장려금은 무엇이며 지급 받을 수 있는 대상자는 어떻게되나요 ?
                </button>
            </h2>
            <div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 훈련장려금 교육기관에서 교통비, 식비 등 명목으로 제공되는 지원금입니다.
  단위기간에 출석률이 80%이상인 훈련생에게만 지급이 되며 각 교육 사업마다 장려금의 금액은 다릅니다.
  국기 : 200,000원(2023년 기준), KDT/산대특 : 316,000원, 대전형플러스일자리사업 : 490,000원
  ※ 국기, KDT/산대특, 대전형 플러스일자리사업은 모두 20일 기준
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading6">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                    6. 실업급여 수급중인 사람도 훈련장려금이 지급되나요 ?
                </button>
            </h2>
            <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 실업급여 수급중인 훈련생은 훈련장려금이 지급되지않음
  단, 교육 중 실업급여 종료시 종료일부터 일할계산하여 훈련장려금 지급
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading7">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
                    7. 훈련생 선발기준이 있나요 ?
                </button>
            </h2>
            <div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 국민내일배움카드 소지자
  교육과정 수강하는데에 제한이 없는 자
  IT쪽에 관심이 있는 자
  취업가능성이 있는 자
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading8">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse8" aria-expanded="false" aria-controls="collapse8">
                    8. 자비부담액 결제 시 훈련생 개인카드로 결제 가능한가요 ?
                </button>
            </h2>
            <div id="collapse8" class="accordion-collapse collapse" aria-labelledby="heading8"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 자비부담금은 무조건 국민내일배움카드로 결제 가능
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading9">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">
                    9. 교재는 지급 되나요 ?
                </button>
            </h2>
            <div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 교재 무료 제공
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading10">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse10" aria-expanded="false" aria-controls="collapse10">
                    10. 훈련과정에 사전지식이 없는 초보자도 수강이 가능한가요 ?
                </button>
            </h2>
            <div id="collapse10" class="accordion-collapse collapse" aria-labelledby="heading10"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 교육과정에 사전지식이 없는 초보자도 기초부터 체계적으로 수강하실 수 있는 과정입니다.
  교육 중 수준별 맞춤 지도도 해드리고 있습니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading11">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse11" aria-expanded="false" aria-controls="collapse11">
                    11. 취업지원은 어떻게 진행되나요 ?
                </button>
            </h2>
            <div id="collapse11" class="accordion-collapse collapse" aria-labelledby="heading11"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 취업지원팀이 별도로 구성되어 있으며, 취업하기 1달전 훈련생 개별면담을 진행하여
  개별 맞춤 취업 연계를 진행합니다.
  수료 후에도 사후지원을 진행하여 최고의 취업,사후지원을 해드립니다.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="heading12">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapse12" aria-expanded="false" aria-controls="collapse12">
                    12. 국민취업지원제도가 무엇인가요 ?
                </button>
            </h2>
            <div id="collapse12" class="accordion-collapse collapse" aria-labelledby="heading12"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    - 국민취업지원제도는 취업을 원하는 사람에게 취업지원서비스를 종합적으로 제공하고, 저소득 구직자에게는 생계를 위한
  최소한의 소득도 지우너하는 한국형 실업부조입니다. 참여 자격요건을 갖춘 사람에게 고용복지플러스센터에서 관련 취업지원서비스와
  수당을 지급합니다.
  1유형 : 500,000원 2유형 : 284,000원
                </div>
            </div>
        </div>
    </div>

</body>

</html>
