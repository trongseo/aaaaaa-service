<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LienHe.aspx.cs" Inherits="LienHe" %>

<%@ Register Src="~/UserControl/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/UserControl/UCLeft.ascx" TagPrefix="uc1" TagName="UCLeft" %>





<html>
<head>
 <title> Lien he </title>
      
    <!-- #include file="UserControl/hdtext.aspx" -->
    
</head>


<BODY >
    <form  runat="server" id="form1" >

		
<div id="container">
    <uc1:Header runat="server" ID="Header" />
	<div id="body">
	   <div id="body_middle">	
           <uc1:UCLeft runat="server" ID="UCLeft" />
		  <div id="product_content">
		    <div id="product_content_top">
			   <div class="img_title_product">Liên hệ</div>
			   <div class="line_title_product">&nbsp;</div>
			</div>
			<P> </P><br></br>
	      
		 <link href="https://developers.google.com/maps/documentation/javascript/examples/default.css"
        rel="stylesheet" />
  
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
     <script>
         function initialize() {
             var myLatlng = new google.maps.LatLng(10.837568459360224, 106.63834822621459);
             var mapOptions = {
                 zoom: 15,
                 center: myLatlng,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };

             var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

             var contentString = "<div style='min-width:400px'><img style='padding-right: 5px'  align='left' src='images/company.png' width='100' height='100' /><p style='text-align: left; margin-left: 10px'><strong>CTY TNHH MTV THẾ ANH NGUYỄN</strong><br />Address: 60/24C Phan Huy Ích, P.12, Gò Vấp, HCM <br />Tel: 0918-758-757   <br />Email:the20081976@icloud.com </p></div>";

             var infowindow = new google.maps.InfoWindow({
                 content: contentString
             });

             var marker = new google.maps.Marker({
                 position: myLatlng,
                 map: map,
                 title: 'Uluru (Ayers Rock)'
             });

             infowindow.open(map, marker);
             //map.openInfoWindowHtml(map.getCenter(), ");

             google.maps.event.addListener(marker, 'click', function (ev) {
                 infowindow.open(map, marker);
             });
         }

         google.maps.event.addDomListener(window, 'load', initialize);

    </script>
              <strong>CTY TNHH MTV THẾ ANH NGUYỄN</strong> <br />
              Địa chỉ:60/24C Phan Huy Ích, P.12, Gò Vấp, HCM <br />
              MST:0312319095<br />
              Số điện thoại:0918-758-757<br />
              Email:the20081976@icloud.com<br />

               <div id="map-canvas" style="width: 100%; height: 500px; border: medium solid; position: relative; background-color: rgb(229, 227, 223);"></div>
             
             </div>
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
