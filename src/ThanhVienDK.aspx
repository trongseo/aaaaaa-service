﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThanhVienDK.aspx.cs" Inherits="ThanhVien" %>
<%@ Register src="UCLeftAdmin.ascx" tagname="UCLeftAdmin" tagprefix="uc1" %>

<%@ Register src="UCTopFree.ascx" tagname="UCTopAdmin" tagprefix="uc2" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!--#include file="htexnew.aspx"-->
     <link href='js/calendar/rome.css' rel='stylesheet' type='text/css' />
<script src='js/calendar/rome.js'></script>
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

        <div id="page-wrapperss">
          <%--  <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Cập nhật thông tin thành viên
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>--%>
            <!-- /.row -->
       <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Đăng ký mới
                        </div>
                        <div class="panel-body" style="width:700px">
                            <div class="row">
                                <div class="col-lg-6">
                                  
                                    <div class="form-group">
                                            <label>Cửa hàng</label>
                                            <asp:DropDownList ID="DropDownListCuaHang" CssClass="form-control" runat="server" Width="178px">
                                        </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Tên đăng nhập</label>
                                            <asp:TextBox ID="TextBoxTenDangNhap"  data-validation="required" runat="server"   CssClass="form-control"></asp:TextBox>
                                            <asp:HiddenField ID="HiddenField1" Value="" runat="server" />
                                        </div>
                                  
                                     <div class="form-group">
                                            <label>Mật khẩu</label>
                                            <asp:TextBox ID="TextBoxMatKhau"  TextMode="Password"  data-validation="required" runat="server"  CssClass="form-control"></asp:TextBox>
                                            
                                        </div>
                                      
                                         <div class="form-group">
                                            <label>Số điện thoại </label>
                                            <asp:TextBox ID="TextBoxSDT"  runat="server" data-validation="required" CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>Email </label>
                                            <asp:TextBox ID="TextBoxEmail"  data-validation="email" runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                     <div class="form-group">
                                            <label>Tên đầy đủ </label>
                                            <asp:TextBox ID="TextBoxHoTen"  data-validation="required" runat="server"  CssClass="form-control"></asp:TextBox>
                                           
                                        </div>
                                    
                                        
                                          
                                       
                                    
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                  
                  
                                     <div class="form-group" style="display:none">
                                            <label>Thấu chi</label>
                                            <asp:TextBox ID="TextBoxThauChi" onkeyup="formatNumerNew(this)" Text="0" onfocus="formatNumerNew(this)"  data-validation="number"  runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                    
                                        <fieldset >
                                            <div class="form-group">
                                            <label>CMND</label>
                                            <asp:TextBox ID="TextBoxCMND"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <label>Công việc</label>
                                            <asp:TextBox ID="TextBoxCongViec"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                          <div class="form-group">
                                            <label>Ngày Sinh (dd-mm-yyyy)</label><asp:HiddenField ID="HiddenFieldId" runat="server" />
                                            <asp:TextBox ID="TextBoxNgaySinh"    data-validation="dateno"
                    runat="server"  CssClass="form-control"></asp:TextBox>
                                              <script >rome(TextBoxNgaySinh, options = { "inputFormat": "DD-MM-YYYY", });</script>
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
                                            <div class="form-group">
                                            <label>Địa chỉ</label>
                                            <asp:TextBox ID="TextBoxDiaChi"   runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                             <div class="form-group">
                                            <label>Quận</label>
                                            <asp:DropDownList ID="DropDownListQuan"   runat="server"  CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        </div>
                                           
                                                              <div class="form-group" style="display:none">
                                            <label>Cấp bậc</label>
         <asp:DropDownList ID="DropDownListAPhanCapId" CssClass="form-control" runat="server" />
                                           
                                        </div>
                                     <div class="form-group"  style="display:none">
                                            <label>Loại thành viên</label>
                                             <asp:DropDownList ID="DropDownListALoaiThanhVienId" CssClass="form-control" runat="server" />
                                           
                                        </div>
                                            
                                        </fieldset>
                                  <br />
                                   <input type="button" class="btn btn-default" name="ButtonCapNhatTaiKhoan" onclick="javascript: window.location = 'AInfo.aspx'" value="Quay về" id="ButtonCapNhatTaiKhoan" style="height:50px;width:150px;">
                                    <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Cập nhật" OnClick="Button1_Click" Width="150px" Height="50px" />
                                    
                                   
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
    <script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.form-validator.js"></script>
<script>
    (function ($, window) {

        var dev = '.dev'; //window.location.hash.indexOf('dev') > -1 ? '.dev' : '';

        // setup datepicker
        $("#datepicker").datepicker();

        // Add a new validator
        $.formUtils.addValidator({
            name: 'dateno',
            validatorFunction: function (value, $el, config, language, $form) {
                if (value == "") return true;
                return $.formUtils.parseDate(value, 'dd-mm-yyyy') !== false;
               // return parseInt(value, 10) % 2 === 0;
            },
            borderColorOnError: '',
            errorMessage: 'Nhập ngày chính xác theo định dạng (02/12/1990)',
            errorMessageKey: 'badEvenNumber'
        });

        window.applyValidation = function (validateOnBlur, forms, messagePosition) {
            if (!forms)
                forms = 'form';
            if (!messagePosition)
                messagePosition = 'top';

            $.validate({
                form: forms,
                language: {
                    requiredFields: 'Vui lòng nhập!'
                },
                validateOnBlur: validateOnBlur,
                errorMessagePosition: messagePosition,
                scrollToTopOnError: true,
                borderColorOnError: 'purple',
                modules: 'security' + dev + ', location' + dev + ', sweden' + dev + ', html5' + dev + ', file' + dev + ', uk' + dev,
                onModulesLoaded: function () {
                    $('#country-suggestions').suggestCountry();
                    $('#swedish-county-suggestions').suggestSwedishCounty();
                    $('#password').displayPasswordStrength();
                },
                onValidate: function ($f) {

                    console.log('about to validate form ' + $f.attr('id'));

                    var $callbackInput = $('#callback');
                    if ($callbackInput.val() == 1) {
                        return {
                            element: $callbackInput,
                            message: 'This validation was made in a callback'
                        };
                    }
                },
                onError: function ($form) {
                    if (!$.formUtils.haltValidation) {
                        //alert('Invalid ' + $form.attr('id'));
                    }
                },
                onSuccess: function ($form) {
                    //alert('Valid ' + $form.attr('id'));
                    return true;
                }
            });
        };

        $('#text-area').restrictLength($('#max-len'));

        window.applyValidation(true, '#form1', 'element');
      

        // Load one module outside $.validate() even though you do not have to
        $.formUtils.loadModules('date' + dev + '.js', false, false);

        $('input')
            .on('zbeforeValidation', function () {
                console.log('About to validate input "' + this.name + '"');
            })
            .on('validationz', function (evt, isValid) {
                var validationResult = '';
                if (isValid === null) {
                    validationResult = 'not validated';
                } else if (isValid) {
                    validationResult = 'VALID';
                } else {
                    validationResult = 'INVALID';
                }
                console.log('Input ' + this.name + ' is ' + validationResult);
            });

    })(jQuery, window);


    function formatNumerNew(objc) {


        // Set up the number formatting.


        //alert(objc.value);
        var number1 = parseInt(objc.value, 10);
        var number = number1.toFixed(0) + '';
        var x = number.split('.');
        var x1 = x[0];
        var x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        var x1x2 = x1 + x2;
        if (x1x2 == 'NaN') {
            x1x2 = '';
        }
        //$('#'+objc.id +'_html').html(x1x2 );
        //  $( "<span>"+x1x2+"</span>").remove
        $('#' + objc.id + '_html').remove();
        // $( '<span id='+objc.id +'_html'>'+x1x2+'</span>' ).insertAfter('#'+objc.id );
        $('<span id="' + objc.id + '_html" >' + x1x2 + '</span>').insertAfter('#' + objc.id);
    }

</script>
</body>

</html>