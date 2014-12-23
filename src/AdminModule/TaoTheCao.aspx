<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaoTheCao.aspx.cs" Inherits="AdminModule_TaoTheCao" %>
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
                    <h1 class="page-header">Cấp barcode</h1>
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
                                            Tên<label> </label>
&nbsp;<asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"   >
                                        </asp:DropDownList>
                                            tong so the cao<asp:TextBox ID="TextBoxTongso" runat="server"  CssClass="form-control"></asp:TextBox>gia<asp:TextBox ID="TextBoxGia" runat="server"  CssClass="form-control"></asp:TextBox>&nbsp;thuoc block<asp:TextBox ID="TextBoxBlock" runat="server"  CssClass="form-control"></asp:TextBox>(1,2,3...100)<asp:Button ID="ButtonTaoThe" Text="Tạo" OnClick="btnTaoTheCaoclick" runat="server" Width="94px" />
                                        </div>

                                        <div class="form-group">
                                            <label>&nbsp;</label>&nbsp;&nbsp;
                                        </div>
                                     <div class="form-group">
                                            <label>&nbsp;</label>&nbsp;&nbsp;
                                        </div>

                                         <div class="form-group">
                                             <asp:Button ID="ButtonCSV" Text="Export block ra excel" OnClick="btnExport" runat="server" Width="131px" />
                                        </div>
                                       
                                &nbsp;&nbsp;
                                        
                                       
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
