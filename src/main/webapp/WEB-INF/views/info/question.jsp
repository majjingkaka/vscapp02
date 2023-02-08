<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    .blockquote{
        background-color: #fff;
        border-left: .7rem solid #fff;
        margin: 0em 0rem;
        padding: .5em .7rem;
    }
    .card-header{
        /* background-color: #20c997; */
        background-color: #fff;
        border-bottom: 1px solid rgba(0,0,0,.125);
        padding: .75rem 1.25rem;
        position: relative;
        border-top-left-radius: .25rem;
        border-top-right-radius: .25rem;
    }
</style>

<!-- <h1>question</h1> -->
<div class="container-fluid p-3">
    
    <div class="card">
        <div class="card-body">
            <h2>FAQ</h2>
        </div>
      </div>

      <div class="accordion" id="accordionExample">
        <div class="card">
          <div class="card-header" id="headingOne">
            <h2 class="mb-0">
              <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                1. 코딩수업은 어떤 과목이 있나요?
              </button>
            </h2>
          </div>
          <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
            <div class="card-body">
              현재 스크래치와 로봇프로그램을 다루고있으며 추후 코딩관련 과목이 추가될 예정입니다.<br>
              [교육안내] 메뉴를 참고해주세요.
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="headingTwo">
            <h2 class="mb-0">
              <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                2. 수업시간은 언제인가요?
              </button>
            </h2>
          </div>
          <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
            <div class="card-body">
              초등학생은 하교 후 14시부터 진행될 예정이며, 모집상황에 따라 시간이 변동될 수 있습니다.
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="headingThree">
            <h2 class="mb-0">
              <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                3. 개인사유로 수업에 빠졌을때 보강이 이루어지나요?
              </button>
            </h2>
          </div>
          <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
            <div class="card-body">
              수업에 미참석한 학생과 적당한 시간을 정해 보강이 진행 될 예정입니다.
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="headingFour">
            <h2 class="mb-0">
              <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                4. 추가 교재비가 있나요?
              </button>
            </h2>
          </div>
          <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
            <div class="card-body">
              교육용 노트북과 차수에 따른 학습지가 제공되어 추가로 발생되는 교재비는 없습니다.
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="headingFive">
            <h2 class="mb-0">
              <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                5. 수업료 결재 방식은 어떻게 하나요?
              </button>
            </h2>
          </div>
          <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
            <div class="card-body">
              비대면 간편결제방법인 결재선생을 통해 모바일로 카톡또는 문자로 발송하여 이루어지게됩니다.<br>
              <!-- 결제하기위해 학생편으로 절달받지 않고, 부모님들의 발걸음 수고를 고려한 편리한 결재방식입니다. -->
            </div>
          </div>
        </div>


      </div>
<!--       
      <div class="card">
        <div class="card-header">
          Quote
        </div>
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <p>A well-known quote, contained in a blockquote element.</p>
            <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
          </blockquote>
        </div>
      </div>

      <div class="card">
        <div class="card-header">
          Quote
        </div>
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <p>A well-known quote, contained in a blockquote element.</p>
            <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
          </blockquote>
        </div>
      </div>

      <div class="card">
        <div class="card-header">
          Quote
        </div>
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <p>A well-known quote, contained in a blockquote element.</p>
            <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
          </blockquote>
        </div>
      </div> -->


</div>


