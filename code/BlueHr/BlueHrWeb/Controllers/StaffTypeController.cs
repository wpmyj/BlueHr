﻿using BlueHrLib.Data;
using BlueHrLib.Data.Message;
using BlueHrLib.Data.Model.PageViewModel;
using BlueHrLib.Data.Model.Search;
using BlueHrLib.Service.Implement;
using BlueHrLib.Service.Interface;
using BlueHrWeb.Helpers;
using BlueHrWeb.Properties;
using MvcPaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BlueHrWeb.CustomAttributes;

namespace BlueHrWeb.Controllers
{
    public class StaffTypeController : Controller
    {
        // GET: StaffType
        [UserAuthorize]
        public ActionResult Index(int? page)
        {
            int pageIndex = PagingHelper.GetPageIndex(page);

            StaffTypeSearchModel q = new StaffTypeSearchModel();

            IStaffTypeService ss = new StaffTypeService(Settings.Default.db);

            IPagedList<StaffType> staffTypes = ss.Search(q).ToPagedList(pageIndex, Settings.Default.pageSize);

            ViewBag.Query = q;

            StaffTypeInfoModel info = ss.GetStaffTypeInfo(q);
            ViewBag.Info = info;

            return View(staffTypes);
        }

        public ActionResult Search([Bind(Include = "Name")] StaffTypeSearchModel q)
        {
            int pageIndex = 0;
            int.TryParse(Request.QueryString.Get("page"), out pageIndex);
            pageIndex = PagingHelper.GetPageIndex(pageIndex);

            IStaffTypeService ss = new StaffTypeService(Settings.Default.db);

            IPagedList<StaffType> staffTypes = ss.Search(q).ToPagedList(pageIndex, Settings.Default.pageSize);

            ViewBag.Query = q;

            return View("Index", staffTypes);
        }

        // GET: StaffType/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: StaffType/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: StaffType/Create
        [HttpPost]
        public JsonResult Create([Bind(Include = "Name, remark")] StaffType staffType)
        {
            ResultMessage msg = new ResultMessage();

            try
            {
                msg = DoValidation(staffType);

                if (!msg.Success)
                {
                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    IStaffTypeService cs = new StaffTypeService(Settings.Default.db);
                    bool isSucceed = cs.Create(staffType);

                    msg.Success = isSucceed;
                    msg.Content = isSucceed ? "" : "添加失败";

                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(new ResultMessage() { Success = false, Content = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        // GET: StaffType/Edit/5
        public ActionResult Edit(int id)
        {
            IStaffTypeService cs = new StaffTypeService(Settings.Default.db);

            StaffType dgt = cs.FindById(id);

            return View(dgt);
        }

        // POST: StaffType/Edit/5
        [HttpPost]
        public JsonResult Edit([Bind(Include = "id, name, remark")] StaffType staffType)
        {
            ResultMessage msg = new ResultMessage();

            try
            {
                msg = DoValidation(staffType);

                if (!msg.Success)
                {
                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    IStaffTypeService cs = new StaffTypeService(Settings.Default.db);
                    bool isSucceed = cs.Update(staffType);

                    msg.Success = isSucceed;
                    msg.Content = isSucceed ? "" : "更新失败";

                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(new ResultMessage() { Success = false, Content = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        // GET: StaffType/Delete/5
        public ActionResult Delete(int id)
        {
            IStaffTypeService cs = new StaffTypeService(Settings.Default.db);

            StaffType dgt = cs.FindById(id);

            return View(dgt);
        }

        // POST: StaffType/Delete/5
        [HttpPost]
        public JsonResult Delete(int id, FormCollection collection)
        {
            ResultMessage msg = new ResultMessage();

            try
            {
                //存在员工时不可删除
                IStaffService shfSi = new StaffService(Settings.Default.db);
                List<Staff> shf = shfSi.FindByStaffType(id);

                if (null != shf && shf.Count() > 0)
                {
                    msg.Success = false;
                    msg.Content = "人员类型信息正在使用,不能删除!";

                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    IStaffTypeService cs = new StaffTypeService(Settings.Default.db);
                    bool isSucceed = cs.DeleteById(id);

                    msg.Success = isSucceed;
                    msg.Content = isSucceed ? "" : "删除失败";

                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(new ResultMessage() { Success = false, Content = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        //4.2	人员类别管理
        //（列表（分页）、新建、编辑、删除（存在员工时不可删除）
        //）：名称（不可空），备注（可空）   
        public ResultMessage DoValidation(StaffType model)
        {
            ResultMessage msg = new ResultMessage();

            if (string.IsNullOrEmpty(model.name))
            {
                msg.Success = false;
                msg.Content = "人员类型名称不能为空";

                return msg;
            }

            IStaffTypeService cs = new StaffTypeService(Settings.Default.db);
            List<StaffType> shift = cs.GetAll();

            if (model.id <= 0)
            {
                bool isRecordExists = shift.Where(p => p.name == model.name).ToList().Count() > 0;

                if (isRecordExists)
                {
                    msg.Success = false;
                    msg.Content = "数据已经存在!";

                    return msg;
                }
            }
            else
            {
                bool isRecordExists = shift.Where(p => p.name == model.name && p.id != model.id).ToList().Count() > 0;

                if (isRecordExists)
                {
                    msg.Success = false;
                    msg.Content = "数据已经存在!";

                    return msg;
                }
            }

            return new ResultMessage() { Success = true, Content = "" };
        }
    }
}
