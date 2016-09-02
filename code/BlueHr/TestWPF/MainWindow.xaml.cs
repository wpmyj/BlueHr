﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using BlueHrLib.Data;
using BlueHrLib.Data.Enum;
using BlueHrLib.MQTask;
using BlueHrLib.Service.Implement;
using BlueHrLib.Service.Interface;
using Brilliantech.Framwork.Utils.LogUtil;
using TestWPF.Properties;
using BlueHrLib.MQTask.Parameter;
using BlueHrLib.Helper;

namespace TestWPF
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void createStaffBtn_Click(object sender, RoutedEventArgs e)
        {
           
            for (int i = 0; i < 4000; i++)
            { IStaffService ss = new StaffService(Settings.Default.db);
            List<Staff> staffs = new List<Staff>();
                staffs.Add(new Staff() { nr = i.ToString(), id = i.ToString(), workStatus = (int)WorkStatus.OnWork, companyId = 1, departmentId = 1 });
                ss.Creates(staffs);
            }
           
        }

        System.Timers.Timer timer;

        private void button_Click(object sender, RoutedEventArgs e)
        {
            LogUtil.Logger.Info("服务启动中....");
            
            timer = new System.Timers.Timer();
            timer.Interval = Settings.Default.interval;
            timer.Enabled = true;
            timer.Elapsed += Timer_Elapsed;
            timer.Start();
            LogUtil.Logger.Info("服务启动【成功】");
        }

        private void Timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            timer.Stop();
            try
            {
                LogUtil.Logger.Info("获取任务信息....");
                new TaskDispatcher(Settings.Default.db, Settings.Default.queue).FetchMQMessage();
                LogUtil.Logger.Info("任务运行结束");
            }
            catch (Exception ex)
            {
                LogUtil.Logger.Error("服务运行时出错", ex);
            }

            timer.Start();
        }

        private void button_Copy_Click(object sender, RoutedEventArgs e)
        {
            DateTime startDateTime =DateTime.Parse( startDate.Text +" "+ timeTB.Text);

            DateTime endDateTime = DateTime.Parse(endDate.Text + " " + timeTB.Text);
            
            for(DateTime dt = startDateTime; dt <= endDateTime; dt=dt.AddDays(1))
            {
                CalAtt calAttParam = new CalAtt()
                {
                    AttDateTime = dt
                };
             
                TaskSetting task = new TaskSetting()
                {
                    TaskCreateAt = DateTime.Now,
                    TaskType = TaskType.CalAtt,
                    JsonParameter = JSONHelper.stringify(calAttParam)

                }; 
                new TaskDispatcher(Settings.Default.queue).SendMQMessage(task);
            }

            MessageBox.Show("OK");
        }
    }
}
