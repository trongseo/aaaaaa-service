using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
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

        private void Form1_Load(object sender, EventArgs e)
        {
            if (!serialPort1.IsOpen)
            {

                serialPort1.Open();
            }
        }
    }
}
