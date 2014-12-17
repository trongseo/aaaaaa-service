<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCCustomer.ascx.cs" Inherits="UserControl_UCCustomer" %>

                                    <div class="module_left">
                                        <div>
                                            <div>
                                                <div>
                                                    <h3>
                                                         NGƯỜI DÙNG</h3>
                                                    <ul class="menu">
                                                        <li class="item215"><a href="Customers.aspx?SERVICE_TYPE=1" class='type1'><span>KHÁCH HÀNG PHIM HD</span></a></li>
                                                        <li
                                                            class="item216"><a href="Customers.aspx?SERVICE_TYPE=2" class='type2' ><span>KHÁCH HÀNG KARAOKE</span></a></li>
                                                            <li
                                                            class="item216"><a href="Customers.aspx?SERVICE_TYPE=3" class='type3'><span>KHÁCH HÀNG BIDA</span></a></li>
                                                            </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               <script>
                               $('.type'+<%= Session["SERVICE_TYPE"] %>).css('color','red');
                                 $('.type'+<%= Session["SERVICE_TYPE"] %>).css('font-size','14px');
                               </script>
