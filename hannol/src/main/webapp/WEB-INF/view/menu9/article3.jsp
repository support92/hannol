<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.itemcontainer {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

.row.itemslider{
	margin : 0px;
	position: relative;
}

.btnBefore, .btnNext{
	margin: 15px 0px;
}

.btnNext{
	right: 0;
}
</style>


<div class="itemcontainer">
  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide1" style="width:100%">
  </div>

  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide2" style="width:100%">
  </div>

  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide3" style="width:100%">
  </div>
    
  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide4" style="width:100%">
  </div>

  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide5" style="width:100%">
  </div>
    
  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide6" style="width:100%">
  </div>
  
  <div class="mySlides">
    <img src="http://placehold.it/400x200&text=slide7" style="width:100%">
  </div>
  
  <div class="row itemslider">
  <button type="button" style="float:left;" onclick="nextImg('-')" class="btn btn-default btnBefore">＜ </button>
    <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide1" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
    </div>
    <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide2" style="width:100%" onclick="currentSlide(2)" alt="Cinque Terre">
    </div>
    <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide3" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
    </div>
    <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide4" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
    </div>
    <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide5" style="width:100%" onclick="currentSlide(5)" alt="Nature and sunrise">
    </div>    
    <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide6" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
    </div>
     <div class="column">
      <img class="demo cursor" src="http://placehold.it/400x200&text=slide7" style="width:100%" onclick="currentSlide(7)" alt="Snowy Mountains">
    </div>
    <button type="button" class="btn btn-default btnNext" onclick="nextImg('+')">＞ </button>
  </div>
</div>

<script>
var slideIndex = 1;
var start = 0;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}

$(function(){
	imgdisplay(start);
});

function nextImg(data){
	var dots = document.getElementsByClassName("demo");
	var itemCount = Math.floor((dots.length)/5) ;
	
	if(data == '+'){
		start = start+1;
		if(itemCount < start){
			start = itemCount;
		}
	}else if(data == '-'){
		start = start-1;
		if(start < 0){
			start = 0;
		}
	}
	
	imgdisplay(start);
}

function imgdisplay(index){
	var dots = document.getElementsByClassName("demo");
	console.log(index);
	
	for(i = 0; i < dots.length; i++){
		dots[i].style.display = "none";
		var endPoint = (index+1)*5;
		if(endPoint > dots.length){
			endPoint = dots.length;
		}
		for(j=index*5; j<endPoint; j++){
			dots[j].style.display = "";
			
		}
	}
}
</script>



