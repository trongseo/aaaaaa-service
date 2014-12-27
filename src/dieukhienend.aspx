<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dieukhienend.aspx.cs" Inherits="dieukhienend" %>

<%@ Register src="UCLeftAdmin.ascx" tagname="UCLeftAdmin" tagprefix="uc1" %>

<%@ Register src="UCTopAdmin.ascx" tagname="UCTopAdmin" tagprefix="uc2" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <!--#include file="htexnew.aspx"-->

    <style type="text/css">
        .form-control {}
    </style>

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
                                         
                                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <div class="panel panel-default">
                        <div class="panel-heading">
                           Điều khiển port
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div role="form">
                                        <div class="form-group">
                                            <table>
                                                <tr><td>  <label>Chọn port</label>
                                           
                                            <asp:ListBox ID="ListBox1" CssClass="form-control" runat="server" Font-Size="X-Large" Height="386px" Width="227px">
                                               
                                            </asp:ListBox> </td>

                                                    <td> <label>Trạng thái hiện tại:</label></td>

                                                </tr>
                                            </table>
                                          
                                        </div>
                                        
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                        <asp:Button ID="Button1" runat="server" Height="49px" OnClick="Button1_Click" Text="Button" Width="102px" />
                                    </div>
                            </div>

                        </div>

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


