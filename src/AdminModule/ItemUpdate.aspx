<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemUpdate.aspx.cs" Inherits="AdminModule_ItemUpdate" %>
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
                    <h1 class="page-header">Cập nhật sản phẩm</h1>
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
                                            <label>Tên sản phẩm</label>
                                           <asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                                            Display="Dynamic" CssClass="help-block" ErrorMessage="Vui lòng nhập!" ValidationGroup="xxx">Vui lòng nhập!</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label>Loại</label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Width="178px">
                                        </asp:DropDownList>
                                        </div>

                                        <div class="form-group">
                                           <label>Giá bán</label>
                                           <asp:TextBox ID="TextBox3Price" runat="server"  CssClass="form-control"></asp:TextBox>&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3Price"
                                            Display="Dynamic" CssClass="help-block" ErrorMessage="Vui lòng nhập!" ValidationGroup="xxx">Vui lòng nhập!</asp:RequiredFieldValidator>
                                        </div>
                                         <div class="form-group">
                                           <label>Số lượng (có thể tự động tăng khi thêm phiếu nhập kho)</label>
                                           <asp:TextBox ID="TextBoxQuantity" runat="server"  CssClass="form-control"></asp:TextBox>&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxQuantity"
                                            Display="Dynamic" CssClass="help-block" ErrorMessage="Vui lòng nhập!" ValidationGroup="xxx">Vui lòng nhập!</asp:RequiredFieldValidator>
                                        </div>
                                       
                                   <asp:Button ID="SaveButton" Text="Cập nhật" OnClick="SaveButton_Click" runat="server" Width="94px" />
                                &nbsp;&nbsp;
                                        
                                       
                                   <asp:Button ID="SaveButton0" Text="Cập nhật và thêm mới"  runat="server" Width="161px" OnClick="SaveButton0_Click" />
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                             <table style="width: 100%;display:none" >
                                <tr>
                                    <td style="width: 62px">
                                    </td>
                                    <td>
                                        là tiếng Anh thì check vào:<asp:CheckBox ID="EnCheckBox1" runat="server" /></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px">
                            Tiêu đề:</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                    </td>
                                </tr>
                                <tr >
                                    <td style="width: 62px">
                                        Loại SP</td>
                                    <td>
                                        </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px">
                                        Hình đại diện</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <asp:Image ID="Image1" runat="server" Width="35px" />
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="(Xóa hình)" Visible="False" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1"
                                            Display="Dynamic" ErrorMessage="Vui lòng chọn ảnh đúng dạng!(jpg|jpeg|png|gif)"
                                            ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$" ValidationGroup="xxx"></asp:RegularExpressionValidator></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px">
                                        Mô tả ngắn:</td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" Height="204px" TextMode="MultiLine" Width="318px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                                            Display="Dynamic" ErrorMessage="Vui lòng nhập!" ValidationGroup="xxx">Vui lòng nhập!</asp:RequiredFieldValidator></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px">
                                        Chi tiết</td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px">
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DescriptionTextBox" runat="server" Height="424px" TextMode="MultiLine"
                                            Width="315px"></asp:TextBox></td>
                                    <td>
                        Cập nhật hình:<br />  
                            <strong>Cách 1<br />
                            </strong>-<a href='../Album.aspx' target="_blank">Chọn hình</a>
                            <br />
                            -Copy đường dẫn trong text2
                            <br />
                            -Paste vào nơi bạn cần hiện hình
                            <br />
                            -bấm nút "Cập nhật" .Xong!
                            <br />
                            <br />
                            <strong>Cách 2</strong><br />
                        -<a href='../Album.aspx' target="_blank">Chọn hình</a> <br />  
                        -Copy đường dẫn trong text1  <br />  
                        -Chọn nút" Thêm hình" (trong freetextbox hàng trên cuối cùng) paste(dán) vào bấm "hòan thành"  <br />  
                        -bấm nút "Cập nhật" .Xong!  <br />  
                        
                        <a href='guide.aspx' target="_blank">Huong dan cap nhat Film</a>    
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px">
                                    </td>
                                    <td>
</td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 62px; height: 17px">
                                    </td>
                                    <td style="height: 17px">
                                    </td>
                                    <td style="height: 17px">
                                    </td>
                                </tr>
                            </table>
                           
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
