<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AInfo.aspx.cs" Inherits="AInfo" %>

<%@ Register Src="UCLeftAdmin.ascx" TagName="UCLeftAdmin" TagPrefix="uc1" %>

<%@ Register Src="UCTopAdmin.ascx" TagName="UCTopAdmin" TagPrefix="uc2" %>
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

            <div id="page-wrapperxxx">

                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <%--<div class="panel-heading">
                           Thông tin nhân viên
                        </div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">

                                        <div class="well">
                                            <div class="form-group">
                                                <label>Xin chào quí khách:</label>
                                                <asp:TextBox ID="TextBoxTenDangNhap" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="form-group">
                                                <label>Tài khoản quí khách còn:</label>
                                                <asp:TextBox ID="TextBoxTienTrongTK"  ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="form-group">

                                                <asp:Button ID="ButtonCapNhatTaiKhoan" Text="Cập nhật" runat="server" Width="150px" Height="50px" />

                                            </div>
                                        </div>




                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                    <div class="col-lg-6">

                                        <div class="well">
                                            <div class="form-group">
                                                <label>Mã nạp tiền</label>
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">

                                                <asp:Button ID="ButtonNapTien" Text="Nạp tiền" runat="server" Width="150px" Height="50px" />
                                                <input type="button" name="ButtonNhanVienw" value="Nhờ nhân viên nạp tiền" onclick="javascript: window.location.href = 'NapTienKhachHang.aspx'" id="ButtonNhanVien" style="height: 50px; width: 250px;">
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">

                                            <div class="panel-heading">
                                                Khu vực nhân viên
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <asp:Button ID="ButtonDangKyThanhVien" Text="Đăng ký thành viên" runat="server" Width="150px" Height="50px" />
                                                    <asp:Button ID="ButtonGioDiLam" Text="Giờ đi làm" runat="server" Width="150px" Height="50px" />
                                                    <asp:Button ID="ButtonGioTanCa" Text="Giờ tan ca" runat="server" Width="150px" Height="50px" />

                                                </div>
                                            </div>


                                        </div>



                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="panel panel-primary">

                                            <div class="panel-heading">
                                                Chọn dịch vụ
                                            </div>

                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label>Chọn dịch vụ:</label><asp:DropDownList ID="DropDownListLoaiDV"  onchange="ListLoaiDV(this)"  CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label>Khung thời gian :</label>
                                                    <asp:DropDownList ID="DropDownListThoiGian" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group">
                                                    <label>Chọn ngày giờ:</label>
                                                    <asp:TextBox ID="TextBoxNgayDV" runat="server" CssClass="form-control"></asp:TextBox>
                                                   
<script >rome(TextBoxNgayDV, options = { "inputFormat": "DD-MM-YYYY HH:mm", });</script>
                                                </div>
                                               
                                                <div class="form-group">
                                                    <label>Chọn máy:</label>
                                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <br />
                                                    <asp:Button ID="ButtonChonDV" Text="Chọn dịch vụ" runat="server" Width="150px" Height="50px" />

                                                </div>


                                            </div>
                                        </div>




                                    </div>
                                    <div class="col-lg-6">

                                        <div class="panel panel-primary">

                                            <div class="panel-heading">
                                                Chọn sản phẩm
                                            </div>

                                            <div class="panel-body">
                                                 <script src="js/jquery.js"></script>
                                                <script>
                                                    $(document).ready(function () {
                                                        //$("button").click(function () {
                                                        //    $("p").slideToggle();
                                                        //});
                                                        loadGrid();
                                                        LoadSP("0");
                                                        LoadDichVu("0");

                                                    });
                                                    function loadGrid()
                                                    {
                                                        $.get("ajaxgrid.aspx?from=giohang&r=" + Math.random(), function (data, status) {
                                                            // alert("Data: " + data + "\nStatus: " + status);
                                                            $('#dataTables-example_wrapper').html(data);
                                                        });
                                                    }
                                                   
                                                        function ListLoaiDV(objx)
                                                        {
                                                       
                                                            LoadDichVu(objx.value);
                                                        }
                                                        function LoadDichVu(loaidvid) {

                                                            $('#DropDownListThoiGian').find("option").remove();
                                                            $.ajax({
                                                                url: 'ajax.aspx?from=listdv&r=' + Math.random(),
                                                                type: 'POST',
                                                                cache: false,
                                                                data: 'loaidvid=' + loaidvid,
                                                                dataType: 'json',
                                                                error: function (error) {
                                                                    //alert('Server validation failed due to: ' + error.statusText);
                                                                    alert('javascript:Server failed');

                                                                },
                                                                success: function (response) {
                                                                    // alert(response[0].Id);
                                                                    var select = document.getElementById("DropDownListThoiGian");
                                                                    for (var i = 0; i < response.length; i++) {
                                                                        var option = document.createElement('option');
                                                                        option.text = response[i].Title;
                                                                        option.value = response[i].Id;
                                                                        select.add(option, 0);
                                                                    }
                                                                }
                                                            });

                                                        }

                                                    function SPchange(objx)
                                                    {
                                                       
                                                        LoadSP(objx.value);
                                                    }

                                                    function LoadSP(loaispid)
                                                    {
                                                       
                                                        $('#DropDownListSP').find("option").remove();
                                                        $.ajax({
                                                            url: 'ajax.aspx?from=listsp&r=' + Math.random(),
                                                            type: 'POST',
                                                            cache: false,
                                                            data: 'DropDownListLoaiSP=' + loaispid,
                                                           dataType: 'json',
                                                            error: function (error) {
                                                                //alert('Server validation failed due to: ' + error.statusText);
                                                                alert('javascript:Server failed');
                                                               
                                                            },
                                                            success: function (response) {
                                                               // alert(response[0].Id);
                                                                var select = document.getElementById("DropDownListSP");
                                                                for (var i = 0; i < response.length; i++) {
                                                                    var option = document.createElement('option');
                                                                    option.text = response[i].Title;
                                                                    option.value = response[i].Id;
                                                                    select.add(option, 0);
                                                                }
                                                            }
                                                        });

                                                    }
                                                    function saveSP()
                                                    {
                                                        // DropDownListLoaiSP DropDownListSP TextBoxNgaySP
                                                       // DropDownListLoaiSP
                                                        var loaisp = $('#DropDownListLoaiSP').val();
                                                        var idsp = $('#DropDownListSP').val();
                                                        var ngadv = $('#TextBoxNgaySP').val();
                                                        var soluong = $('#TextBoxSoLuong').val();
                                                        //alert(loaisp+ idsp+ngadv);
                                                        //return;
                                                        $.ajax({
                                                            url: 'ajax.aspx?from=savesp&r=' + Math.random(),
                                                            type: 'POST',
                                                            cache: false,
                                                            data: 'soluong=' + soluong + '&DropDownListLoaiSP=' + loaisp + '&DropDownListSP=' + idsp + '&TextBoxNgaySP=' + ngadv,
                                                            dataType: 'json',
                                                            error: function (error) {
                                                                //alert('Server validation failed due to: ' + error.statusText);
                                                                alert('javascript:Server failed');

                                                            },
                                                            success: function (response) {
                                                             
                                                                loadGrid();
                                                            }
                                                        });

                                                    }

                                                   
</script>
                                                <div class="form-group">
                                                    <label>Dịch vụ - Sản phẩm:</label><asp:DropDownList ID="DropDownListLoaiSP" onchange="SPchange(this)"  CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label>Loại:</label>
                                                    <asp:DropDownList ID="DropDownListSP" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>

                                                 <div class="form-group">
                                                    <label>Số lượng:</label>
                                                    <asp:TextBox ID="TextBoxSoLuong" Text="1" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                                <div class="form-group">
                                                    <label>Chọn ngày:</label>
                                                    <asp:TextBox ID="TextBoxNgaySP" runat="server"  CssClass="form-control"></asp:TextBox>
                                                    <script >rome(TextBoxNgaySP, options = { "inputFormat": "DD-MM-YYYY" });</script>
                                                </div>

                                                <div class="form-group">
                                                    <br />
                                                  
                                                    <input type="button" name="ButtonSaveSP" onclick="saveSP()" value="Chọn sản phẩm" id="ButtonSaveSP" style="height:50px;width:150px;">
                                                </div>
                                            </div>

                                        </div>




                                    </div>
                                </div>
                                <!-- /.row (nested) -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                Dịch vụ đang chọn
                                            </div>
                                            <!-- /.panel-heading -->
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                                        <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                                            <thead>
                                                                <tr role="row" style="background-color:#337ab7;color:white">
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column ascending" style="width: 179px;">Ngày giờ</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 245px;">Mặt hàng</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 225px;">STT máy</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">Số lượng*đơn giá</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 112px;">Thành tiền</th>
                                                                    <th class="" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 112px;">Xóa</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr class="gradeA odd">
                                                                    <td class="sorting_1">Gecko</td>
                                                                    <td class=" ">Firefox 1.0</td>
                                                                    <td class=" ">Win 98+ / OSX.2+</td>
                                                                    <td class="center ">1.7</td>
                                                                    <td class="center ">A</td>
                                                                     <td class="center ">A</td>
                                                                </tr>
                                                                <tr class="gradeA even">
                                                                    <td class="sorting_1">Gecko</td>
                                                                    <td class=" ">Firefox 1.5</td>
                                                                    <td class=" ">Win 98+ / OSX.2+</td>
                                                                    <td class="center ">1.8</td>
                                                                    <td class="center ">A</td>
                                                                     <td class="center ">A</td>
                                                                </tr>
                                                               
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- /.table-responsive -->
                                                <div class="form-group">
                                                    <br>
                                                       <asp:Button ID="ButtonHoanThanh" Text="Hoàn thành"  runat="server" Width="94px" />
                                                </div>
                                            </div>
                                            <!-- /.panel-body -->
                                        </div>
                                        <!-- /.panel -->
                                    </div>
                                    <!-- /.col-lg-12 -->
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
