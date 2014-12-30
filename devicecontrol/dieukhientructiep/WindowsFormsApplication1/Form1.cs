using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string data = serialPort1.ReadLine();
            //button1.Text = data;
        }

        private void button1_Click(object sender, EventArgs e)
        {

            serialPort1.Write(textBox1.Text);
        }
        string idcuahang = "1";
        private void Form1_Load(object sender, EventArgs e)
        {
            string m_exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);


            string[] lines = System.IO.File.ReadAllLines(m_exePath + "\\" + "idcuahang.txt");
            idcuahang = lines[0];
            string comid = lines[1];
            serialPort1.PortName = comid;
            if (!serialPort1.IsOpen)
            {

                serialPort1.Open();
            }
        }

        private void buttonMo_Click(object sender, EventArgs e)
        {
            string sele = comboBox1.SelectedItem.ToString();
            serialPort1.Write(sele+"1");
        }

        private void buttonTat_Click(object sender, EventArgs e)
        {
            string sele = comboBox1.SelectedItem.ToString();
            serialPort1.Write(sele + "0");
        }
    }
}
