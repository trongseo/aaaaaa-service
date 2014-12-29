<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dieukhienthietbi.aspx.cs" Inherits="dieukhienthietbi" %>

<%@ Register src="UCLeftAdmin.ascx" tagname="UCLeftAdmin" tagprefix="uc1" %>

<%@ Register src="UCTopAdmin.ascx" tagname="UCTopAdmin" tagprefix="uc2" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <!--#include file="htexnew.aspx"-->

</head>

<body>

    <form id="form1" runat="server">

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
           
            <!-- /.navbar-header -->
             <uc2:UCTopAdmin ID="UCTopAdmin1" runat="server" />

            
            <!-- /.navbar-top-links -->

           
          
        </nav>

        <div id="page-wrappersss">
          
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <%--<div class="panel-heading">
                             <div class="well">
                          
                        </div>--%><div class="form-group">
                                        Điều khiển thiết bị cho dịch vụ
                                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive" style="width:800px" >
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
                            var iscolor = dr["port_dieukhien"].ToString() == "" ? "" : "background-color:red;";
                            if (i%2==1)
                            {
                                 odd = "even";
                            }
                            
                            %>
  <tr class="gradeA <%=odd%>" style="<%=iscolor%>">
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
                                                                   
                                                                    <td class="center "><%=dr["port_dieukhien"].ToString() == ""?"":"Port on:"+dr["port_dieukhien"]%> 

                                                                        <%
                            string isdichvu = dr["isdichvu"].ToString();
                            if (isdichvu=="1")
                            {
                                %><input type="button" name="btndieukhien" onclick="window.location = 'dieukhienend.aspx?guid_dichvu=<%=dr["guid_id"]%>'" value="Điều khiển" id="btndieukhien" class="form-control" style="height:50px;width:94px;display:inline-block" />
                                                                        <%}  %>
                                                                        






                                                                    </td>
                                                                    <td class="center "><%=dr["soluong"]%>*<%= SystemUti.formatNumber( dr["giathanh"])%></td>
                                                                     <td class="center "><%=SystemUti.formatNumber( dr["thanhtien"])%></td> 
                                                                   <td class="center "><%= getMadonhang( dr["adonhang_guid_id"] )%></td> 
                                                                </tr>
                                        

	
		    <%
                        }
                         %>

                                                           
                                                               
                                                            </tbody>
                                                        </table>
                            </div>
                            <!-- /.table-responsive --> <input type="button" name="ButtonLoginBarcodeaa" onclick="window.location = 'Ainfo.aspx'" value="Quay về" id="ButtonLoginBarcodeaa" class="form-control" style="height:50px;width:94px;display:inline-block">
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
          
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
        $(document).ready(function () {

            // For this specific table we are going to enable ordering
            // (searching is still disabled)
            $('#dataTables-example').DataTable({
                ordering: false
            });

           
        });
    </script>

    </form>

</body>

</html>


