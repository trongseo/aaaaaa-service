using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.ServiceModel;
using System.Text;
using System.Windows.Forms;

namespace devicecontrol
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
           //// var dtget = getDataTable("Select * from AHisPort where isget=1");
           // var dtget = getDataTable("Select * from APort where isget=1");
           // if (doaction(dtget))
           // {
           //     UpdateStatus(dtget);
           // }
           //// dataGridView1.DataSource = getDataTable("Select * from acuahang");
         
        }
        string passwordservice ="zaq123!@#";
        public DataTable getDataTable(string sql)
        {
            try
            {
                WebService.wsSoapClient sv = new WebService.wsSoapClient();
                var dss = sv.GET_DATA_SET(sql, passwordservice);
                if (dss == null)
                {
                    return null;
                }
                return dss.Tables[0];
            }
            catch (EndpointNotFoundException es)
            {
                LogWriter ls = new LogWriter("khong truy cap duoc web getDataTable:" + DateTime.Now.ToString("HH:mm:ss") + es.ToString() );
                label1.Text = "khong truy cap duoc web:"+DateTime.Now.ToString("HH:mm:ss");
                return null;
            }
            catch (Exception esd)
            {
                LogWriter ls = new LogWriter(esd.ToString());
            }
            return null;
        }
        void ExecuteSQL(string sql)
        {
            try
            {
                WebService.wsSoapClient sv = new WebService.wsSoapClient();
                sv.ExecuteSQL(sql, passwordservice);
            }
            catch (EndpointNotFoundException es)
            {
                LogWriter ls = new LogWriter("khong truy cap duoc web ExecuteSQL");
                label1.Text = "khong truy cap duoc web:" + DateTime.Now.ToString("HH:mm:ss");
            }
            catch (Exception esd)
            {
                LogWriter ls = new LogWriter(esd.ToString());
            }

           
        }
        void UpdateStatus(DataTable dt)
        {
            if (dt == null)
            {
                return ;
            }
            string sql = "";
            string idin = "0";
            foreach (DataRow item in dt.Rows)
            {
                idin += "," + item["Id"].ToString();
            }
            sql = " update APort set isget=0 where id in(" + idin + ")";
            ExecuteSQL(sql);
        }
        bool doaction(DataTable dtget)
        {
            if (dtget==null)
            {
                return true;
            }
            if (dtget.Rows.Count==0)
            {
                return true;
            }
            try
            {
                label1.Text = dtget.Rows[0]["portnumber"].ToString() + dtget.Rows[0]["isoff"].ToString(); ;
                //LogWriter lg = new LogWriter(label1.Text);
                string offon = dtget.Rows[0]["isoff"].ToString();
                if (offon=="1")
                {
                    offon="0";
                }else{
                      offon="1";
                }
                serialPort1.Write(dtget.Rows[0]["portnumber"].ToString() + offon);
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        
            return false;
        }
        string idcuahang = "";
        private void timer1_Tick(object sender, EventArgs e)
        {

            var dtget = getDataTable("Select * from APort where isget=1 and acuahangid=" + idcuahang);
            if (doaction(dtget))
            {
                UpdateStatus(dtget);
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (textBox1.Text!="zaq123")
            {
                e.Cancel = true;
            }
           
        }
        public string GetPublicIP()
        {
            String direction = "";
            WebRequest request = WebRequest.Create("http://checkip.dyndns.org/");
            using (WebResponse response = request.GetResponse())
            using (StreamReader stream = new StreamReader(response.GetResponseStream()))
            {
                direction = stream.ReadToEnd();
            }

            //Search for the ip in the html
            int first = direction.IndexOf("Address: ") + 9;
            int last = direction.LastIndexOf("</body>");
            direction = direction.Substring(first, last - first);

            return direction;
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            label2.Text = GetPublicIP();
           
           string  m_exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            
       
           string[] lines = System.IO.File.ReadAllLines(m_exePath + "\\" + "idcuahang.txt");
           idcuahang = lines[0];
           ExecuteSQL("update acuahang set ip='" + label2.Text.Trim() + "' where id=" + idcuahang);
           string comid = lines[1];
           serialPort1.PortName = comid;
            try
            {
                if (!serialPort1.IsOpen)
                {
                    serialPort1.Open();
                }
            }
            catch (Exception ex)
            {
                LogWriter lg = new LogWriter(ex.ToString());
                MessageBox.Show("Không kết nối được với board mạch!" + ex.ToString());
            }
           
            mynotifyicon.Visible = true;
            mynotifyicon.ShowBalloonTip(500);
            this.Hide();
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            if (FormWindowState.Minimized == this.WindowState)
            {
                mynotifyicon.Visible = true;
                mynotifyicon.ShowBalloonTip(500);
                this.Hide();
            }

            else if (FormWindowState.Normal == this.WindowState)
            {
                mynotifyicon.Visible = false;
            }
        }

        private void mynotifyicon_Click(object sender, EventArgs e)
        {
            this.Show();
        }

        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {

        }
     
       
    }

    public class LogWriter
    {
        private string m_exePath = string.Empty;
        public LogWriter(string logMessage)
        {
            LogWrite(logMessage);
        }
        public void LogWrite(string logMessage)
        {
            m_exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            try
            {
                using (StreamWriter w = File.AppendText(m_exePath + "\\" + "log.txt"))
                {
                    Log(logMessage, w);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public void Log(string logMessage, TextWriter txtWriter)
        {
            try
            {
              txtWriter.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(),
                    DateTime.Now.ToLongDateString());
                txtWriter.WriteLine("  :{0}", logMessage);
                txtWriter.WriteLine("-------------------------------");
            }
            catch (Exception ex)
            {
            }
        }
    }

}
