﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="donhangllist.aspx.cs" Inherits="donhangllist" %>

<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                                            <thead>
                                                                <tr role="row" style="background-color:#337ab7;color:white">
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column ascending" style="width: 179px;">Ngày giờ</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 245px;">Mặt hàng</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 225px;">STT máy</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">Số lượng*đơn giá</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 112px;">Thành tiền</th>
                                                               <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 112px;">Mã đơn hàng</th>    
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                
 <%
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
                                %><%= ((DateTime)dr["ngay"]).ToString("dd-MM-yyyy")%>
                                                                        <%}else
                                                                            {
                                 %><%= ((DateTime)dr["ngay"]).ToString("HH:mm dd-MM-yyyy")%>
                                                                        <%
                                                                            }
                                                                                          %></td>
                                                                    <td class=" "><%= getSPorDV(dr["title"], dr["isdichvu"] )%></td>
                                                                   
                                                                    <td class="center "><%=dr["sttmay"]%></td>
                                                                    <td class="center "><%=dr["soluong"]%>*<%= SystemUti.formatNumber( dr["giathanh"])%></td>
                                                                     <td class="center "><%=SystemUti.formatNumber( dr["thanhtien"])%></td> 
                                                                   <td class="center "><%= getMadonhang( dr["adonhang_guid_id"] )%></td> 
                                                                </tr>
                                        

	
		    <%
                        }
                         %>

                                                           
                                                               
                                                            </tbody>
                                                        </table>
                                                                <script>
                                                                    function XoaSP(guididsp)
                                                                    {
                                                                       // alert(guididsp);
                                                                        $.ajax({
                                                                            url: 'ajax.aspx?from=deletesp&r=' + Math.random(),
                                                                            type: 'POST',
                                                                            cache: false,
                                                                            data: 'guididsp=' + guididsp ,
                                                                            dataType: 'json',
                                                                            error: function (error) {
                                                                                //alert('Server validation failed due to: ' + error.statusText);
                                                                                alert('javascript:Server failed');

                                                                            },
                                                                            success: function (response) {

                                                                                loadGrid();
                                                                            }
                                                                        });

                                                                    }
                                                                </script>