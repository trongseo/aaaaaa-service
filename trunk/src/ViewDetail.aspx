<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDetail.aspx.cs" Inherits="ViewDetail" %>

<%@ Register Src="~/UserControl/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/UserControl/UCLeft.ascx" TagPrefix="uc1" TagName="UCLeft" %>





<html>
<head>
 <title> Vo, Quan Det Kim, Bang do, Quan nu </title>
      
    <!-- #include file="UserControl/hdtext.aspx" -->
    
    <link rel="stylesheet" href="css/main.css" type="text/css">
</head>


<BODY >
    <form  runat="server" id="form1" >

		
<div id="container">
    <uc1:Header runat="server" ID="Header" />
	<div id="body">
	   <div id="body_middle">	
           <uc1:UCLeft runat="server" ID="UCLeft" />
		  <div id="product_content">
		   <div id='wrapper'>
		<div id='Div1'></div>
		<div id='Div2'>
			<div id="bigPic">
				
				 <%
                             
                     int ixdddx = 0;
                    foreach (System.Data.DataRow item1 in dtImages.Rows)
                    { 
                    %>
               
                <img src="<%=imagePathRoot %><%=item1["IMAGE1"]%>" alt="" />

                    <%
                        ixdddx++;
                    }
                    
                     %>
			</div>
			
			
			<ul id="thumbs">
                 <%
                             
                     int ixx = 0;
                    foreach (System.Data.DataRow item1 in dtImages.Rows)
                    { 
                    %>
                 
                <li  rel='<%=ixx %>'><img src="<%=imagePathRoot %><%=item1["HINH_DAIDIEN_NHO"]%>" alt="" /></li>

                    <%
                        ixx++;
                    }
                    
                     %>

				<%--<li class='active' rel='1'><img src="imgs/1_thumb.jpg" alt="" /></li>
				<li rel='2'><img src="http://www.nitinh.com/static/SlideShow/imgs/3_thumb.jpg" alt="" /></li>
				<li rel='3'><img src="http://www.nitinh.com/static/SlideShow/imgs/4_thumb.jpg" alt="" /></li>
				<li rel='4'><img src="http://www.nitinh.com/static/SlideShow/imgs/5_thumb.jpg" alt="" /></li>
				<li rel='5'><img src="http://www.nitinh.com/static/SlideShow/imgs/6_thumb.jpg" alt="" /></li>--%>
			
			</ul>
		
		</div>
		<div class='clearfix'></div>
		<div id='push'></div>
	</div>
	
	

	<script type="text/javascript">
	    var currentImage;
	    var currentIndex = -1;
	    var interval;
	    function showImage(index) {
	        if (index < $('#bigPic img').length) {
	            var indexImage = $('#bigPic img')[index]
	            if (currentImage) {
	                if (currentImage != indexImage) {
	                    $(currentImage).css('z-index', 2);
	                    clearTimeout(myTimer);
	                    $(currentImage).fadeOut(250, function () {
	                        myTimer = setTimeout("showNext()", 3000);
	                        $(this).css({ 'display': 'none', 'z-index': 1 })
	                    });
	                }
	            }
	            $(indexImage).css({ 'display': 'block', 'opacity': 1 });
	            currentImage = indexImage;
	            currentIndex = index;
	            $('#thumbs li').removeClass('active');
	            $($('#thumbs li')[index]).addClass('active');
	        }
	    }

	    function showNext() {
	        var len = $('#bigPic img').length;
	        var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
	        showImage(next);
	    }

	    var myTimer;

	    $(document).ready(function () {
	        myTimer = setTimeout("showNext()", 3000);
	        showNext(); //loads first image
	        $('#thumbs li').bind('mouseenter', function (e) {
	            var count = $(this).attr('rel');
	            showImage(parseInt(count));
	           
	        });
	        

	    });


	</script>	
	<div style="text-align:right"><a href="#"><img src="images/gotop.gif" border="0" ></a><br />
</div>
   </div>		
	  </div>
	
	  
  </div>
	<uc1:Footer runat="server" ID="Footer1" />
</div>
        </form>
</body>
</html>
