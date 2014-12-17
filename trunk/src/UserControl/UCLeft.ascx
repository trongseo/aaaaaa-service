  
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCLeft.ascx.cs" Inherits="UserControl_UCLeft" %>
	
<div id="menu_left">
		  	 <div style="padding-left:17px">
				<table width="208" border="0" cellpadding="0" cellspacing="0">
				  <tr>
						<td width="69"><img src="images/menu_left_01.gif" width="69" height="42" alt=""></td>
						<td width="100px" style="background-image:url(images/menu_left_bg_top.gif); background-repeat:repeat-x">&nbsp;</td>
						<td width="71"><img src="images/menu_left_03.gif" width="71" height="42" alt=""></td>
					</tr>
					<tr>
						<td height="169" colspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <!--DWLayoutTable-->
						  <tr>
							<td width="10" style="background-image:url(images/menu_left_bg_left.gif); background-repeat:repeat-y">&nbsp;</td>
							<td  height="169px" valign="top">
							<table cellpadding="0" cellspacing="0" width="160px">


                               <%
                      // Id, Title, Type, stt, image1, CreateDate, UpdateDate,
                        for (int i = 0; i < dtCodeList.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dtCodeList.Rows[i];
                           
                            %>
                                <tr >
									<td height="17">
									 	<img src="images/white_plus.gif" align="absbottom" width="1px" height="1px" border="0" id="sanpham_1_img"><a href="ViewDetail.aspx?CateId=<%=dr["Id"] %>" class="left_button_down"  ><%=dr["Title"] %></a></td>
								</tr>
								<tr><td><img src="images/line_menu.gif" /></td></tr>	

                                <%
                                } 
                                    %>
                                
							 									
								
															
															
								
										
														 
				</table>
							</td>
							<td width="10" align="right" style="background-image:url(images/menu_left_bg_right.gif); background-repeat:repeat-y; background-position:right;">&nbsp;</td>
						  </tr>
						</table>		</td>
					</tr>
					<tr>
						<td><img src="images/menu_left_05.gif" width="69" height="42" alt=""></td>
						<td style="background-image:url(images/menu_left_bg_bottom.gif); background-repeat:repeat-x">&nbsp;</td>
						<td ><img src="images/menu_left_07.gif" width="71" height="42" alt=""></td>
					</tr>
		  	</table>
			</div>
		  </div>  