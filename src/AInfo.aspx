<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AInfo.aspx.cs" EnableEventValidation="false" Inherits="AInfo" %>

<%@ Register Src="UCLeftAdmin.ascx" TagName="UCLeftAdmin" TagPrefix="uc1" %>

<%@ Register Src="UCTopAdmin.ascx" TagName="UCTopAdmin" TagPrefix="uc2" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!--#include file="htexnew.aspx"-->
    <link href='js/calendar/rome.css' rel='stylesheet' type='text/css' />
<script src='js/calendar/rome.js'></script>
    <style>

        .well {
               padding: 1px;
margin-bottom: 2px;
        }
        .form-group {
            margin-bottom: 5px;
        }

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
                                                <asp:Label ID="TextBoxTenDangNhap" runat="server" ></asp:Label> <label>Tài khoản quí khách còn:</label>
                                                <asp:Label ID="TextBoxTienTrongTK"  ReadOnly="true" runat="server" ></asp:Label>

                                            </div>
                                           
                                            <div class="panel-heading">
                                                    <a href="ChangePassword.aspx" style="display:inline-block">
                            <div class="panel-footer" style="width:130px;display:inline-block">
                                <span class="pull-left">Đổi mật khẩu</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a> <a href="ThanhVien.aspx" style="display:inline-block">
                            <div class="panel-footer" style="width:130px;display:inline-block">
                                <span class="pull-left">Cập nhật</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a> <a href="LichsuList.aspx" style="display:inline-block">
                            <div class="panel-footer" style="width:130px;display:inline-block">
                                <span class="pull-left">Ds giao dịch</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a><a href="donhanglist.aspx" style="display:inline-block">
                            <div class="panel-footer" style="width:130px;display:inline-block">
                                <span class="pull-left">Ds đơn hàng</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                                            </div>
                                        </div>




                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                    <div class="col-lg-6">

                                        <div class="well" style="<%=isShow("well1")%>" id="well1">
                                            <div class="row">

                                                <div class="col-lg-8" style="width:50%;">
                    <div class="panel panel-default">
                        <div class="form-group">
                                                <label>Mã nạp tiền</label>
                                                <asp:TextBox ID="TextBoxMaNapTien" runat="server" CssClass="form-control"></asp:TextBox> <asp:Button ID="ButtonNapTien" Text="Nạp tiền" runat="server" Width="150px" Height="50px" OnClick="ButtonNapTien_Click" />
                                            </div>
                    </div>

                                                </div> <div class="col-lg-8" style="width:50%;">
                    <div class="panel panel-default">
                        <div class="form-group">
                                                <label>Nhờ  nạp tiền</label><br />
                                                <asp:TextBox ID="TextBoxSoTienNap" style="display:inline-block" autocomplete="off" placeholder="Số tiền" runat="server" Width="100px" CssClass="form-control"></asp:TextBox>   <asp:TextBox ID="TextBoxbarcodenhanvien"  autocomplete="off" TextMode="Password" style="display:inline-block" placeholder="Mã barcode" runat="server" Width="100px" CssClass="form-control"></asp:TextBox>  <asp:Button ID="ButtonNhanViennaptien" style="height: 50px; width: 250px;"  runat="server" Text="Nhân viên nạp tiền" OnClick="ButtonNhanViennaptien_Click" />
                                                
                                            </div>
                         <div class="form-group">

                                             
                                            </div>

                    </div>

                                                </div>
                                               
                                            </div>
                                            

                                           
                                        </div>
                                         <div class="well" style="<%=isShow("well1nhanvien")%>" id="well1nhanvien">
                                             
                                            <div class="form-group" style="display:inline-block">
                                                <label>Gửi đồ</label>
                                                <asp:TextBox ID="TextBoxmadonhang_guitra" runat="server" placeholder="Mã đơn hàng" CssClass="form-control" style="display:inline-block" ></asp:TextBox>  
                                                <asp:Button ID="ButtonGuiDo" Text="Gửi đồ" runat="server" style="display:inline-block" Width="150px" Height="50px" OnClick="ButtonGuiDo_Click" />
                                              <asp:Button ID="ButtonTraDo" Text="Trả đồ" runat="server" style="display:inline-block" Width="150px" Height="50px" OnClick="ButtonTraDo_Click" />
                                       
                                                 </div>

                                            
                                        </div>
                                        <%--   <div class="panel panel-primary">

                                            <div class="panel-heading">
                                                Khu vực nhân viên
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    
                                                    <asp:Button ID="ButtonGioDiLam" Text="Giờ đi làm" runat="server" Width="150px" Height="50px" />
                                                    <asp:Button ID="ButtonGioTanCa" Text="Giờ tan ca" runat="server" Width="150px" Height="50px" />

                                                </div>
                                            </div>


                                        </div>--%>



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
                                                    <asp:DropDownList ID="DropDownListThoiGian"  data-validation="required" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="form-group">
                                                    <label>Chọn ngày giờ:</label>
                                                    <asp:TextBox ID="TextBoxNgayDV" data-validation="required" runat="server" CssClass="form-control"></asp:TextBox>
                                                   
<script >rome(TextBoxNgayDV, options = { "inputFormat": "DD-MM-YYYY HH:mm", });</script>
                                                </div>
                                               
                                                <div class="form-group">
                                                    <label>Chọn máy:</label>
                                                    <asp:DropDownList ID="DropDownListAport" data-validation="required" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <br />
                                                   <input type="button" onclick="saveDichVu()"  name="ButtonChonDV" value="Chọn dịch vụ" id="ButtonChonDV" style="height:50px;width:150px;">
                                                     <br /><span style="color:red;display:none" id="spdisable" >Hãy hoàn thành đơn hàng này trước khi chọn thêm dịch vụ.Hoặc xóa dịch vụ đi.</span>
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
                                                    //disable nut them dich vu
                                                    function disablebuttonThemDV() {
                                                       
                                                        $.get("ajax.aspx?from=checkdisable&r=" + Math.random(), function (data, status) {
                                                          
                                                            if (data == 1) {
                                                               // $('#ButtonChonDV').attr('disabled', 'disabled');
                                                                $('#ButtonChonDV').attr('disabled', 'disabled');
                                                                $('#ButtonChonDV').addClass('btn btn-default disabled');
                                                                $('#spdisable').show();;
                                                            } else {
                                                                $('#ButtonChonDV').removeAttr('disabled', 'disabled');
                                                                $('#ButtonChonDV').removeClass('btn btn-default disabled');
                                                                $('#spdisable').hide();;
                                                            }
                                                        });

                                                    }
                                                    function loadGrid()
                                                    {
                                                      
                                                        $.get("ajaxgrid.aspx?from=giohang&r=" + Math.random(), function (data, status) {
                                                            // alert("Data: " + data + "\nStatus: " + status);
                                                            $('#dataTables-example_wrapper').html(data);
                                                           // disablebuttonThemDV();
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
                                                                    alert('Vui lòng nhập liệu chính xác!');

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
                                                        if ($('#form1').isValid() == false)
                                                        {
                                                            alert("Nhập liệu chưa chính xác!");
                                                            return;
                                                        }
                                                       

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

                                                    function saveDichVu() {
                                                        if ($('#form1').isValid() == false) {
                                                            alert("Nhập liệu chưa chính xác!");
                                                            return;
                                                        }
                                                        var loaidvid = $('#DropDownListLoaiDV').val();
                                                        var idthoigian = $('#DropDownListThoiGian').val();
                                                        var ngaydv = $('#TextBoxNgayDV').val();
                                                        var portid = $('#DropDownListAport').val();
                                                        //alert(loaisp+ idsp+ngadv);
                                                        //return;
                                                        $.ajax({
                                                            url: 'ajax.aspx?from=savedichvu&r=' + Math.random(),
                                                            type: 'POST',
                                                            cache: false,
                                                            data: 'loaidvid=' + loaidvid + '&idthoigian=' + idthoigian + '&ngaydv=' + ngaydv + '&portid=' + portid,
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
                                                    <asp:TextBox ID="TextBoxSoLuong" data-validation="number" Text="1" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                                <div class="form-group">
                                                    <label>Chọn ngày:</label>
                                                    <asp:TextBox ID="TextBoxNgaySP" data-validation="required" runat="server"  CssClass="form-control"></asp:TextBox>
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
                                                    <input type="button" name="ButtonHoanThanh" onclick="hoanthanhclick()" value="Hoàn thành" id="ButtonHoanThanh" style="height:50px;width:150px;">
                                                       <script>
                                                           function hoanthanhclick()
                                                           {
                                                               if (!confirm("Bạn có chắc là muốn hoàn thành đơn hàng này!"))
                                                               {
                                                                   return;
                                                               }
                                                               //javascript:window.location='Ainfo.aspx?from=hoanthanh'
                                                              
                                                                   $.get("ajax.aspx?from=kiemtratien&r=" + Math.random(), function (data, status) {
                                                                       // alert("Data: " + data + "\nStatus: " + status);
                                                                       if (data == "0")
                                                                       {
                                                                           alert("Tài khoản không đủ tiền!Vui lòng nạp thêm tiền.")
                                                                           return;
                                                                       }
                                                                       //disablebuttonThemDV();
                                                                       window.location = 'Ainfo.aspx?from=hoanthanh';
                                                                   });
                                                           }
                                                       </script> 
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
        $(document).ready(function () {

            
            $("#TextBoxSoTien").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A
                    (e.keyCode == 65 && e.ctrlKey === true) ||
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
        });


        if (navigator.userAgent.toLowerCase().indexOf("chrome") >= 0 || navigator.userAgent.toLowerCase().indexOf("safari") >= 0) {
            window.setInterval(function () {
                $('input:-webkit-autofill').each(function () {
                    var clone = $(this).clone(true, true);
                    $(this).after(clone).remove();
                });
            }, 20);
        }

    </script>
        

    </form>
    </body>

</html>
