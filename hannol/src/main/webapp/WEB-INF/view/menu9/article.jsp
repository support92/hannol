<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.giftLeftLayout{
	width: 50%;
}

.giftRightLayout{
	width: 50%;
}

#carousel-custom {
    margin: 15px auto;
    width: 100%;
}
#carousel-custom .carousel-indicators {
    margin: 10px 0 0;
    overflow: auto;
    position: static;
    text-align: left;
    white-space: nowrap;
    width: 100%;
}
#carousel-custom .carousel-indicators li {
    background-color: transparent;
    -webkit-border-radius: 0;
    border-radius: 0;
    display: inline-block;
    height: auto;
    margin: 0 !important;
    width: auto;
}
#carousel-custom .carousel-indicators li img {
    display: block;
    opacity: 0.5;
}
#carousel-custom .carousel-indicators li.active img {
    opacity: 1;
}
#carousel-custom .carousel-indicators li:hover img {
    opacity: 0.75;
}
#carousel-custom .carousel-outer {
    position: relative;
}

.item > img{
	width : 100%;
}

@media (max-width: 767px) and (min-width: 320px){
	content:''; display:block; clear:both;
}

</style>

<div class="giftLeftLayout">
	<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
    <div class='carousel-outer'>
        <!-- Wrapper for slides -->
        <div class='carousel-inner'>
            <div class='item active'>
                <img src='http://placehold.it/400x200&text=slide1' alt='' />
            </div>
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide2' alt='' />
            </div>
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide3' alt='' />
            </div>
                
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide4' alt='' />
            </div>
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide5' alt='' />
            </div>
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide6' alt='' />
            </div>
            
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide7' alt='' />
            </div>
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide8' alt='' />
            </div>
            <div class='item'>
                <img src='http://placehold.it/400x200&text=slide9' alt='' />
            </div>
        </div>
            
        <!-- Controls -->
        <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
            <span class='glyphicon glyphicon-chevron-left'></span>
        </a>
        <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
            <span class='glyphicon glyphicon-chevron-right'></span>
        </a>
    </div>
    
    <!-- Indicators -->
    <ol class='carousel-indicators mCustomScrollbar'>
        <li data-target='#carousel-custom' data-slide-to='0' class='active'><img src='http://placehold.it/100x50&text=slide1' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='1'><img src='http://placehold.it/100x50&text=slide2' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='2'><img src='http://placehold.it/100x50&text=slide3' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='3'><img src='http://placehold.it/100x50&text=slide4' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='4'><img src='http://placehold.it/100x50&text=slide5' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='5'><img src='http://placehold.it/100x50&text=slide6' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='6'><img src='http://placehold.it/100x50&text=slide7' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='7'><img src='http://placehold.it/100x50&text=slide8' alt='' /></li>
        <li data-target='#carousel-custom' data-slide-to='8'><img src='http://placehold.it/100x50&text=slide9' alt='' /></li>
    </ol>
</div>
</div>
<div class="giftRightLayout"></div>



