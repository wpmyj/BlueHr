﻿using BlueHrLib.Service.Implement;
using BlueHrLib.Service.Interface;
using BlueHrWeb.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlueHrWeb.Controllers
{
    public class ExtraWorkTypeController : Controller
    {
        // GET: ExtraWorkType
        public ActionResult Index()
        {
            IExtraWorkTypeService s = new ExtraWorkTypeService(Settings.Default.db);
            return View(s.All());
        }
    }
}