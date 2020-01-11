using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CariMobil.Models;

namespace CariMobil.Controllers
{
    
    public class CariController : Controller
    {
        MobilCariEntities1 db = new MobilCariEntities1();


        // GET: Cari
        public ActionResult Index(string message)
        {
            var cariler = db.Cariler.Where(x=>x.sil==false).ToList();
            ViewBag.icerik = message;
            return View(cariler);
        }
        [HttpGet]
        // GET: Cari/Details/5
        public ActionResult Detay(int id, string message)
        {
            ViewBag.icerik = message;
            var cari = db.Cariler.Where(p => p.CariId == id).FirstOrDefault();
            var dosyalar = db.CariDosyalar.Where(m => m.sil == false && m.cariId == id).ToList();
            return View(new DetayModel() { cari = cari, dosyalar = dosyalar });
            
        }
        [HttpGet]
        public JsonResult CariSearch(SearchModel qry)
        {
            SearchResult srcResult = new SearchResult();
            var students = from s in db.Cariler
                           select s;
            if (!String.IsNullOrEmpty(qry.query))
            {
              
                students = students.Where(s => s.ad.Contains(qry.query) || s.tel.Contains(qry.query) || s.tel2.Contains(qry.query) || s.email.Contains(qry.query) && s.sil==false);
                srcResult.Data = students;
               
                
            }
            return Json(srcResult.Data, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Detay(HttpPostedFileBase[] files, int id)
        {
            
            if (ModelState.IsValid)
            {   //iterating through multiple file collection   
                foreach (HttpPostedFileBase file in files)
                {
                    //Checking file is available to save.  
                    if (file != null)
                    {
                        Random rand = new Random();
                        var randomValue=rand.Next(1000, 10000);
                        var InputFileName = Path.GetFileName(file.FileName);
                        InputFileName = randomValue+"_"+InputFileName;

                        CariDosyalar dosya = new CariDosyalar();
                        dosya.yuklenmeTarihi = DateTime.Now;
                        dosya.path = "/Uploads/CariUploads/" + InputFileName;
                        dosya.cariId = id;
                        dosya.sil = false;
                        var ServerSavePath = Path.Combine(Server.MapPath("~/Uploads/CariUploads/") + InputFileName);
                    
                        //Save file to server folder  
                        file.SaveAs(ServerSavePath);
                        //assigning file uploaded status to ViewBag for showing message to user.  
                        db.CariDosyalar.Add(dosya);
                        db.SaveChanges();

                    }

                }
            }
            var mymessage = "Dosya Yükleme İşlemi Başarılı.";
            return RedirectToAction("Detay/" + id, new { @message = mymessage });

        }
        [HttpGet]
        public ActionResult Ekle()
        {
            return View();
        }
        [HttpGet]
        public ActionResult dosyaSil(int id)
        {
            CariDosyalar dosya = new CariDosyalar();
            dosya = db.CariDosyalar.Find(id);
            db.CariDosyalar.Remove(dosya);
            db.SaveChanges();
            string fullPath = Request.MapPath(dosya.path);
            if (System.IO.File.Exists(fullPath))
            {
                System.IO.File.Delete(fullPath);
            }

            
            return Redirect(ControllerContext.HttpContext.Request.UrlReferrer.ToString()); 
        }
        // POST: Cari/Create
        [HttpPost]
        public ActionResult Ekle(Cariler collection)
        {
            try
            {
                collection.olTarih = DateTime.Now;
                collection.gunTarih = DateTime.Now;
                collection.sil = false;
                db.Cariler.Add(collection);
                db.SaveChanges();
                // TODO: Add insert logic here
                var message = "Cari Ekleme İşlemi Başarılı.";
                return RedirectToAction("Index", new { @message = message });
            }
            catch
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult dosyaSil()
        {
            return View();
        }
            // GET: Cari/Edit/5
            public ActionResult Duzenle(int id)
        {
            var cari = db.Cariler.Where(p => p.CariId == id).FirstOrDefault();
            return View(cari);
        }

        // POST: Cari/Edit/5
        [HttpPost]
        public ActionResult Duzenle(Cariler collection)
        {
            try
            {
                var cari = db.Cariler.Find(collection.CariId);
                cari.ad = collection.ad;
                cari.email = collection.email;
                cari.tel = collection.tel;
                cari.tel2 = collection.tel2;
                cari.fax = collection.fax;
                cari.gunTarih = DateTime.Now;
                db.SaveChanges();
                var message = "Güncelleme İşlemi Başarılı.";
                return RedirectToAction("Index", new { @message = message });
            }
            catch
            {
                return View();
            }
        }

        // GET: Cari/Delete/5
        [HttpGet]
        public ActionResult Sil(int id)
        {
            var cari = db.Cariler.Find(id);
            cari.sil = true;
            db.SaveChanges();
            var message = "Silme İşlemi Başarılı.";
            return RedirectToAction("Index", new { @message = message });
        }

    }
}
