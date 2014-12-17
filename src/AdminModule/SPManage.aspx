<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="SPManage.aspx.cs" Inherits="AdminModule_NewsManage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Admin DSS</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="js/CheckBox.js"></script>
    <script type="text/javascript" src="js/general.js"></script>
       <script type="text/javascript" src="../jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
tinyMCE.init({

   // mode : "textareas",
  mode : "exact",
    elements : "DescriptionTextBox",

    theme : "advanced",

    entities : "",

    plugins : "inlinepopups,emotions,eBizLink,eBizImage,eBizIcon,paste,visualchars,eBizUpload",    
	//plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",

    theme_advanced_buttons1 : "fontselect,fontsizeselect,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,eBizQuote,forecolor,backcolor,|,emotions,eBizIcon,eBizLink,eBizImage,eBizUpload",

    theme_advanced_buttons2 : "numlist,outdent,indent,|,pastetext,pasteword,removeformat,code",	    

    theme_advanced_buttons3 : "",
    //theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
	//theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
	//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
	//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",


    theme_advanced_toolbar_location : "top",

    theme_advanced_toolbar_align : "left",

    theme_advanced_statusbar_location : "none",

    theme_advanced_resizing : false,		

    content_css : "examples/js/tinymce/css/content.css",

    setup: function(ed) {        

        ed.addButton('eBizQuote', {

                        title : 'Chèn trích dẫn',

                        'class' : 'mceIcon mce_blockquote',

                        onclick : function() {

                            if (ed.selection.getContent() != null && ed.selection.getContent() != '')

                            {

                                var quote = ed.selection.getContent();

                                ed.selection.setContent('[quote]' + quote + '[/quote]');

                            }                                                       

                        }

                    });

    }

}); 

</script>   
</head>
<body>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr align="right"> 
    <td height="25" colspan="2"><strong>QU&#7842;N L&Yacute; TH&Ocirc;NG TIN WEBSITE</strong>&nbsp;</td>
  </tr>
  <tr bgcolor="#00CCCC"> 
    <td width="59%" height="25"><strong></strong></td>
    <td width="41%" height="25" align="right" > 
      <strong> <a href="login.aspx?from=logout" class="style1">Tho&aacute;t</a>&nbsp; | &nbsp; <a href="#">&#272;&#7893;i m&#7853;t kh&#7849;u</a>&nbsp; 
      
      </strong></td>

  </tr>
</table>

					
    </td>

  </tr>
  <tr> 
    <td width="18%" valign="top"  class='lineR' >
     <!--#include file="hleftmenu.aspx"-->

    </td>
    <td width="82%" valign="top" style="padding-left:5px">  <form id="form1" runat="server">
    <div>
         <table width="100%" height="100%" border="0" align="left" cellpadding="4" cellspacing="1">
        <tr valign="bottom">
            <td width="100%">
                <table width="90%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%" height="22">
                            <img src="images/titlevector.jpg" width="20" height="18" align="absmiddle"></td>
                        <td width="6%" height="22" nowrap background="images/title_front.jpg">
                            <b>
                                <asp:Literal ID="LiteralTitle" runat="server" Text="Cập nhật thông tin"></asp:Literal>
                            </b>
                        </td>
                        <td width="92%" height="22" style="background-image: url(images/title_back.jpg)">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td height="10">
                        </td>
                        <td height="10" nowrap>
                            </td>
                        <td height="10">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 767px">
                            &nbsp;<table style="width: 100%">
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
                                        <asp:TextBox ID="TextBox1" runat="server" Width="268px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                                            Display="Dynamic" ErrorMessage="Vui lòng nhập!" ValidationGroup="xxx">Vui lòng nhập!</asp:RequiredFieldValidator></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr >
                                    <td style="width: 62px">
                                        Loại SP</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="178px">
                                        </asp:DropDownList></td>
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
<asp:Button ID="SaveButton" Text="Cập nhật" OnClick="SaveButton_Click" runat="server" Width="94px" /></td>
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
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 767px">
                          
                            <br />
                            <br />
                            &nbsp;<br />
</td>
                    </tr>
                    <tr>
                        <td style="width: 767px">
                            &nbsp;</td> 
                    </tr>
                    <tr>
                        <td style="width: 767px">
                            

</td> 
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
    </td>
  </tr>
  <tr> 
    <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr> 
    <td  height="5" > </td>
  </tr>
  <tr> 
    <td width="100%" align="center" valign="top" class="lineT"> Bản quyền thuộc </td>
  </tr>
</table>

    </td>
  </tr>
</table>
</body>
</html>
