using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        private SBrowser_G.MiniblinkCallBackClass mb_callback;
        private SBrowser_G.MiniblinkAPI mb_api=new SBrowser_G.MiniblinkAPI();
        private int mb;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            mb_callback = new SBrowser_G.MiniblinkCallBackClass();

            mb_api.wkeInitializeEx(0);

            mb_callback.__MiniblinkCallBack_Event_wkeJsNativeFunction += wkeJsNativeFunction;
            mb_api.wkeJsBindFunction("test", mb_callback.wkeJsNativeFunction, 0, 2);

            mb = mb_api.wkeCreateWebWindow(2, (int)pictureBox1.Handle, 0, 0, pictureBox1.Width, pictureBox1.Height);
            mb_api.wkeShowWindow(mb, true);

            mb_callback.__MiniblinkCallBack_Event_wkeLoadUrlBeginCallback += wkeLoadUrlBeginCallback;
            mb_callback.__MiniblinkCallBack_Event_wkeCreateViewCallback += wkeLoadUrlBeginCallback;
            mb_callback.__MiniblinkCallBack_Event_wkeDownloadCallback += wkeDownloadCallback;

            mb_api.wkeOnLoadUrlBegin(mb, mb_callback.wkeLoadUrlBeginCallback, 0);
            mb_api.wkeOnCreateView(mb, mb_callback.wkeCreateViewCallback, 0);
            mb_api.wkeOnDownload(mb, mb_callback.wkeDownloadCallback, 0);
            

            mb_api.wkeLoadURL(mb, "http://www.baidu.com");
        }


        private void wkeLoadUrlBeginCallback(int webView,int param, string url,int job)
        {
            Console.WriteLine(url);
        }

        private void wkeLoadUrlBeginCallback(int webView, int param, SBrowser_G.wkeNavigationType navigationType, string url, ref SBrowser_G.wkeWindowFeatures windowFeatures)
        {
            Console.WriteLine("触发了wkeCreateViewCallback");
            mb_callback.Return_wkeCreateViewCallback = webView;
        }

        private void wkeJsNativeFunction(int es, int param)
        {
            Decimal tret1, tret2;
            tret1 = mb_api.jsArg(es, 0);
            tret2 = mb_api.jsArg(es, 1);
            MessageBox.Show(mb_api.jsToTempStringW(es, tret1) + "/" + mb_api.jsToTempStringW(es, tret2));
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            mb_api.wkeRunJSW(mb, "window.test('xcv','hj自行车5gj');");
        }

        private void wkeDownloadCallback(int webView, int param, string url)
        {
            Console.WriteLine("触发了下载事件，下载地址：" + url);
        }
    }
}
