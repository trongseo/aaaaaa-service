﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NhapKhoList.aspx.cs" Inherits="AdminModule_NhapKhoList" %>

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

           
            <uc1:UCLeftAdmin ID="UCLeftAdmin1" runat="server" />
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Danh sách phiếu nhập kho</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <%--<div class="panel-heading">
                             <div class="well">
                          
                        </div>--%><div class="form-group"><asp:DropDownList id="DropDownList1" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Visible="false">
                                        </asp:DropDownList> 
                                            <button type="button" onclick="javascript:window.location='NhapKho.aspx?add=1'" class="btn btn-default">Thêm mới </button>
                                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Xóa</th>
                                            <th>Ghi chú</th>
                                            <th style="display:none">Platform(s)</th>
                                            <th>Giá mua</th>
                                            <th style="display:none">CSS grade</th>
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

                                          <tr class="<%=odd%> gradeX">
                                            <td> <input type="checkbox" name="checkbox_<%=dr["Id"]%>" id="checkbox_<%=dr["Id"]%>"/></td>
                                            <td>  <a href="NhapKho.aspx?Id=<%=dr["Id"]%>"> <%=dr["Note"]%>[SỬA]</a></td>
                                            <td style="display:none">  </td>
                                            <td class="center"><%=dr["Pricebuy"]%></td>
                                            <td class="center" style="display:none">X</td>
                                        </tr>

	
		    <%
                        }
                         %>
		
                                      
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            <div class="well">
                               
                                <asp:Button ID="Button1"  OnClientClick="if ( ! UserDeleteConfirmation()) return false;" runat="server" CssClass="btn btn-default" OnClick="btn_Delete_Click" Text="Xóa" Width="66px" />
                               <script>
                                   function UserDeleteConfirmation() {
                                       return confirm("Bạn muốn xóa?");
                                   }
                               </script>
                                <asp:Button ID="Button2" Visible="false" CssClass="btn btn-default" runat="server" OnClick="Button2_Click" Text="Cập nhật" />
                               
                            </div>
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

