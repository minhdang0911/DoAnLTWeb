using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DOANWEB.Models;

namespace DOANWEB.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu
        MyDataDataContext data = new MyDataDataContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult head()
        {
            return View();
        }

    }
}