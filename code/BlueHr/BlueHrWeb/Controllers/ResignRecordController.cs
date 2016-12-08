﻿using BlueHrLib.Data;
using BlueHrLib.Data.Enum;
using BlueHrLib.Data.Message;
using BlueHrLib.Data.Model.PageViewModel;
using BlueHrLib.Data.Model.Search;
using BlueHrLib.Helper;
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
    public class ResignRecordController : Controller
    {
        // GET: ResignType
        [UserAuthorize]
        [RoleAndDataAuthorizationAttribute]
        public ActionResult Index(int? page)
        {
            int pageIndex = PagingHelper.GetPageIndex(page);

            ResignRecordSearchModel q = new ResignRecordSearchModel();

            IResignRecordService rrs = new ResignRecordService(Settings.Default.db);

            IPagedList<ResignRecord> resignRecords = rrs.Search(q).ToPagedList(pageIndex, Settings.Default.pageSize);

            ViewBag.Query = q;

            return View(resignRecords);
        }

        [RoleAndDataAuthorizationAttribute]
        public ActionResult Search([Bind(Include = "Name")] ResignRecordSearchModel q)
        {
            int pageIndex = 0;
            int.TryParse(Request.QueryString.Get("page"), out pageIndex);
            pageIndex = PagingHelper.GetPageIndex(pageIndex);

            IResignRecordService rrs = new ResignRecordService(Settings.Default.db);

            IPagedList<ResignRecord> resignTypes = rrs.Search(q).ToPagedList(pageIndex, Settings.Default.pageSize);

            ViewBag.Query = q;

            return View("Index", resignTypes);
        }

        // GET: ResignType/Details/5
        [RoleAndDataAuthorizationAttribute]
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ResignType/Create
        [RoleAndDataAuthorizationAttribute]
        public ActionResult Create()
        {
            //SetDropDownList(null);
            return View();
        }

        // POST: ResignType/Create
        [RoleAndDataAuthorizationAttribute]
        [HttpPost]
        public JsonResult Create([Bind(Include = "resignTypeId, staffNr, resignEffectiveAt, resignReson")] ResignRecord resignRecord)
        {
            ResultMessage msg = new ResultMessage();

            try
            {
                msg = DoValidation(resignRecord);

                if (!msg.Success)
                {
                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    IResignRecordService rrs = new ResignRecordService(Settings.Default.db);

                    bool isSucceed = rrs.Create(resignRecord);

                    msg.Success = isSucceed;
                    msg.Content = isSucceed ? "添加成功" : "添加失败";

                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(new ResultMessage() { Success = false, Content = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        // GET: ResignType/Edit/5
        [RoleAndDataAuthorizationAttribute]
        public ActionResult Edit(int id)
        {
            IResignTypeService cs = new ResignTypeService(Settings.Default.db);

            ResignType jt = cs.FindById(id);
            //SetDropDownList(jt);
            return View(jt);
        }

        // POST: ResignType/Edit/5
        [RoleAndDataAuthorizationAttribute]
        [HttpPost]
        public JsonResult Edit([Bind(Include = "id, name,code, remark")] ResignRecord resignRecord)
        {
            ResultMessage msg = new ResultMessage();

            try
            {
                msg = DoValidation(resignRecord);

                if (!msg.Success)
                {
                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    IResignRecordService cs = new ResignRecordService(Settings.Default.db);
                    bool isSucceed = cs.Update(resignRecord);

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

        // GET: ResignType/Delete/5
        [RoleAndDataAuthorizationAttribute]
        public ActionResult Delete(int id)
        {
            IResignTypeService cs = new ResignTypeService(Settings.Default.db);

            ResignType cp = cs.FindById(id);
            //SetDropDownList(cp);
            return View(cp);
        }

        // POST: ResignType/Delete/5
        [RoleAndDataAuthorizationAttribute]
        [HttpPost]
        public JsonResult Delete(int id, FormCollection collection)
        {
            ResultMessage msg = new ResultMessage();

            try
            {
                //存在员工时不可删除
                IResignRecordService shfSi = new ResignRecordService(Settings.Default.db);
                List<ResignRecord> shf = shfSi.FindByResignType(id);

                if (null != shf && shf.Count() > 0)
                {
                    msg.Success = false;
                    msg.Content = "离职类型正在使用,不能删除!";

                    return Json(msg, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    IResignTypeService cs = new ResignTypeService(Settings.Default.db);
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
        public ResultMessage DoValidation(ResignRecord resignRecord)
        {
            ResultMessage msg = new ResultMessage();

            if (string.IsNullOrWhiteSpace(resignRecord.resignTypeId.ToString()))
            {
                msg.Success = false;
                msg.Content = "离职类型不能为空";

                return msg;
            }

            if (string.IsNullOrEmpty(resignRecord.staffNr))
            {
                msg.Success = false;
                msg.Content = "离职员工不能为空";

                return msg;
            }

            if (string.IsNullOrWhiteSpace(resignRecord.resignEffectiveAt.ToString()))
            {
                msg.Success = false;
                msg.Content = "离职生效日期不能为空";

                return msg;
            }

            return new ResultMessage() { Success = true, Content = "" };
        }


        [HttpPost]
        public JsonResult IsResignTypeExit(string resignType)
        {

            IResignTypeService rts = new ResignTypeService(Settings.Default.db);
            ResignType getResignType = rts.IsResignTypeExit(resignType);

            Dictionary<string, string> rt = new Dictionary<string, string>();

            rt.Add("ID", getResignType.id.ToString());
            rt.Add("Code", getResignType.code);
            rt.Add("Name", getResignType.name);
            rt.Add("Remark", getResignType.remark);

            return Json(rt, JsonRequestBehavior.DenyGet);
        }

        private void SetAllTableName(bool allowBlank = false)
        {
            List<SelectListItem> select = new List<SelectListItem>();

            IResignTypeService at = new ResignTypeService(Settings.Default.db);

            var ResignType = at.GetAllTableName();

            if (ResignType != null)
            {
                //获取当前记录的属性
                foreach (var property in ResignType[0].GetType().GetProperties())
                {
                    select.Add(new SelectListItem { Text = property.Name, Value = property.Name });
                }
            }

            ViewData["getAllTableNameList"] = select;
        }

        private void SetSearchConditions(bool? type, bool allowBlank = false)
        {
            var item = EnumHelper.GetList(typeof(SearchConditions));

            List<SelectListItem> select = new List<SelectListItem>();

            if (allowBlank)
            {
                select.Add(new SelectListItem { Text = "", Value = "" });
            }

            foreach (var it in item)
            {
                if (type.HasValue && type.ToString().Equals(it.Value))
                {
                    select.Add(new SelectListItem { Text = it.Text, Value = it.Value.ToString(), Selected = true });
                }
                else
                {
                    select.Add(new SelectListItem { Text = it.Text, Value = it.Value.ToString(), Selected = false });
                }
            }
            ViewData["searchConditionsList"] = select;
        }
    }
}