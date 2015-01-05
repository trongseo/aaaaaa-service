<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DichVu.aspx.cs" Inherits="AdminModule_DichVu" %>
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
                    <h1 class="page-header">Cập nhật dịch vụ </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
          <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                        </div>
                                        <div class="form-group">
                                            Loại dịch vụ
                                            <label> &nbsp;</label>&nbsp;<asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" >
                                        </asp:DropDownList>
                                        </div>

                                        <div class="form-group">
                                           <label> Số phút dịch vụ </label>&nbsp;<asp:TextBox ID="TextBoxSoPhut" runat="server"  CssClass="form-control"></asp:TextBox>&nbsp;
                                            Mô tả:<asp:TextBox ID="TextBoxMota" runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <label> Gía tiền</label>
                                           <asp:TextBox ID="TextBoxGiatien" runat="server"  CssClass="form-control"></asp:TextBox>&nbsp;
                                        </div>
                                       
                                   <asp:Button ID="SaveButton" Text="Cập nhật" OnClick="SaveButton_Click" runat="server" Width="94px" />
                                &nbsp;&nbsp;
                                        
                                       
                                   <asp:Button ID="SaveButton0" Text="Cập nhật và thêm mới"  runat="server" Width="161px" OnClick="SaveButton0_Click" />
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                           
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

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    </form>

</body>

</html>
