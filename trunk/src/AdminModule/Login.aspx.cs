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

public partial class AdminModule_Login : CommonPageN
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        DataTable dtc = myUti.GetDataTable("Select TenCuaHang AS title,id AS id from ACuaHang ");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        
        if (GetPara("from") == "logout")
        {
            Session.Clear();
        }
        Label1.Visible = false;

    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        //Member mb = MemberManager.GetMemberFromUserNameAndPass(UserTextBox.Text, MyUtilities.HashPassWord(PassTextBox.Text));
        System.Collections.Hashtable hs = new Hashtable();
        hs["Username"] = UserTextBox.Text.Trim();
        hs["HashedPassword"] = PassTextBox.Text;
        if (UserTextBox.Text != "admin") return;

        DataTable dt = myUti.GetDataTable("Select * from Member where Username=@Username and HashedPassword=@HashedPassword", hs);
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
        }
        else
        {
            
             MySession.Current.SSUsername = dt.Rows[0]["Username"].ToString();
             MySession.Current.SSUserId = dt.Rows[0]["Id"].ToString();
             MySession.Current.SSCuaHangId = DropDownList1.SelectedValue;
             MySession.Current.SSTenCuaHang = DropDownList1.SelectedItem.Text;
              string numRand = SystemUti.RandomNumber(100, 999).ToString();
             // SERVICEserver.wsSoapClient svc = new SERVICEserver.wsSoapClient();
              MySession.Current.SSMatKhauadmin = numRand;
            //  svc.SendMailToGood("trongtayninh@gmail.com", "mat khau:" + numRand, "Mat khau admin:" + numRand);
            //  svc.SendMailToGood("ngoc.rainbow5color@gmail.com", "mat khau:" + numRand, "Mat khau admin:" + numRand);

              SystemUti.SendMailToGood1("vn.lethanhphong@gmail.com", "mat khau:" + numRand, "Mat khau admin:" + numRand);

              SystemUti.SendMailToGood1("ngoc.rainbow5color@gmail.com", "mat khau:" + numRand, "Mat khau admin:" + numRand);

              SystemUti.SendMailToGood1("trongtayninh@gmail.com", "mat khau:" + numRand, "Mat khau admin:" + numRand);

              Response.Redirect("Login1.aspx");
             //if (Request["href"] != null)
             //{
             //    Response.Redirect(Request["href"]);
             //}
             //else
             //    Response.Redirect("NhanVienlist.aspx");

           
        }
    }
}