using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ajax.Models;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using Newtonsoft.Json;

namespace ajax.Controllers
{
    public class EmployeeController : Controller
    {
        //EmployeeContext employeeContext = new EmployeeContext();
        public ActionResult Index()
        {
            Models.MVCTutorialEntities db = new Models.MVCTutorialEntities();

            List<Department> list = db.Departments.ToList();
            var listEmp = db.Employees.ToList();
            ViewBag.DepartmentList = new SelectList(list, "DepartmentId", "DepartmentName");
            ViewBag.ListEmp = new SelectList(listEmp);
            return View();
        }

        public ActionResult getListEmp()
        {
            Models.MVCTutorialEntities db = new Models.MVCTutorialEntities();
            var listEmp = db.Employees.ToList();
            return PartialView("_GetListEmp", listEmp);
        }

        [HttpPost]
        public JsonResult Index(EmployeeModel model)
        {
                Employee emp = new Employee();
            try
            {
                Models.MVCTutorialEntities db = new Models.MVCTutorialEntities();
                List<Department> list = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(list, "DepartmentId", "DepartmentName");

                emp.Address = model.Address;
                emp.Name = model.Name;
                emp.DepartmentId = model.DepartmentId;

                db.Employees.Add(emp);
                db.SaveChanges();

                int latestEmpId = emp.EmployeeId;


                Site site = new Site();
                site.SiteName = model.SiteName;
                site.EmployeeId = latestEmpId;

                db.Sites.Add(site);
                db.SaveChanges();
                return Json(emp, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        [HttpGet]
        public JsonResult GetEmployees()
        {
            Models.MVCTutorialEntities db = new Models.MVCTutorialEntities();
            db.Configuration.ProxyCreationEnabled = false;
            List<Employee> context = db.Employees.Select(e=>e).ToList();

            return Json(context, JsonRequestBehavior.AllowGet);
        }
    }
}