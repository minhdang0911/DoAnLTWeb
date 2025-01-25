using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DOANWEB.Models;

namespace DOANWEB.Controllers
{
    public class testController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        // GET: test
        public ActionResult Index()
        {
            var all_sanpham = from ss in data.SanPhams select ss;
            return View(all_sanpham);
        }

        public ActionResult Head()
        {
            return View();

        }
        public ActionResult Detail(int id)
        {
            var D_sanpham = data.SanPhams.Where(m => m.masp == id).First();
            return View(D_sanpham);
        }


    }
}