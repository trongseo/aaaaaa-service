<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TheCao.aspx.cs" Inherits="AdminModule_TheCao" %>

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
                    <h1 class="page-header">Danh sách thể cào
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row"><br />
                             Block: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="400px">
                        </asp:DropDownList><br /><br />
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Số serial</th>
                                            <th>Giá tiền </th>
                                            <th >Block</th>
                                            <th>Hiệu lực từ ngày</th>
                                            <th>Hiệu lực đến ngày</th>
                                             <th>Đã nạp</th>
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
                                            <td> <%=dr["Id"]%></td>
                                            <td><%=dr["Gia"]%></td>
                                            <td >  
                           <%=dr["Block"]%> </td>
                                            <td class="center">
                                                <input type="text" id="ngaybatdau_<%=dr["Id"]%>" value="<%=SystemUti.formatDateShow(dr["ngaybatdau"])%>" name="ngaybatdau_<%=dr["Id"]%>"/></td>
                                            <td class="center"><input type="text" id="ngayketthuc_<%=dr["Id"]%>" value="<%=SystemUti.formatDateShow(dr["ngayketthuc"])%>" name="ngayketthuc_<%=dr["Id"]%>"/></td>
                                        <td >  
                           <%= SystemUti.formatDateShowHHmm( dr["ngaynap"])%> </td>
                                          </tr>

	
		    <%
                        }
                         %>
		
                                      
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            <div class="well">
                               
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" OnClick="btn_Delete_Click" Text="Xóa" Width="66px" />
                               
                                <asp:Button ID="Button2" CssClass="btn btn-default" runat="server" OnClick="Button2_Click" Text="Cập nhật" />
                               
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


