<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title name="title">솔트코딩 gallery</title>
<meta name="description" content="스크래치 로봇 블록코딩 초등코딩 gallery">
<meta name="title" content="솔트코딩 gallery">

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

<div class="container-fluid p-3">
  <!-- <H1>갤러리</H1> -->
  <div class="card">
    <div class="card-body">
        <h2>갤러리</h2>
    </div>
  </div>

  <div class="bd-example bd-example-tabs">
    <ul class="nav nav-tabs" id="myTab" role="tablist" style="font-size: 15px;">
      <li class="nav-item" role="presentation">
        <!-- <a class="nav-link active" data-toggle="tab" href="#studyroom">공부방</a> -->
        <!-- <a class="nav-link active" data-toggle="tab" href="#qwe">QWE</a> -->
        <button class="nav-link active" id="studyroom-tab" data-toggle="tab" data-target="#studyroom" type="button" role="tab" aria-controls="studyroom" aria-selected="true">내부</button>
      </li>
      
      <!-- <li class="nav-item"> -->
        <!-- <a class="nav-link" data-toggle="tab" href="#standby">준비중</a> -->
        <!-- <button class="nav-link" id="standby-tab" data-toggle="tab" data-target="#standby" type="button" role="tab" aria-controls="standby" aria-selected="false">StandBy</button> -->
      <!-- </li> -->


      <!-- <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled">Disabled</a>
      </li> -->
    </ul>
  
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="studyroom" role="tabpanel" aria-labelledby="home-tab">
        
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>

          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="${pageContext.request.contextPath}/images/gallery/inside_com_c_1.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption d-none d-md-block">
                <!-- <h5>First slide label</h5> -->
                <!-- <p>Some representative placeholder content for the first slide.</p> -->
              </div>
            </div>
            <div class="carousel-item">
              <img src="${pageContext.request.contextPath}/images/gallery/inside_com_c_2.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption d-none d-md-block">
                <!-- <h5>Second slide label</h5> -->
                <!-- <p>Some representative placeholder content for the second slide.</p> -->
              </div>
            </div>
            <div class="carousel-item">
              <img src="${pageContext.request.contextPath}/images/gallery/inside_com_c_3.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption d-none d-md-block">
                <!-- <h5>Third slide label</h5> -->
                <!-- <p>Some representative placeholder content for the third slide.</p> -->
              </div>
            </div>

          </div>
          <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </button>
      </div>
      <!--     
        <div class="card">
            <div class="card-body">
                
                
  
            </div>
        </div>
        -->
  
      </div>

      <div class="tab-pane fade" id="standby" role="tabpanel" aria-labelledby="profile-tab">
        <p>StandBy...</p>
      </div>


      <!-- <div class="tab-pane fade" id="zxc">
        <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
      </div> -->
    </div>
  </div>
  
  
  


  
</div>
