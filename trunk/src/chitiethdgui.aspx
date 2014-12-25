<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chitiethdgui.aspx.cs" Inherits="chitiethd" %>
<%@ Register TagPrefix="nbc" Namespace="NBarCodes.WebUI" Assembly="NBarCodes" %>



<table >
                                                            <thead>
                                                                <tr role="row" style="background-color:#337ab7;color:white">
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column ascending">TG</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">SP</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="">máy</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Sl*giá</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Ttiền</th>
                                                                    
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                
 <%
     float tongtien = 0;
                                              string odd = "odd";
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            System.Data.DataRow dr = dt.Rows[i];
                            if (i%2==1)
                            {
                                 odd = "even";
                            }
                            
                            %>
  <tr class="gradeA <%=odd%>">
                                                                    <td class="sorting_1"><%
                            string giop = ((DateTime)dr["ngay"]).ToString("ddMMyy-HHmm");
                            if (giop.IndexOf("0000")>-1)
                            {
                                %><%= ((DateTime)dr["ngay"]).ToString("ddMMyy")%>
                                                                        <%}else
                                                                            {
                                 %><%= ((DateTime)dr["ngay"]).ToString("HHmm-ddMMyy")%>
                                                                        <%
                                                                            }
                                                                                          %></td>
                                                                    <td class=" "><%= getSPorDV(dr["title"], dr["isdichvu"] )%></td>
                                                                   
                                                                    <td class="center "><%=dr["sttmay"]%></td>
                                                                    <td class="center "><%=dr["soluong"]%>*<%= SystemUti.formatNumber( dr["giathanh"])%></td>
                                                                     <td class="center "><%=SystemUti.formatNumber( dr["thanhtien"])%></td> 
                                                                   
                                                                </tr>
                                        

	
		    <%
                            tongtien = tongtien + float.Parse(dr["thanhtien"].ToString());
                        }
                         %>

                                                           
                                                               
                                                            </tbody>
                                                        </table>
------------------------------------------------------------------------<br />
Tổng tiền:<%= SystemUti.formatNumber( tongtien) %><br /><br />

                                                              
