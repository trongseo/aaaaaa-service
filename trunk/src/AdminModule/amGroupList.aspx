<%@ Page Language="C#" AutoEventWireup="true" CodeFile="amGroupList.aspx.cs" Inherits="AdminModule_amGroupList" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
 <!--#include file="htext.aspx"-->
</head>
<body>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <!--#include file="htopmenu.aspx"-->
  <tr> 
    <td width="18%" valign="top"  class='lineR' >
     <!--#include file="hleftmenu.aspx"-->

    </td>
    <td width="82%" valign="top" style="padding-left:5px">  <form id="form1" runat="server">
    <div>
         <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td width="100%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>&nbsp;Nhóm</b></td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td height="10">
                        </td>
                        <td height="10" nowrap>
                            <a href="amGroupList.aspx?add=1">Thêm nhóm mới</a></td>
                        <td height="10">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="greenboxmain" >
        <tr>
            <td>
            <div style="display:none">
                <asp:FileUpload ID="FileUpload1" runat="server" Visible="true" />
               </div> 
                 <table  cellspacing="0" border="1"  class="grid" width="90%">
		<tr class="gridheader">
			<th style="width: 1px;" scope="col"> </th><th scope="col">
                Tên</th><th scope="col" style="">
                Hình</th><th scope="col">Thứ tự</th>
		</tr>
		   <%
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dt.Rows[i];
                            %>
		<tr class="gridrow">
			<td align="center">
                                <input type="checkbox" name="checkbox_<%=dr["Id"]%>" id="checkbox_<%=dr["Id"]%>"/>
                                
                            </td><td>
                           
                           
                             <input type="text" id="title_<%=dr["Id"]%>" value="<%=dr["title"]%>" name="title_<%=dr["Id"]%>"/></td>
                             <td  >
                           <img src="../ImageT.ashx?width=100&height=0&file=<%=dr["image1"]%>" /> <br />
                           <input type="file" name="file_<%=dr["Id"]%>" id="file_<%=dr["Id"]%>"   />  
                            </td>
                             <td>
                            <input type="text" id="stt_<%=dr["Id"]%>" value="<%=dr["stt"]%>" name="stt_<%=dr["Id"]%>"/>
                            </td>
		</tr>
		    <%
                        }
                         %>
		
		
	</table>
               
                </td>
        </tr>
        <tr>
            <td class="whiteline" style="height:5px"></td>
        </tr>
        <tr>
            <td class="gridheader"><%=quesryxx_%></td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="0" border="0" style="border-collapse: collapse;table-layout:fixed;margin-left:5px">
                    <tr>
                        <td style="width: 335px">
                            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Xóa" Width="66px" OnClick="btn_Delete_Click" /></td>
                        <td align="left">
                            <asp:Button ID="Button2" runat="server" CssClass="button" Text="Cập nhật tất cả"
                                Width="165px" OnClick="Button2_Click" /></td>
                    </tr>
                </table>
                <table style="width: 719px">
                    <tr>
                        <td colspan="3">
                        </td>
                    </tr>
                    
                </table>
           </td>
        </tr>
    </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
    </td>
  </tr>
     <!--#include file="hfooter.aspx"-->
</table>
</body>
</html>

