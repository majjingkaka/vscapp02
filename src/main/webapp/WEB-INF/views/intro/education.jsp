<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
  .blockquote{
      background-color: #fff;
      border-left: .7rem solid #fff;
      margin: 1.5em .7rem;
      padding: .5em .7rem;
  }

  .bd-example-tabs .nav-tabs {
        margin-bottom: 1rem;
  }

</style>

<!-- <h1>education</h1> -->
<div class="container-fluid p-3">
  <div class="card">
    <div class="card-body">
        <h2>교육안내</h2>
    </div>
  </div>

  <div class="bd-example bd-example-tabs">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="studyroom-tab" data-toggle="tab" data-target="#studyroom" type="button" role="tab" aria-controls="studyroom" aria-selected="true">스크래치와 언플러그드</button>
      </li>
      <li class="nav-item">
        <button class="nav-link" id="standby-tab" data-toggle="tab" data-target="#standby" type="button" role="tab" aria-controls="standby" aria-selected="false">로봇과 프로그램</button>
      </li>
    </ul>
  
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="studyroom" role="tabpanel" aria-labelledby="home-tab">
        <!-- studyroom... -->
        <div class="card">
          <div class="card-body">
              <h2>스크래치와 언플러그드</h2>

              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td style="width: 10%;">과목명</td>
                    <td style="width: 90%;">스크래치와 언플러그드 </td>
                  </tr>
                  <tr>
                    <td>설명</td>
                    <td>책검토중...</td>
                  </tr>
                  <tr>
                    <td>수업기간</td>
                    <td>3개월</td>
                  </tr>
                  <tr>
                    <td>수업료(월)</td>
                    <td></td>
                  </tr>
                </tbody>
              </table>

          </div>
        </div>
      </div>

      <div class="tab-pane fade" id="standby" role="tabpanel" aria-labelledby="profile-tab">
        <!-- <p>StandBy...</p> -->

        <div class="card">
          <div class="card-body">
              <h2>로봇과 프로그램</h2>

              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td style="width: 10%;">과목명</td>
                    <td style="width: 90%;">로봇과 프로그램 [1 level(초급과정) - 전기, 전자의 원리의 기초를 배우는 과정] </td>
                  </tr>
                  <tr>
                    <td>설명</td>
                    <td>처음으로 배우는 로봇으로 기초적인 조립과 전기, 전자의 원리, 구조의 원리 등을 이해하는 과정입니다.<br>로봇의 조립 이외에도 프로그램을 이용하여 자신이 만든 로봇의 동작을 직접 프로그래밍 할 수 있습니다.</td>
                  </tr>
                  <tr>
                    <td>수업기간</td>
                    <td>3개월</td>
                  </tr>
                  <tr>
                    <td>수업료(월)</td>
                    <td>96,000원</td>
                  </tr>
                </tbody>
              </table>

              <br>

              <div class="card-deck">
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_2.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">1차시</h5>
                    <p class="card-text">EasyBot+로봇교구설명</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_3.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">2차시</h5>
                    <p class="card-text">HouseBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_4.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">3차시</h5>
                    <p class="card-text">HelicopterBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_5.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">4차시</h5>
                    <p class="card-text">RaceBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
              </div>

              <br>

              <div class="card-deck">
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_6.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">5차시</h5>
                    <p class="card-text">RabbitBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_12.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">6차시</h5>
                    <p class="card-text">FutureBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_9.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">7차시</h5>
                    <p class="card-text">DeliveryBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_8.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">8차시</h5>
                    <p class="card-text">HittingBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                
              </div>
              
              <br>
              
              <div class="card-deck">
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_7.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">9차시</h5>
                    <p class="card-text">ControlBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>

                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_10.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">10차시</h5>
                    <p class="card-text">SensingBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_11.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">11차시</h5>
                    <p class="card-text">SnailBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                <div class="card">
                  <img src="${pageContext.request.contextPath}/images/robot/curri_robokit1_thum_12.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">12차시</h5>
                    <p class="card-text">BattleBot</p>
                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  </div>
                </div>
                
              </div>

              <!-- <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                  <p class="card-text">1차시<br>EasyBot+로봇교구설명</p>
                </div>
              </div> -->








          </div>
        </div>




      </div>
    </div>
  </div>


</div>

