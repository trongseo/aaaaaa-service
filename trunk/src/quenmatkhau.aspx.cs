using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class quenmatkhau : CommonPageN
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        
       

    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        //Member mb = MemberManager.GetMemberFromUserNameAndPass(UserTextBox.Text, MyUtilities.HashPassWord(PassTextBox.Text));
        System.Collections.Hashtable hs = new Hashtable();
        hs["email"] = UserTextBox.Text.Trim();
      
        var dr = myUti.GetDataRowNull("Select * from Anhanvien where email=@email", hs);
        if (dr == null)
        {
            SystemUti.Show("Email này không tồn tại!");
        }
        else
        {
            SERVICEserver.wsSoapClient svc = new SERVICEserver.wsSoapClient();
           // MySession.Current.SSMatKhauadmin = numRand;
            svc.SendMailToGood(UserTextBox.Text.Trim(), "Ten dang nhap:" + dr["tendangnhap"].ToString() + "<br/> Mat khau:" + dr["Matkhau"].ToString(), "easywash.vn quen mat khau");

            //SystemUti.SendMailToGood(UserTextBox.Text.Trim(), "easywash.vn quen mat khau", "Ten dang nhap:" + dr["tendangnhap"].ToString() + "<br/> Mat khau:" + dr["Matkhau"].ToString());
            SystemUti.Show("Vui lòng kiểm tra mail kể cả trong spam!Thanks","window.location.href='login.aspx'");
        }
        
    }
    protected void ButtonLoginBarcode_Click(object sender, EventArgs e)
    {
       
    }
}