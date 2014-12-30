﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="AdminModule_Login" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin login </title>

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
                        <h3 class="panel-title">Please Sign In
                        </h3>
                    </div>
                    <div class="panel-body">
                        
                            <fieldset> <div class="form-group" >
                                            <label>Cửa hàng</label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Width="178px">
                                        </asp:DropDownList>
                                        </div>
                                <div class="form-group">
                                    <asp:TextBox ID="UserTextBox" placeholder="Tên đăng nhập" CssClass="form-control" runat="server"  ></asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                   
                                     <asp:TextBox TextMode="Password" placeholder="Mật khẩu"  ID="PassTextBox" CssClass="form-control" runat="server"  ></asp:TextBox>
                                </div>
                                <%--<div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>--%>
                                <!-- Change this to a button or input when using this as a form -->
                               <span style="display:none"><asp:Button ID="SaveButton" Text="Đăng nhập" runat="server" Width="94px" OnClick="SaveButton_Click" /></span> 
                                <a href="javascript:document.getElementById('SaveButton').click();" class="btn btn-lg btn-success btn-block">Đăng nhập</a>
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

</body>

</html>
