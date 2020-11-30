using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace UcakRezervasyon
{
    public class Fonksiyonlar
    {
        public static int sonid = 0;
        public static double GrupListele = 0;
        public static double UrunListele = 0;
        public static int YeniStok = 0;
        public static string MusteriID = "";
        public static string Ad="";
        public static string Soyad = "";
        public static string Adres = "";
        public static string Tel = "";
        public static string mesaj1 = "";
        public static string id = "";
        public static string FirmaAdi = "";
        public static string Logo = "";
        public static string Nereden = "";
        public static string Nereye = "";
        public static string Tarih = "";
        public static string Saat = "";
        public static string UcakID = "";
        public static string pasif = "required";
        public static string Aktiflik = "0";
        public static string aktbuton = "Giriş Yap";
        public static string Email = "";
        public static string Pass = "";
        public static int RezerveSayisi = 0;
        public static string Fiyat = "";
        public static double ToplamFiyat = 0.0;
        public static int StokSayisi = 0;

        public static string gelenkoltuk = "";
        public static int puan = 0;
        public static double fiyatson = 0.0;
        public static double toplampuan  = 0.0;


        public static string BiletAdi = "";
        public static string BiletSoyadi = "";
        public static string BiletTel = "";
        public static string BiletKoltuk = "";

        public static string SeferID = "";

        public static string KartNumarasi = "";
        public static string SonAy = "";
        public static string cvc = "";
        public static int TekBiletFiyat =0;

        public SqlConnection Baglan()
        {
            SqlConnection baglanti = new SqlConnection(@"Data Source=.;Initial Catalog=UcakRezervasyon;integrated Security=True;");
            if (baglanti.State != System.Data.ConnectionState.Open)
            {
                try
                {
                    baglanti.Open();
                    SqlConnection.ClearPool(baglanti);
                }
                catch (SqlException)
                {
                }
            }

            return baglanti;

        }

        public int cmd(string sqlcumle)
        {
            SqlConnection baglan = this.Baglan();
            SqlCommand cmd = new SqlCommand(sqlcumle, baglan);
            int sonuc = 0;
            try
            {
                sonuc = cmd.ExecuteNonQuery();
                cmd.CommandTimeout = 0;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            cmd.CommandTimeout = 0;
            cmd.Dispose();
            baglan.Close();
            baglan.Dispose();
            return (sonuc);
        }

        public DataTable GetDataTable(string sql)
        {
            SqlConnection baglan = this.Baglan();
            SqlDataAdapter adap = new SqlDataAdapter(sql, baglan);
            DataTable dt = new DataTable();
            try
            {
                adap.Fill(dt);
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            adap.Dispose();
            baglan.Close();
            return dt;
        }
        public void SessionEkle(string SessionAdi, string SessionDegeri)
        {
            HttpContext.Current.Session.Add("" + SessionAdi + "", "" + SessionDegeri + "");
        }

        public DataTable Listele(string TabloAdi)
        {
            string sorgu = "select * from  " + TabloAdi + "";


            return GetDataTable(sorgu);
        }
        public DataTable WhereListele(string TabloAdi, string sart)
        {
            string sorgu = "select * from  " + TabloAdi + "  where  '" + sart + "'";
            return GetDataTable(sorgu);
        }
        public DataRow GetDataRow(string sql)
        {

            DataTable dt = GetDataTable(sql);
            if (dt.Rows.Count == 0)
                return null;
            return dt.Rows[0];
        }

    }
}