<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCLeftAdmin.ascx.cs" Inherits="AdminModule_UCLeftAdmin" %>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       <%-- <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>--%>
                       <%-- <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboasssssrd</a>
                        </li>--%>
                       <%-- <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>--%>
                            <li>
                            <a href="NapTien.aspx"><i class="fa fa-dashboard fa-fw"></i> Nạp tiền</a>
                        </li>
                          <li>
                            <a href="Barcode.aspx"><i class="fa fa-dashboard fa-fw">  </i> Cấp barcode  </a>
                        </li>
                         <li >
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Dịch vụ <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                              
                                  <li>
                                    <a href="DichVu.aspx" >Thêm  Dịch vụ</a>
                                </li><li>
                                    <a href="DichVuList.aspx" >DS Dịch vụ</a>
                                </li>
                                 <li>
                                    <a href="DVGroupList.aspx" >Danh mục Dịch vụ</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                          <li >
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Sản phẩm<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                              
                                  <li>
                                    <a href="ItemUpdate.aspx" >Thêm  sản phẩm</a>
                                </li><li>
                                    <a href="ItemList.aspx" >DS sản phẩm</a>
                                </li>
                                 <li>
                                    <a href="GroupList.aspx" >Danh mục sản phẩm</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                             <li >
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Nhập Kho Sản phẩm<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="NhapKho.aspx" >Thêm phiếu nhập kho</a>
                                </li>
                                  <li>
                                    <a href="NhapKhoList.aspx" >DS phiếu nhập kho</a>
                                </li>
                                
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                         <li >
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Quản lý nhân viên<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="NhanVien.aspx" >Thêm nhân viên</a>
                                </li>
                                  <li>
                                    <a href="NhanVienList.aspx" >DS nhân viên </a>
                                </li>
                                
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        
                       
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>