using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DOANWEB.Models;

namespace DOANWEB.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        MyDataDataContext data = new MyDataDataContext();

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult ListDonHang()
        {
            var all_sanpham = from ss in data.DONHANGs select ss;
            return View(all_sanpham);
        }


        public ActionResult Listchitiet()
        {
            var all_chitietdonhang = from ss in data.CHITIETDONHANGs select ss;
            return View(all_chitietdonhang);
        }


        public ActionResult Listsp()
        {
            var all_sanpham = from ss in data.SanPhams select ss;
            return View(all_sanpham);
        }
        public ActionResult Detail(int id)
        {
            var D_sanpham = data.SanPhams.Where(m => m.masp == id).First();
            return View(D_sanpham);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(FormCollection collection, SanPham sp)
        {
            var E_tensanpham = collection["tensanpham"];
            var E_hinh = collection["hinh"];
            var E_giaban = Convert.ToDecimal(collection["giaban"]);
            var E_ngaycapnhat = Convert.ToDateTime(collection["ngaycapnhat"]);
            var E_soluongton = Convert.ToInt32(collection["soluongton"]);
            if (string.IsNullOrEmpty(E_tensanpham))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                sp.tensp = E_tensanpham.ToString();
                sp.hinh = E_hinh.ToString();
                sp.giaban = E_giaban;
                sp.ngaycapnhat = E_ngaycapnhat;
                sp.soluongton = E_soluongton;
                data.SanPhams.InsertOnSubmit(sp);
                data.SubmitChanges();
                return RedirectToAction("Listsp","Admin");
            }
            return this.Create();
        }

        public ActionResult Edit(int id)
        {
            var E_sanpham = data.SanPhams.First(m => m.masp== id);
            return View(E_sanpham);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var E_sanpham = data.SanPhams.First(m => m.masp == id);
            var E_tensanpham = collection["tensach"];
            var E_hinh = collection["hinh"];
            var E_giaban = Convert.ToDecimal(collection["giaban"]);
            var E_ngaycapnhat = Convert.ToDateTime(collection["ngaycatnhat"]);
            var E_soluongton = Convert.ToInt32(collection["soluongton"]);
            E_sanpham.masp= id;
            if (string.IsNullOrEmpty(E_tensanpham))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                E_sanpham.tensp= E_tensanpham;
                E_sanpham.hinh = E_hinh;
                E_sanpham.giaban = E_giaban;
                E_sanpham.ngaycapnhat = E_ngaycapnhat;
                E_sanpham.soluongton = E_soluongton;
                UpdateModel(E_sanpham);
                data.SubmitChanges();
                return RedirectToAction("Listsp");
            }
            return this.Edit(id);
        }

        public ActionResult Delete(int id)
        {
            var D_sanpham = data.SanPhams.First(m => m.masp == id);
            return View(D_sanpham);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_sach = data.SanPhams.Where(m => m.masp == id).First();
            data.SanPhams.DeleteOnSubmit(D_sach);
            data.SubmitChanges();
            return RedirectToAction("Listsp");
        }


        public string ProcessUpload(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return "";
            }
            file.SaveAs(Server.MapPath("~/Content/images/" + file.FileName));
            return "/Content/images/" + file.FileName;
        }


        public ActionResult DangNhap(FormCollection collection)
        {
            var tendangnhap = collection["TenDangNhap"];
            var matkhau = collection["MatKhau"];
            Admin ad = data.Admins.SingleOrDefault(n => n.TenDangNhapAdmin== tendangnhap && n.MatKhauAdmin== matkhau);
            if (ad!= null)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["TaiKhoan"] = ad;
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return RedirectToAction("Index", "Admin");
        }


    }
}