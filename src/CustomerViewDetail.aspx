<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerViewDetail.aspx.cs" Inherits="CustomerViewDetail" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc1" %>

<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc2" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><%=item["TEN_QUAN"]%>|<%= myUti.vie2eng( item["TEN_QUAN"])%> Wew.vn</title>
     
    <!-- #include file="UserControl/hdtext.aspx" -->
  <style>
      body
      {
          margin: 0px;
      }
      #body h3
      {
         
    background-color: #FFFFFF;
    color: #444444;
    display: inline-block;
    font-size: 18px;
    font-weight: normal;
    line-height: 1em;
 

      }
     #nav {
     width: 80%;
    background: none repeat scroll 0 0 #FFFFFF;
    height: 20px;
     padding-left:15px;
    /*height: 30px;
    margin-top: 180px;
    position: fixed;
    top: 0;
  
    padding-left:15px;*/
}

      .title
      {
          color: #EDEDED;
          font-family: verdana;
          font-size: 25px;
          width: 350px;
          margin-top: 6px;
          margin-left: 150px;
          font-weight: bold;
          float: left;
      }

      .subtitle
      {
          color: #EDEDED;
          font-family: verdana;
          font-size: 15px;
      }

      #navigation
      {
          list-style-type: none;
          padding:10px 0px 0px 10px; background-color: #31A6EB;
    box-shadow: 0 1px 50px #E8E8E8;
    height:30px;
      }

      #navigation li
      {
          display: inline;
          padding: 10px;
            font-family: verdana;
       
        
      }
        #navigation li:hover
          {
              color: #000;
             text-decoration:dotted;
             font-size:17px;
          }
      #nav a
      {
          
          color: #FFF;
      }

          

      #body
      {
          width: 75%;
         padding-left:20px;
          margin-top: 30px;
          font-family: verdana;
      }
      .contentview
      {
            padding-left:20px;
            padding-top:5px;
      }
      hr
      {
          border: 1px solid #262626;
      }
      #main {
   margin:5px 0;
}
      .linedot
      {
          border-bottom:1px solid #DDDDDD;
          height:40px;
      }
      .btnorder
      {
        
    background-color: #339900;
    border: 1px solid #336600;
    border-radius: 2px;
    color: #FFFFFF;
    font-size: 16px;
    font-weight: bold;
    /*padding: 5px 10px;*/
    text-transform: uppercase;

      }
  </style>

        <link rel="stylesheet" href="js/colorbox.css" />
		
		<script src="js/jquery.colorbox.js"></script>
         <script>
             $(document).ready(function () {
                 //Examples of how to assign the Colorbox event to elements
                 //                $(".group1").colorbox({ rel: 'group1' });
                 //                $(".group2").colorbox({ rel: 'group2', transition: "fade" });
                 $(".group3").colorbox({ rel: 'group3', transition: "none", width: "75%", height: "75%" });
                 //                $(".group4").colorbox({ rel: 'group4', slideshow: true });
                 //                $(".ajax").colorbox();
                 //                $(".youtube").colorbox({ iframe: true, innerWidth: 640, innerHeight: 390 });
                 //                $(".vimeo").colorbox({ iframe: true, innerWidth: 500, innerHeight: 409 });
                 //                $(".iframe").colorbox({ iframe: true, width: "80%", height: "80%" });
                 //                $(".inline").colorbox({ inline: true, width: "50%" });
                 //                $(".callbacks").colorbox({
                 //                    onOpen: function () { alert('onOpen: colorbox is about to open'); },
                 //                    onLoad: function () { alert('onLoad: colorbox has started to load the targeted content'); },
                 //                    onComplete: function () { alert('onComplete: colorbox has displayed the loaded content'); },
                 //                    onCleanup: function () { alert('onCleanup: colorbox has begun the close process'); },
                 //                    onClosed: function () { alert('onClosed: colorbox has completely closed'); }
                 //                });

                 //                $('.non-retina').colorbox({ rel: 'group5', transition: 'none' })
                 //                $('.retina').colorbox({ rel: 'group5', transition: 'none', retinaImage: true, retinaUrl: true });

                 //                //Example of preserving a JavaScript event for inline calls.
                 //                $("#click").click(function () {
                 //                    $('#click').css({ "background-color": "#f00", "color": "#fff", "cursor": "inherit" }).text("Open this window again and this message will still be here.");
                 //                    return false;
                 //                });
             });
		</script>
     <link rel="stylesheet" href="js/themes/base/jquery.ui.all.css">
   
	<script src="js/ui/jquery.ui.core.js"></script>
	<script src="js/ui/jquery.ui.widget.js"></script>
	<script src="js/ui/jquery.ui.mouse.js"></script>
	<script src="js/ui/jquery.ui.draggable.js"></script>
	<script src="js/ui/jquery.ui.position.js"></script>
	<script src="js/ui/jquery.ui.resizable.js"></script>
	<script src="js/ui/jquery.ui.button.js"></script>
	<script src="js/ui/jquery.ui.dialog.js"></script>
    <script>



        function OpenWindow(myid) {

                                     


            $("#dialog-modal").dialog({
                autoOpen: false,
                width: 820,
                modal: true,
                open: function (ev, ui) {
                    $('#myIframe').attr('src', 'RegistRemote.aspx?SERVICE_TYPE=<%=item["SERVICE_TYPE"]%>&SERVICE_ID=<%=item["SERVICE_ID"]%>');
                }
            });
                var dialog1 = $("#dialog-modal").dialog({ autoOpen: false });
                $('#dialog-modal').dialog('open');

            }
            function closeDialog() {
                jQuery('#dialog-modal').dialog('close');
            }
                                  
                              

	</script>
</head>
<body>
    <div id='dialog-modal' style='z-index:19999;display:none' >  
 <iframe id="myIframe" src="" scrolling='no' style="margin: 0; padding: 0; border: none; width: 800px;
            height: 450px;"></iframe><%--<br />--%>
           <%-- <input type="button" value='Đóng' class='a_giohang1' onclick='closeDialog()' />--%>
</div>
      <form id="form1" runat="server">
         <uc2:Header ID="Header1" runat="server" />
     <div id="main">
           
        <p style="color: #777777; margin-left:16px"> <a href="http://www.wew.vn"> map.Wew.vn</a> &raquo; 
            <a href="javascript:$('#css3menu1 > li > #mymenu<%=item["SERVICE_TYPE"] %>').click() ;"> <%=loairap %> </a> &raquo; <%=item["ten_quan"] %></p>
       <div id="nav" style="position: fixed; top: 10px;"><ul id="navigation">	<li><a href="#myDesc">Mô tả</a></li>	<li><a href="#myImages">Hình ảnh</a></li>	<li><a href="#myMap">Bản đồ</a></li>	<li><a href="#myMap">Liên hệ</a></li>	<li> <input type="button" value='Đặt phòng' class='btnorder' onclick='OpenWindow("<%=item["ID"]%>")' /></li></ul></div>
         <div id="body">	
           <div class="linedot">  <h3>Mô tả</h3>	<a name="myDesc" id="myDesc" /></div>
                <div class="contentview">	
                    
                    <img  alt="<%=item["ten_quan"] %>" src='<%=imagePathRoot %><%=item["HINH_DAIDIEN"]%>'  style="max-width:500px" />
                <%=item["MO_TA_FULL"] %>   


                </div>
             <div class="linedot"> <h3>Hình ảnh</h3>	 <a name="myImages" id="myImages" /> </div>
                <div class="contentview">	
                     <a class="group3" href="<%=imagePathRoot %><%=item["HINH_DAIDIEN"]%>" title="hinh dai dien">  <img  alt="<%=item["ten_quan"] %>" src='<%=imagePathRoot %><%=item["HINH_DAIDIEN"]%>'  style="max-width:50px" />

 </a>
                        <%
                             
                    
                    foreach (System.Data.DataRow item1 in dtImages.Rows)
                    { 
                    %>
                  <a class="group3" href="<%=imagePathRoot %><%=item1["IMAGE1"]%>" title="<%=item1["MOTA"]%>"><img style='width:50px;height:50px'  src='<%=imagePathRoot %><%=item1["HINH_DAIDIEN_NHO"]%>' /> </a>
                    <%
                    }
                    
                     %></div>
          <div class="linedot">      <a name="myMap" id="myMap" />
             <h3>Bản đồ</h3>	</div>
                <div class="contentview">
                    	 <link href="https://developers.google.com/maps/documentation/javascript/examples/default.css"
        rel="stylesheet" />
  
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
     <script>
         function initialize() {
             var myLatlng = new google.maps.LatLng(<%=latint %>, <%=longint %>);
             var mapOptions = {
                 zoom: 13,
                 center: myLatlng,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };

             var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

             var contentString = "<div style='min-width:400px'><img style='padding-right: 5px'  align='left' src='<%=imagePathRoot %><%=item["HINH_DAIDIEN"]%>' width='100' height='100' /><p style='text-align: left; margin-left: 10px'><strong><%=item["TEN_QUAN"]%></strong><br />Address: <%=item["ADDRESS"]%><br />Tel: <%=item["DIEN_THOAI"]%>     <br />Email: <a href='<%=item["email"]%>'><%=item["email"]%> </a></p></div>";

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
       
             google.maps.event.addListener(marker, 'click', function(ev){
                 infowindow.open(map, marker);
             });
         }

         google.maps.event.addDomListener(window, 'load', initialize);

    </script>

               <div id="map-canvas" style="width: 100%; height: 500px; border: medium solid; position: relative; background-color: rgb(229, 227, 223);"></div>
             
             </div>
        <div style="clear:both; height:25px;"></div>
        
    </div><!--------end main---->

        <uc1:Footer ID="Footer1" runat="server" />
    </form>
 <script>

     $('#navigation >li > a').click(function () {
         $('html, body').animate({
             scrollTop: $($(this).attr('href')).offset().top-95
         }, 500);
         return false;
     });
     function fixDiv() {
         var $cache = $('#nav');
         if ($(window).scrollTop() > 200)
             $cache.css({ 'position': 'fixed', 'top': '0px' });
         else
             $cache.css({ 'position': 'relative', 'top': 'auto' });
     }
     $(window).scroll(fixDiv);
     fixDiv();
    </script>
</body></html>
