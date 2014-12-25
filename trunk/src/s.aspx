<%@ Page Language="C#" AutoEventWireup="true" CodeFile="s.aspx.cs" Inherits="Logins" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LOGIN</title>

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
                        <h3 class="panel-title">Màn hình đăng nhập
                        </h3>
                    </div>
                    <div class="panel-body">
                        
                            <fieldset> <div class="form-group">
                                            <label>Cửa hàng</label>
                                        </div>
                                <div class="form-group">
                                    <asp:TextBox ID="UserTextBox" placeholder="Tên đăng nhập" CssClass="form-control" runat="server" Height="203px" Width="403px"  ></asp:TextBox>
                                    
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                                    <br />
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server">
                                    </asp:GridView>
                                    
                                </div>
                                <div class="form-group">
                                   
                                </div>
                                <%--<div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>--%>
                                <!-- Change this to a button or input when using this as a form -->
                                  <div class="form-group form-inline">
                                </div>
                                <%--<a href="javascript:document.getElementById('SaveButton').click();" class="btn btn-lg btn-success btn-block">Đăng nhập</a>--%>

                                <br />

                                 <div class="form-group form-inline">
                                   
                                     <!-- Change this to a button or input when using this as a form -->
                                     </div>
                             <hr />
                                 <div class="form-group">
                                     
                             &nbsp;</div>

                            </fieldset>
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
                $("#ButtonLoginBarcode").trigger('click');
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
