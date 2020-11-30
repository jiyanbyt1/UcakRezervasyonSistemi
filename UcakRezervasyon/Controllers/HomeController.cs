using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

namespace UcakRezervasyon.Controllers
{
    public class HomeController : Controller
    {
        Fonksiyonlar f = new Fonksiyonlar();
        string sorgu; string sorgu2; DataTable dt; string sorguMusteri; string sorguKayit; int sayac = 0;   string sorgukoltuk; DataTable dt2; DataTable dt3; string sorgupuan; DataTable dtpuan; string sorgu4; DataTable dt4;
        List<SeferModeli> SeferListele = new List<SeferModeli>();
        List<SeferModeli> girislist = new List<SeferModeli>();
        List<SeferModeli> kayitlist = new List<SeferModeli>();
        List<Koltuklar> Koltuklars = new List<Koltuklar>();
        List<SeferModeli> BitirList = new List<SeferModeli>();
 





        public ActionResult Index()
        {
            return View();
        }
        public class SeferModeli
        {
            public string KoltukNumarasi { get; set; }
            public string Logo { get; set; }
            public string FirmaAdi { get; set; }
            public string Nereden { get; set; }
            public string Nereye { get; set; }
            public string Tarih { get; set; }
            public string Fiyat { get; set; }
            public string Saat { get; set; }
            public string SeferID { get; set; }
            public string Email { get; set; }
            public string Pass { get; set; }
            public string MusteriAdi { get; set; }
            public string MusteriSoyadi { get; set; }
            public string MusteriAdresi { get; set; }
            public string MusteriTel { get; set; }
            public string MusteriEposta { get; set; }
            public string MusteriSifre { get; set; }
           public string UcakID { get; set; }

            public string Mesaj { get; set; }

        }
        public class firma
        {
            public string FirmaAdi { get; set; }
            public string UcakID { get; set; }

        }

        public class Koltuklar
        {
            public string KoltukKonfor { get; set; }
            public string KoltukDurumu { get; set; }
        }
        public JsonResult SeferAra(FormCollection frm)
        {
            
            string nereden = frm["nereden"].ToString();
            string nereye = frm["nereye"].ToString();
            
            string tarih = frm["tarih"].ToString();
          



           // string tarih = gelen.Replace("mm/dd/yyyy", "dd-mm-yyyy");
            sorgu = "select * from Seferler where KalkisKonumu='" + nereden + "' and InisKonumu='" + nereye + "' and Tarih='" + tarih + "'";
            dt3 = f.GetDataTable(sorgu);
            
            
            for(int i = 0; i < dt3.Rows.Count; i++)
            {
                SeferModeli seferModeli = new SeferModeli()
                {
                    SeferID = dt3.Rows[i]["SeferID"].ToString(),
                    UcakID=dt3.Rows[i]["UcakID"].ToString(),
                    Logo=dt3.Rows[i]["Logo"].ToString(),
                    FirmaAdi = dt3.Rows[i]["FirmaAdi"].ToString(),
                    Nereden = dt3.Rows[i]["KalkisKonumu"].ToString(),
                    Nereye = dt3.Rows[i]["InisKonumu"].ToString(),
                    Tarih = dt3.Rows[i]["Tarih"].ToString(),
                    
                    Fiyat = dt3.Rows[i]["Fiyat"].ToString(),
                    Saat = dt3.Rows[i]["Saat"].ToString()
                  
                };
                SeferListele.Add(seferModeli);

            }
           
            return Json(SeferListele, JsonRequestBehavior.AllowGet);
            
        }
 
        public JsonResult GirisYap(FormCollection form)
        {

            string Email = form["kadi"].ToString();
            string Pass = form["sifre"].ToString();

            sorguMusteri = "select * From MusteriBilgileri where MusteriEposta='" + Email + "' and MusteriSifre='" + Pass + "'";
            dt = f.GetDataTable(sorguMusteri);

            

                Fonksiyonlar.MusteriID = dt.Rows[0]["MusteriID"].ToString();
                Fonksiyonlar.Ad = dt.Rows[0]["MusteriAdi"].ToString();
                Fonksiyonlar.Soyad = dt.Rows[0]["MusteriSoyadi"].ToString();
                Fonksiyonlar.Tel = dt.Rows[0]["MusteriTel"].ToString();
                Fonksiyonlar.Adres = dt.Rows[0]["MusteriAdresi"].ToString();
                Fonksiyonlar.mesaj1 = "Müşteri Bilgileri Otomatik Alınmıştır.";
                Fonksiyonlar.Aktiflik = "1";
                Fonksiyonlar.Email = Email;
                Fonksiyonlar.Pass = Pass;
                Fonksiyonlar.aktbuton = "Çıkış Yap";
                sorgu = "update MusteriBilgileri set Aktiflik='"+Fonksiyonlar.Aktiflik+ "' where MusteriEposta='" + Email+ "' and MusteriSifre='"+Pass+"'";
                dt2 = f.GetDataTable(sorgu);

           

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    SeferModeli giris = new SeferModeli()
                    {
                        Email = dt.Rows[i]["MusteriEposta"].ToString(),
                        Pass = dt.Rows[i]["MusteriSifre"].ToString(),
                        MusteriAdi = dt.Rows[i]["MusteriAdi"].ToString(),
                        MusteriSoyadi = dt.Rows[i]["MusteriSoyadi"].ToString()

                    };
                    girislist.Add(giris);
                
                }
                sorgu2 = "select * from Rezervasyon where MusteriAdi='" + dt.Rows[0]["MusteriAdi"].ToString() + "'";
                dt3 = f.GetDataTable(sorgu2);
                Fonksiyonlar.RezerveSayisi = dt3.Rows.Count;
            
          
            return Json(girislist, JsonRequestBehavior.AllowGet);
          


        }

        public JsonResult HesapAc(FormCollection frm)
        {
            string MusteriAdi = frm["ad"].ToString();
            string MusteriSoyadi = frm["soyad"].ToString();
            string MusteriAdresi = frm["adres"].ToString();
            string MusteriTel = frm["tel"].ToString();
            string MusteriEposta = frm["eposta"].ToString();
            string MusteriSifre = frm["sifre"].ToString();
            sorguKayit = "insert into MusteriBilgileri(MusteriAdi,MusteriSoyadi,MusteriAdresi,MusteriTel,MusteriEposta,MusteriSifre,Aktiflik) values('" + MusteriAdi + "', '" + MusteriSoyadi + "', '" + MusteriAdresi + "', '" + MusteriTel + "', '" + MusteriEposta + "', '" + MusteriSifre + "','"+Fonksiyonlar.Aktiflik+"')";
            dt = f.GetDataTable(sorguKayit);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SeferModeli seferModeli = new SeferModeli()
                {
                    MusteriAdi = dt.Rows[i]["MusteriAdi"].ToString(),
                    MusteriSoyadi = dt.Rows[i]["MusteriSoyadi"].ToString(),
                    MusteriAdresi = dt.Rows[i]["MusteriAdresi"].ToString(),
                    MusteriTel = dt.Rows[i]["MusteriTel"].ToString(),
                    MusteriEposta = dt.Rows[i]["MusteriEposta"].ToString(),
                    MusteriSifre = dt.Rows[i]["MusteriSifre"].ToString()
                };
                kayitlist.Add(seferModeli);
            }
            return Json(kayitlist, JsonRequestBehavior.AllowGet);


        }

        public ActionResult Giris()
        {
            return View();
        }
     
        public ActionResult HesapOlustur()
        {
            return View();
        }

       
        public ActionResult RezervasyonYap(string Logo,string SeferID,string UcakID,string FirmaAdi, string Nereden, string Nereye, string Tarih, string Saat, string Fiyat)
        {
           
            sorgu = "select * from Koltuklar where UcakID='" + UcakID + "'";
            dt = f.GetDataTable(sorgu);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Koltuklar koltuklar = new Koltuklar()
                {
                    KoltukDurumu = dt.Rows[i]["KoltukDurumu"].ToString(),
                    KoltukKonfor = dt.Rows[i]["Konfor"].ToString()
                };
                Koltuklars.Add(koltuklar);
            }
            ViewBag.Koltuklar = Koltuklars;

            ViewBag.SeferID = SeferID;


            ViewBag.Bilet = new List<string>
             {
                 
                 {SeferID},
                 {FirmaAdi},
                 {Nereden},
                 {Nereye},
                 {Tarih},
                 {Saat},
                 {Fiyat+" TL"}
                 };
            Fonksiyonlar.Logo = Logo;
            Fonksiyonlar.UcakID = UcakID;
            Fonksiyonlar.FirmaAdi = FirmaAdi;
            Fonksiyonlar.id = SeferID;
            Fonksiyonlar.Fiyat = Fiyat;
            Fonksiyonlar.Nereden = Nereden;
            Fonksiyonlar.Nereye = Nereye;
            Tarih= DateTime.Now.ToString("yyyy.MM.dd");
            Fonksiyonlar.Tarih = Tarih;
            
            Fonksiyonlar.Saat = Saat;

            return View();
        }

        public JsonResult RezervasyonTamamla(FormCollection frm)
        {
            int sefersayisi = Fonksiyonlar.RezerveSayisi;
            Fonksiyonlar.BiletAdi = frm["adi"].ToString();
            Fonksiyonlar.BiletSoyadi = frm["soyadi"].ToString();
            Fonksiyonlar.BiletTel = frm["tel"].ToString();
            Fonksiyonlar.BiletKoltuk = frm["Koltukid"].ToString();
            string GelenSeferID = Fonksiyonlar.id;
            string FirmaAdi = Fonksiyonlar.FirmaAdi;
            string Nereden = Fonksiyonlar.Nereden;
            string Nereye = Fonksiyonlar.Nereye;
            string Tarih = Fonksiyonlar.Tarih;
            string Saat = Fonksiyonlar.Saat;
            string UcakID = Fonksiyonlar.UcakID;
            string Logo = Fonksiyonlar.Logo;
            var durum = 1;

            sorgukoltuk = "update Koltuklar set KoltukDurumu='" + durum + "' where UcakID='" + UcakID + "' and KoltukNumarasi='" + Fonksiyonlar.BiletKoltuk + "'";
            dt2 = f.GetDataTable(sorgukoltuk);

            sorgu = "insert into Rezervasyon(SeferID,UcakID,Logo,FirmaAdi,MusteriAdi,MusteriSoyadi,MusteriTel,KalkisKonumu,InisKonumu,KoltukNumarasi,Fiyat,Tarih,Saat) values('"+GelenSeferID+"','"+UcakID+"','"+Logo+"','"+FirmaAdi+"','"+ Fonksiyonlar.BiletAdi + "','"+ Fonksiyonlar.BiletSoyadi + "','"+ Fonksiyonlar.BiletTel + "','"+Nereden+"','"+Nereye+"','"+ Fonksiyonlar.BiletKoltuk + "','"+Fonksiyonlar.Fiyat+"','"+ Tarih.Replace("dd.mm.yyyy","yyyy.mm.dd")+"','"+Saat+"')";
            dt = f.GetDataTable(sorgu);
            Fonksiyonlar.RezerveSayisi = sefersayisi + 1;

                

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sayac++;

                    SeferModeli seferModeli = new SeferModeli()
                    {
                        SeferID = dt.Rows[i]["SeferID"].ToString(),
                        UcakID = dt.Rows[i]["UcakID"].ToString(),
                        Logo=dt.Rows[i]["Logo"].ToString(),
                        FirmaAdi = dt.Rows[i]["FirmaAdi"].ToString(),
                        MusteriAdi = dt.Rows[i]["MusteriAdi"].ToString(),
                        MusteriSoyadi = dt.Rows[i]["MusteriSoyadi"].ToString(),
                        MusteriTel = dt.Rows[i]["MusteriTel"].ToString(),
                        Nereden = dt.Rows[i]["KalkisKonumu"].ToString(),
                        Nereye = dt.Rows[i]["InisKonumu"].ToString(),
                        KoltukNumarasi = dt.Rows[i]["KoltukNumarasi"].ToString(),
                        Fiyat = dt.Rows[i]["Fiyat"].ToString(),
                        Tarih = dt.Rows[i]["Tarih"].ToString(),
                        Saat = dt.Rows[i]["Saat"].ToString()
                    };
                    BitirList.Add(seferModeli);
                ViewBag.Rezervasyonlar = BitirList;
                }

     
            





            return Json(BitirList, JsonRequestBehavior.AllowGet);


        }
        public JsonResult CikisYap()
        {
            Fonksiyonlar.Aktiflik = "0";
            Fonksiyonlar.Ad = "";
            Fonksiyonlar.Soyad = "";
            Fonksiyonlar.Tel = "";
            Fonksiyonlar.mesaj1 = "";
            string GelenMail = Fonksiyonlar.Email;
            string GelenSifre = Fonksiyonlar.Pass;
           sorgu = "update MusteriBilgileri set Aktiflik='" + Fonksiyonlar.Aktiflik + "' where MusteriEposta='" + GelenMail + "' and MusteriSifre='" + GelenSifre + "'";
            dt2 = f.GetDataTable(sorgu);
            Fonksiyonlar.aktbuton = "Giriş Yap";
            string giden = Fonksiyonlar.Aktiflik;


            return Json(giden, JsonRequestBehavior.AllowGet);
        }



        public ActionResult Rezervasyonlarım(string KoltukNumarasi, string UcakID, string SeferID)
        {
            var sayi = Fonksiyonlar.RezerveSayisi;
            
            var k = "";
            Fonksiyonlar.gelenkoltuk = KoltukNumarasi;
            
            
            sorgu2 = "SELECT sum(Fiyat) as Fiyat from Rezervasyon where MusteriAdi='"+Fonksiyonlar.Ad+"'";
            dt3 = f.GetDataTable(sorgu2);
            k = dt3.Rows[0]["Fiyat"].ToString();
            if (k == "")
            {
                k = "0.0";
            }
            Fonksiyonlar.ToplamFiyat = Convert.ToDouble(k);
            sorgupuan = "select count(*) as puan from GecmisRezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "'";
            dtpuan = f.GetDataTable(sorgupuan);
            Fonksiyonlar.puan =Convert.ToInt32(dtpuan.Rows[0]["puan"].ToString());
            Fonksiyonlar.toplampuan = (Fonksiyonlar.puan * 0.1);
            Fonksiyonlar.fiyatson = (Fonksiyonlar.ToplamFiyat * Fonksiyonlar.toplampuan) / 100;
            Fonksiyonlar.fiyatson = Fonksiyonlar.ToplamFiyat - Fonksiyonlar.fiyatson;








            string durum = "false";
            sorgu = "delete from Rezervasyon where SeferID='" + SeferID + "' and KoltukNumarasi='" + Fonksiyonlar.gelenkoltuk + "'";
            dt = f.GetDataTable(sorgu);
   
            sorgukoltuk = "update Koltuklar set KoltukDurumu='" + durum + "' where UcakID='" + UcakID + "' and KoltukNumarasi='" + Fonksiyonlar.gelenkoltuk + "'";
            dt2 = f.GetDataTable(sorgukoltuk);
            if (Fonksiyonlar.gelenkoltuk != "" && Fonksiyonlar.gelenkoltuk != null)
            {
                Fonksiyonlar.RezerveSayisi = sayi - 1;
                Fonksiyonlar.gelenkoltuk = "";
                
            }
            
          
            sorgu2 = "SELECT sum(Fiyat) as Fiyat from Rezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "'";
            dt3 = f.GetDataTable(sorgu2);
            k = dt3.Rows[0]["Fiyat"].ToString();
            if (k == "")
            {
                k = "0.0";
            }
            Fonksiyonlar.ToplamFiyat = Convert.ToDouble(k);
            sorgupuan = "select count(*) as puan from GecmisRezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "'";
            dtpuan = f.GetDataTable(sorgupuan);
            Fonksiyonlar.puan = Convert.ToInt32(dtpuan.Rows[0]["puan"].ToString());
            Fonksiyonlar.toplampuan = (Fonksiyonlar.puan * 0.1);
            Fonksiyonlar.fiyatson = (Fonksiyonlar.ToplamFiyat * Fonksiyonlar.toplampuan) / 100;
            Fonksiyonlar.fiyatson = Fonksiyonlar.ToplamFiyat - Fonksiyonlar.fiyatson;
            KoltukNumarasi = "";
            return View();
        }




        public JsonResult SatinAl()
        {
            string MusteriAdi = Fonksiyonlar.Ad;
            string MusteriSoyadi = Fonksiyonlar.Soyad;
            sorgu = "select * from Rezervasyon where MusteriAdi='" + MusteriAdi + "' and MusteriSoyadi='" + MusteriSoyadi + "'";

            dt3 = f.GetDataTable(sorgu);
       
            for (int i = 0; i < dt3.Rows.Count; i++)
            {
                
                SeferModeli seferModeli = new SeferModeli()
                {
                    SeferID = dt3.Rows[i]["SeferID"].ToString(),
                    UcakID = dt3.Rows[i]["UcakID"].ToString(),
                    Logo = dt3.Rows[i]["Logo"].ToString(),
                    FirmaAdi = dt3.Rows[i]["FirmaAdi"].ToString(),
                    Nereden = dt3.Rows[i]["KalkisKonumu"].ToString(),
                    Nereye = dt3.Rows[i]["InisKonumu"].ToString(),
                    Tarih = dt3.Rows[i]["Tarih"].ToString(),
                    KoltukNumarasi = dt3.Rows[i]["KoltukNumarasi"].ToString(),
                    Fiyat = dt3.Rows[i]["Fiyat"].ToString(),
                    Saat = dt3.Rows[i]["Saat"].ToString()
                    
                };
                SeferListele.Add(seferModeli);

               
            }
            return Json(SeferListele, JsonRequestBehavior.AllowGet);
        }
        public JsonResult BiletSatis(FormCollection frm)
        {
            sorgu = "insert into GecmisRezervasyon(SeferID,UcakID,Logo,FirmaAdi,MusteriAdi,MusteriSoyadi,MusteriTel,KalkisKonumu,InisKonumu,KoltukNumarasi,Fiyat,Tarih,Saat) select SeferID,UcakID,Logo,FirmaAdi,MusteriAdi,MusteriSoyadi,MusteriTel,KalkisKonumu,InisKonumu,KoltukNumarasi,Fiyat,Tarih,Saat from Rezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "'";
            dt = f.GetDataTable(sorgu);
            sorgu2 = "delete from Rezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "'";
            dt2 = f.GetDataTable(sorgu2);
            Fonksiyonlar.RezerveSayisi = 0;
            return Json(SeferListele, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Profil()
        {
            return View();
        }
        
        public JsonResult Guncelle(FormCollection frm)
        {
            string MusteriAdi = frm["ad"].ToString();
            string MusteriSoyadi = frm["soyad"].ToString();
            string MusteriAdresi = frm["adres"].ToString();
            string MusteriTel = frm["tel"].ToString();
            string MusteriEposta = frm["eposta"].ToString();
            


            sorguKayit = "update MusteriBilgileri set MusteriAdi='"+MusteriAdi+"', MusteriSoyadi='"+MusteriSoyadi+"', MusteriAdresi='"+MusteriAdresi+"', MusteriTel='"+MusteriTel+"', MusteriEposta='"+MusteriEposta+"' where MusteriID='"+Fonksiyonlar.MusteriID+"'";
            dt = f.GetDataTable(sorguKayit);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SeferModeli seferModeli = new SeferModeli()
                {
                    MusteriAdi = dt.Rows[i]["MusteriAdi"].ToString(),
                    MusteriSoyadi = dt.Rows[i]["MusteriSoyadi"].ToString(),
                    MusteriAdresi = dt.Rows[i]["MusteriAdresi"].ToString(),
                    MusteriTel = dt.Rows[i]["MusteriTel"].ToString(),
                    MusteriEposta = dt.Rows[i]["MusteriEposta"].ToString(),
                    
                };
                kayitlist.Add(seferModeli);
            }

            ViewBag.seferModeli = kayitlist;
            ViewBag.Musteri = new List<string>
             {

                 {MusteriAdi},
                 {MusteriSoyadi},
                 {MusteriAdresi},
                 {MusteriTel},
                 {MusteriEposta},
                 };
            Fonksiyonlar.Ad = MusteriAdi;
            Fonksiyonlar.Soyad = MusteriSoyadi;
            Fonksiyonlar.Adres = MusteriAdresi;
            Fonksiyonlar.Tel = MusteriTel;
            Fonksiyonlar.Email = MusteriEposta;
            return Json(kayitlist, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SatinAlmaSayfasi(string KoltukNumarasi, string Logo, string SeferID, string UcakID, string FirmaAdi, string Nereden, string Nereye, string Tarih, string Saat, string Fiyat)
        {
            ViewBag.satinal = new List<string>
             {
                 {KoltukNumarasi},
                 {Logo},
                 {SeferID},
                 {FirmaAdi},
                 {Nereden},
                 {Nereye},
                 {Tarih},
                 {Saat},
                 {Fiyat+" TL"}
                 };
            Fonksiyonlar.Logo = Logo;
            Fonksiyonlar.BiletKoltuk = KoltukNumarasi;
            Fonksiyonlar.Nereden = Nereden;
            Fonksiyonlar.Nereye = Nereye;
            Fonksiyonlar.Tarih = Tarih;
            Fonksiyonlar.Saat = Saat;
            Fonksiyonlar.Fiyat = Fiyat;
            Fonksiyonlar.TekBiletFiyat =Convert.ToInt32(Fiyat);
            Fonksiyonlar.SeferID = SeferID;
            return View();
        }
        public JsonResult TekBiletAl(FormCollection frm)
        {
            
            if (Fonksiyonlar.Aktiflik == "1")
            {
                var toplam = 0;
                Fonksiyonlar.BiletAdi = frm["ad"].ToString();
                Fonksiyonlar.BiletSoyadi = frm["soyad"].ToString();
                Fonksiyonlar.BiletTel = frm["tel"].ToString();
                Fonksiyonlar.KartNumarasi = frm["kartnumarasi"].ToString();
                Fonksiyonlar.SonAy = frm["sontarih"].ToString();
                Fonksiyonlar.cvc = frm["cvc"].ToString();

                sorgu = "select * from KartBilgileri where KartNumarasi='" + Fonksiyonlar.KartNumarasi + "'";
                dt = f.GetDataTable(sorgu);
                int bakiye = Convert.ToInt32(dt.Rows[0]["Bakiye"].ToString());
                int id = Convert.ToInt32(dt.Rows[0]["KartID"].ToString());

                if (Fonksiyonlar.TekBiletFiyat < bakiye)
                {

                    sorgu2 = "insert into GecmisRezervasyon(SeferID,UcakID,Logo,FirmaAdi,MusteriAdi,MusteriSoyadi,MusteriTel,KalkisKonumu,InisKonumu,KoltukNumarasi,Fiyat,Tarih,Saat) select SeferID,UcakID,Logo,FirmaAdi,MusteriAdi,MusteriSoyadi,MusteriTel,KalkisKonumu,InisKonumu,KoltukNumarasi,Fiyat,Tarih,Saat from Rezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "' and KoltukNumarasi='" + Fonksiyonlar.BiletKoltuk + "'";
                    dt2 = f.GetDataTable(sorgu2);
                
                    sorguKayit = "delete from Rezervasyon where MusteriAdi='" + Fonksiyonlar.Ad + "' and KoltukNumarasi='" + Fonksiyonlar.BiletKoltuk + "'";
                    dt3 = f.GetDataTable(sorguKayit);
                    toplam = bakiye - Fonksiyonlar.TekBiletFiyat;


                    sorgu4 = "update KartBilgileri set Bakiye='" + toplam + "' where KartID='" + id + "'";
                    dt4 = f.GetDataTable(sorgu4);

                    Fonksiyonlar.RezerveSayisi -= 1;


                    SeferModeli seferModeli = new SeferModeli()
                    {
                        Mesaj = "Başarıyla Satın Alınmıştır..."

                    };
                    kayitlist.Add(seferModeli);


                }
                else
                {
                    SeferModeli seferModeli = new SeferModeli()
                    {
                        Mesaj = "Bakiyeniz Yetersizdir..."

                    };
                    kayitlist.Add(seferModeli);
                    return Json(kayitlist, JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                var toplam = 0;
                Fonksiyonlar.BiletAdi = frm["ad"].ToString();
                Fonksiyonlar.BiletSoyadi = frm["soyad"].ToString();
                Fonksiyonlar.BiletTel = frm["tel"].ToString();
                Fonksiyonlar.KartNumarasi = frm["kartnumarasi"].ToString();
                Fonksiyonlar.SonAy = frm["sontarih"].ToString();
                Fonksiyonlar.cvc = frm["cvc"].ToString();
                Fonksiyonlar.BiletKoltuk = frm["Koltukid"].ToString();

                sorgu = "select * from KartBilgileri where KartNumarasi='" + Fonksiyonlar.KartNumarasi + "'";
                dt = f.GetDataTable(sorgu);
                int bakiye = Convert.ToInt32(dt.Rows[0]["Bakiye"].ToString());
                int id = Convert.ToInt32(dt.Rows[0]["KartID"].ToString());

                if (Fonksiyonlar.TekBiletFiyat < bakiye)
                {
                    var durum = 1;

                    sorgukoltuk = "update Koltuklar set KoltukDurumu='" + durum + "' where UcakID='" + Fonksiyonlar.UcakID + "' and KoltukNumarasi='" + Fonksiyonlar.BiletKoltuk + "'";
                    dt2 = f.GetDataTable(sorgukoltuk);

                    sorgu4 = "insert into GecmisRezervasyon(SeferID,UcakID,Logo,FirmaAdi,MusteriAdi,MusteriSoyadi,MusteriTel,KalkisKonumu,InisKonumu,KoltukNumarasi,Fiyat,Tarih,Saat) values ('"+Fonksiyonlar.SeferID+ "','" + Fonksiyonlar.UcakID + "','" + Fonksiyonlar.Logo + "','" + Fonksiyonlar.FirmaAdi + "','" + Fonksiyonlar.BiletAdi + "','" + Fonksiyonlar.BiletSoyadi + "','" + Fonksiyonlar.BiletTel + "','" + Fonksiyonlar.Nereden + "','" + Fonksiyonlar.Nereye + "','" + Fonksiyonlar.BiletKoltuk + "','" + Fonksiyonlar.Fiyat + "','" + Fonksiyonlar.Tarih + "','" + Fonksiyonlar.Saat + "')";
                    dt4 = f.GetDataTable(sorgu4);

                 

                    toplam = bakiye - Fonksiyonlar.TekBiletFiyat;


                    sorgu4 = "update KartBilgileri set Bakiye='" + toplam + "' where KartID='" + id + "'";
                    dt4 = f.GetDataTable(sorgu4);

                    SeferModeli seferModeli = new SeferModeli()
                    {
                        Mesaj = "Başarıyla Satın Alınmıştır..."

                    };
                    kayitlist.Add(seferModeli);
                }
                else
                {
                    SeferModeli seferModeli = new SeferModeli()
                    {
                        Mesaj="Bakiyeniz Yetersizdir..."

                    };
                    kayitlist.Add(seferModeli);
                    return Json(kayitlist, JsonRequestBehavior.AllowGet);
                }
            }

            return Json(kayitlist, JsonRequestBehavior.AllowGet);
        }

    }
}