using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ajax.Models;

namespace ajax.Controllers
{
    public class EmployeeController : Controller
    {
        //EmployeeContext employeeContext = new EmployeeContext();
        public ActionResult Index()
        {
            DbManage db = new DbManage();

            List<Department> list = db.Departments.ToList();
            List<Employee> listEmp = db.Employees.ToList();
            ViewBag.DepartmentList = new SelectList(list, "DepartmentId", "DepartmentName");
            ViewBag.ListEmp = new SelectList(listEmp);
            return View();
        }

        public List<Employee> getListEmp(int value)
        {
            DbManage db = new DbManage();
            List<Employee> listEmp = db.Employees.Where(p=>p.DepartmentId==value).ToList();
            return listEmp;
        }



        [HttpPost]
        public ActionResult Index(EmployeeModel model)
        {
            try
            {
                DbManage db = new DbManage();
                List<Department> list = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(list, "DepartmentId", "DepartmentName");

                Employee emp = new Employee();
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
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return View(model);
        }


    }
}