<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NhanVien.aspx.cs" Inherits="AdminModule_NhanVien" %>
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
                    <h1 class="page-header">Cập nhật nhân viên<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
       <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Thông tin nhân viên
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                  

                                        <div class="form-group">
                                            <label>Tên đăng nhập</label>
                                            <asp:TextBox ID="TextBoxTenDangNhap" runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>Mật khẩu</label>
                                            <asp:TextBox ID="TextBoxMatKhau" Text="123456" runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>Số điện thoại </label>
                                            <asp:TextBox ID="TextBoxSDT"  runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>Email </label>
                                            <asp:TextBox ID="TextBoxEmail"   runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                     <div class="form-group">
                                            <label>Tên đầy đủ </label>
                                            <asp:TextBox ID="TextBoxHoTen"   runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                     <div class="form-group">
                                            <label>Thấu chi</label>
                                            <asp:TextBox ID="TextBoxThauChi"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>CMND</label>
                                            <asp:TextBox ID="TextBoxCMND"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                        
                                       
                                    
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                  
                                    <div class="form-group">
                                            <label>Cấp bậc</label>
                                             <asp:DropDownList ID="DropDownListAPhanCapId" CssClass="form-control" runat="server" />
                                           
                                        </div>
                                     <div class="form-group">
                                            <label>Loại thành viên</label>
                                             <asp:DropDownList ID="DropDownListALoaiThanhVienId" CssClass="form-control" runat="server" />
                                           
                                        </div>

                                    
                                        <fieldset >
                                          <div class="form-group">
                                            <label>Ngày Sinh</label><asp:HiddenField ID="HiddenFieldId" runat="server" />
                                            <asp:TextBox ID="TextBoxNgaySinh"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                            <div class="form-group">
                                            <label>Giới tính</label>
                                            <div class="radio-inline">
                                                <label>
                                                    <asp:RadioButton ID="RadioButtonNam"  GroupName="gioitinh" Checked="true" runat="server" />Nam
                                                </label>
                                            </div>
                                            <div class="radio-inline">
                                                <label>
                                                    <asp:RadioButton ID="RadioButtonNu" GroupName="gioitinh" runat="server" />Nữ
                                                </label>
                                            </div>
                                           
                                        </div>
                                            <div class="form-group">
                                            <label>Công việc</label>
                                            <asp:TextBox ID="TextBoxCongViec"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                           <div class="form-group">
                                            <label>Địa chỉ</label>
                                            <asp:TextBox ID="TextBoxDiaChi"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                             <div class="form-group">
                                            <label>Quận</label>
                                            <asp:TextBox ID="TextBoxQuan"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                            
                                            
                                        </fieldset>
                                  <br />
                                   
                                    <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Cập nhật" OnClick="Button1_Click" />
                                    
                                   
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
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
