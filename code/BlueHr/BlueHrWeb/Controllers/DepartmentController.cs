﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BlueHrLib.Data;
using BlueHrLib.Data.Model.Search;
using BlueHrLib.Service.Implement;
using BlueHrLib.Service.Interface;
using BlueHrWeb.Helpers;
using BlueHrWeb.Properties;
using Brilliantech.Framwork.Utils.LogUtil;
using MvcPaging;
using BlueHrWeb.CustomAttributes;

namespace BlueHrWeb.Controllers
{
    public class DepartmentController : Controller
    {

        IDepartmentService departmentService = new DepartmentService(Settings.Default.db);

        #region 部门列表

        [UserAuthorize]
        public ActionResult Index(int? page)
        {
            int pageIndex = PagingHelper.GetPageIndex(page);
            DepartmentSearchModel q = new DepartmentSearchModel();
            IPagedList<Department> departments = departmentService.Search(q).ToPagedList(pageIndex, Settings.Default.pageSize);

            ViewBag.Query = q;

            SetCompanyList(null);

            return View(departments);
        }

        public ActionResult Details(int id)
        {
            return View();
        }

        #endregion

        #region 创建部门



        public ActionResult Create()
        {
            //读取所有公司列表
            SetCompanyList(null);
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                var companyId = collection["CompanyId"];
                var departmentName = collection["name"];
                var departmentRemark = collection["remark"];

                var department = new Department()
                {
                    name = departmentName,
                    remark = departmentRemark,
                    companyId = int.Parse(companyId)
                };

                this.departmentService.Create(department);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        #endregion

        #region 编辑部门

        // GET: Department/Edit/5
        public ActionResult Edit(int id)
        {
            var department = this.departmentService.FindById(id);

            SetCompanyList(department.companyId, false);

            return View(department);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                var department = this.departmentService.FindById(id);
                if (department != null)
                {
                    department.name = collection["name"];
                    department.remark = collection["remark"];
                    this.departmentService.Update(department);
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                LogUtil.Logger.ErrorFormat("编辑部门时发生错误，详情：{0}", ex.Message);
                return View();
            }
        }

        #endregion

        #region 删除部门

        public ActionResult Delete(int id)
        {
            var department = this.departmentService.FindById(id);
            SetCompanyList(department.companyId, false);
            return View(department);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var department = this.departmentService.FindById(id);
                if (null != department)
                {
                    this.departmentService.DeleteById(id);
                }
                //IStaffService staffService = new StaffService(Settings.Default.db);
                //TODO:如果该部门下有员工，则不能删除该部门

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        #endregion

        public ActionResult Search([Bind(Include = "Name, CompanyId")] DepartmentSearchModel q)
        {
            int pageIndex = 0;
            int.TryParse(Request.QueryString.Get("page"), out pageIndex);
            pageIndex = PagingHelper.GetPageIndex(pageIndex);

            IDepartmentService ds = new DepartmentService(Settings.Default.db);

            IPagedList<Department> departments = ds.Search(q).ToPagedList(pageIndex, Settings.Default.pageSize);

            ViewBag.Query = q;

            SetCompanyList(q.CompanyId);

            return View("Index", departments);
        }

        private void SetCompanyList(int? type, bool allowBlank = true)
        {
            ICompanyService cs = new CompanyService(Settings.Default.db);

            CompanySearchModel csm = new CompanySearchModel();

            List<Company> companies = cs.Search(csm).ToList();

            List<SelectListItem> select = new List<SelectListItem>();

            if (allowBlank)
            {
                select.Add(new SelectListItem { Text = "", Value = "" });
            }

            foreach (var company in companies)
            {
                if (type.HasValue && type.Value == company.id)
                {
                    select.Add(new SelectListItem { Text = company.name, Value = company.id.ToString(), Selected = true });
                }
                else
                {
                    select.Add(new SelectListItem { Text = company.name, Value = company.id.ToString(), Selected = false });
                }
            }
            ViewData["companyList"] = select;
        }
    }
}
