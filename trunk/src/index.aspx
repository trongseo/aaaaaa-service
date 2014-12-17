<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Src="~/UserControl/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/UserControl/UCLeft.ascx" TagPrefix="uc1" TagName="UCLeft" %>





<html>
<head>
<title>Công ty dệt vớ Thế Nguyễn | Cong ty det vo The Nguyen | Congtydetvethenguyen.com </title> 
      
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
			   <div class="img_title_product">SẢN PHẨM</div>
			   <div class="line_title_product">&nbsp;</div>
			</div>
			<P>Công ty TNHH Thế Anh Nguyễn là nơi tin cậy về chất lượng sản phẩm vớ.Uy tính lâu năm </P><br/>
	      
		    <table width="420" border="0" cellspacing="0" cellpadding="0">
               
                  <%
                      // Id, Title, Type, stt, image1, CreateDate, UpdateDate,
                        for (int i = 0; i < dtCodeList.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dtCodeList.Rows[i];
                            i++;
                            System.Data.DataRow dr1 = null;
                            if (i < dtCodeList.Rows.Count)
                            {
                               dr1 = dtCodeList.Rows[i];
                            }
                            
                            %>

                  <tr>			
                <td><table id="Product_" width="257" height="164" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<img src="images/pro_01.gif" width="4" height="4" alt=""></td>
						<td colspan="2" style="background-image:url(images/pro_bg_top.gif); background-repeat:repeat-x" width="244" height="4"></td>
						<td>
							<img src="images/pro_03.gif" width="9" height="4" alt=""></td>
					</tr>
					<tr>
						<td width="4" height="142" style="background-image:url(images/pro_bg_left.gif); background-repeat:repeat-y">&nbsp;</td>
						<td colspan="2" valign="top" width="244">
							<table width="244" border="0" cellspacing="0" cellpadding="0">
							  <tr>
								<td colspan="2" class="title_cat_product"><a  href="ViewDetail.aspx?CateId=<%=dr["ID"] %>" title=""><%=dr["Title"] %></a></td>
							  </tr>
							  <tr>
								<td width="49" valign="top"><a  href="ViewDetail.aspx?CateId=<%=dr["ID"] %>"  title=""><img  src="<%=imagePathRoot+dr["image1"].ToString() %>"  class="img_product" border="0" /></a></td>
								<td width="195" valign="top" class="content_product"><P><%--Giới thiệu--%> </P><br /><div class="detail"><img src="images/r1.gif"></img>&nbsp;<a  href="ViewDetail.aspx?CateId=<%=dr["ID"] %>">Chi ti&#7871;t..</a></div></td>
							  </tr>
						  </table>
						</td>
						<td style="background-image:url(images/pro_bg_right.gif); background-repeat:repeat-y;" width="9" height="142" >&nbsp;</td>
					</tr>
					<tr>
						<td>
							<img src="images/pro_07.gif" width="4" height="18" alt=""></td>
						<td style="background-image:url(images/pro_bg_bottom.gif); background-repeat:repeat-x;" width="236" height="18">
							</td>
						<td>
							<img src="images/pro_09.gif" width="8" height="18" alt=""></td>
						<td>
							<img src="images/pro_10.gif" width="9" height="18" alt=""></td>
					</tr>
				</table>
				</td>
					 			
                <td>
                    <%if (dr1 != null)
                      { 
                          %>
                      <table id="Table1" width="257" height="164" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<img src="images/pro_01.gif" width="4" height="4" alt=""></td>
						<td colspan="2" style="background-image:url(images/pro_bg_top.gif); background-repeat:repeat-x" width="244" height="4"></td>
						<td>
							<img src="images/pro_03.gif" width="9" height="4" alt=""></td>
					</tr>
					<tr>
						<td width="4" height="142" style="background-image:url(images/pro_bg_left.gif); background-repeat:repeat-y">&nbsp;</td>
						<td colspan="2" valign="top" width="244">
							<table width="244" border="0" cellspacing="0" cellpadding="0">
							  <tr>
								<td colspan="2" class="title_cat_product"><a  href="ViewDetail.aspx?CateId=<%=dr1["ID"] %>"  title=""><%=dr1["Title"] %></a></td>
							  </tr>
							  <tr>
								<td width="49" valign="top"><a  href="ViewDetail.aspx?CateId=<%=dr1["ID"] %>"  title=""><img  src="<%=imagePathRoot+dr1["image1"].ToString() %>"  class="img_product" border="0" /></a></td>
								<td width="195" valign="top" class="content_product"><br /><div class="detail"><img src="images/r1.gif"></img>&nbsp;<a  href="ViewDetail.aspx?CateId=<%=dr1["ID"] %>">Chi tiết..</a></div></td>
							  </tr>
						  </table>
						</td>
						<td style="background-image:url(images/pro_bg_right.gif); background-repeat:repeat-y;" width="9" height="142" >&nbsp;</td>
					</tr>
					<tr>
						<td>
							<img src="images/pro_07.gif" width="4" height="18" alt=""></td>
						<td style="background-image:url(images/pro_bg_bottom.gif); background-repeat:repeat-x;" width="236" height="18">
							</td>
						<td>
							<img src="images/pro_09.gif" width="8" height="18" alt=""></td>
						<td>
							<img src="images/pro_10.gif" width="9" height="18" alt=""></td>
					</tr>
				</table>
                    <%
                      } %>
                  
				</td>
					 			  </tr>
                 <tr valign="top">
				<td align="center" colspan="2">&nbsp;</td>
			 </tr>
	
		    <%
                        }
                         %>
          
			 
  
		
  
		    </table>
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
