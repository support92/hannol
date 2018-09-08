<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.hide-bullets {
	list-style:none;
	margin-top:15px;
}
</style>

<script>
jQuery(document).ready(function($) {
	$('#myCarousel').carousel('pause');
		
	$('[id^=carousel-selector-]').click( function(){
		var id = this.id.substr(this.id.lastIndexOf("-") + 1);
		var id = parseInt(id);
		$('#myCarousel').carousel(id);
	});

});

</script>
  <div id="main_area">
    <!-- Slider -->
    <div class="row">
      <div class="col-xs-12" id="slider">
        <!-- Top part of the slider -->
        <div class="row">
          <div class="col-sm-8" id="carousel-bounding-box">
            <div class="carousel slide" id="myCarousel" data-interval="false">
              <!-- Carousel items -->
              <div class="carousel-inner">
                <div class="active item" data-slide-number="0">
                  <img src="http://placehold.it/770x300&text=one">
                </div>

                <div class="item" data-slide-number="1">
                  <img src="http://placehold.it/770x300&text=two">
                </div>

                <div class="item" data-slide-number="2">
                  <img src="http://placehold.it/770x300&text=three">
                </div>

                <div class="item" data-slide-number="3">
                  <img src="http://placehold.it/770x300&text=four">
                </div>

              </div>
            
              <!-- Carousel nav -->
              <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
              </a>
              <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
              </a>
            </div>
          </div>

          <div class="col-sm-4" id="carousel-text">
          	<div>미니언즈 팝콘통</div>
          	<div>개수 : </div>
          	<div>
          		<button type="button" class="btn btn-default">장바구니</button>
          		<button type="button" class="btn btn-danger">구매하기</button>
          	</div>
          </div>

          <div id="slide-content" style="display: none;">
            <div id="slide-content-0">
              <h2>Slider One</h2>
              <p>Lorem Ipsum Dolor</p>
              <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
            </div>

            <div id="slide-content-1">
              <h2>Slider Two</h2>
              <p>Lorem Ipsum Dolor</p>
              <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
            </div>

            <div id="slide-content-2">
              <h2>Slider Three</h2>
              <p>Lorem Ipsum Dolor</p>
              <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
            </div>

            <div id="slide-content-3">
              <h2>Slider Four</h2>
              <p>Lorem Ipsum Dolor</p>
              <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
            </div>

            <div id="slide-content-4">
              <h2>Slider Five</h2>
              <p>Lorem Ipsum Dolor</p>
              <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
            </div>

            <div id="slide-content-5">
              <h2>Slider Six</h2>
              <p>Lorem Ipsum Dolor</p>
              <p class="sub-text">October 24 2014 - <a href="#">Read more</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/Slider-->

    <div class="row hidden-xs" id="slider-thumbs">
      <!-- Bottom switcher of slider -->
      <ul class="hide-bullets">
        <li class="col-sm-2">
          <a class="thumbnail" id="carousel-selector-0"><img src="http://placehold.it/170x100&text=one"></a>
        </li>

        <li class="col-sm-2">
          <a class="thumbnail" id="carousel-selector-1"><img src="http://placehold.it/170x100&text=two"></a>
        </li>

        <li class="col-sm-2">
          <a class="thumbnail" id="carousel-selector-2"><img src="http://placehold.it/170x100&text=three"></a>
        </li>

        <li class="col-sm-2">
          <a class="thumbnail" id="carousel-selector-3"><img src="http://placehold.it/170x100&text=four"></a>
        </li>
      </ul>
    </div>
  </div>
  
  <div>
  	상세내용
  </div>
