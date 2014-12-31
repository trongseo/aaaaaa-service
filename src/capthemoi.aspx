<%@ Page Language="C#" AutoEventWireup="true" CodeFile="capthemoi.aspx.cs" Inherits="capthemoi" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cấp thẻ thành viên</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <form runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Cấp  thẻ thành viên
                        </h3>
                    </div>
                    <div class="panel-body">
                        
                            <fieldset> <div class="form-group" style="display:none">
                                            <label>Cửa hàng</label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Width="178px">
                                        </asp:DropDownList>
                                        </div>
                               
                               
                               

                                <br />

                                 <div class="form-group">
                                      <label>Thẻ nhân viên</label>
                            <asp:TextBox  TextMode="Password"    Width="50px"  ID="TextBoxBarcode" CssClass="form-control" runat="server"  ></asp:TextBox>  
                                     
                                      <!-- Change this to a button or input when using this as a form -->
                           
                                </div>
                               <div class="form-group">
                                   <label>Thẻ đăng ký</label>
                            <asp:TextBox  TextMode="Password"    Width="50px"  ID="TextBoxDangKy" CssClass="form-control" runat="server"  ></asp:TextBox>  
                                     
                                      <!-- Change this to a button or input when using this as a form -->
                             
                                </div>
                                 <div class="form-group" style="display:inline-block">
                                   
                              <input type="button" name="ButtonLoginBarcodeaa" onclick="window.location='Ainfo.aspx'" value="Quay về" id="ButtonLoginBarcodeaa" class="form-control" style="height:50px;width:94px;display:inline-block">
                               <asp:Button   ID="ButtonLoginBarcode" style="height:50px;width:94px;display:inline-block" Text="Đăng ký" CssClass="form-control" runat="server"  Height="50px" Width="194px"  OnClick="ButtonLoginBarcode_Click" />
                                  </div>

                            </fieldset>
                       <asp:Label ID="Label1" runat="server"  ></asp:Label> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    <script>
 

        $('#TextBoxBarcode').focus();
        $('#TextBoxBarcode').keypress(function (e) {
            if (e.which == 13) {
                event.preventDefault();
                $('#TextBoxDangKy').focus();
               // $("#ButtonLoginBarcode").trigger('click');
                return false;

                // enter pressed
               // alert('x');
              
               
                //document.getElementById('ButtonLoginBarcode').click();
            }
        });
        $('#TextBoxDangKy').keypress(function (e) {
            if (e.which == 13) {
                event.preventDefault();
                document.getElementById('ButtonLoginBarcode').click();
                return false;

                // enter pressed
                // alert('x');
                //$('#ButtonLoginBarcode').click();

                //document.getElementById('ButtonLoginBarcode').click();
            }
        });
        
    </script>
</body>

</html>
