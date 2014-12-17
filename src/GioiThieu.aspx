<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GioiThieu.aspx.cs" Inherits="GioiThieu" %>

<%@ Register Src="~/UserControl/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/UserControl/UCLeft.ascx" TagPrefix="uc1" TagName="UCLeft" %>





<html>
<head>
 <title> Gioi thieu </title>
      
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
			   <div class="img_title_product">Giới thiệu</div>
			   <div class="line_title_product">&nbsp;</div>
			</div>
			<P> </P><br />
	      
		 
  <%=descriptView  %>

              
             
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
