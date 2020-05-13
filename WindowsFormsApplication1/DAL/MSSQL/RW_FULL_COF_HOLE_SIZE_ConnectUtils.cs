using RBI.Object;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using RBI.Object.ObjectMSSQL;
namespace RBI.DAL.MSSQL
{
    class RW_FULL_COF_HOLE_SIZE_ConnectUtils
    {
        public void add(int ID, String GFF_n, double A1, double A2, double A3, double A4, double Wn, double t_n, double ld_max_n, double mass_add_n, double mass_avail_n, double rate_n, double ld_n, double mass_n, double eneff_n, double factIC_n, String ReleaseType_n)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        " " +
                        "INSERT INTO [dbo].[RW_FULL_COF_HOLE_SIZE]" +
                        "([ID]" +
                        ",[GFF_n]" +
                        ",[A1]" +
                        ",[A2]" +
                        ",[A3]" +
                        ",[A4]" +
                        ",[Wn]" +
                        ",[t_n]" +
                        ",[ld_max_n]" +
                        ",[mass_add_n]" +
                        ",[mass_avail_n]" +
                        ",[rate_n]" +
                        ",[ld_n]" +
                        ",[mass_n]" +
                        ",[eneff_n]" +
                        ",[factIC_n]" +
                        ",[ReleaseType_n])" +
                        "VALUES" +
                        "('" + ID + "'" +
                        ",'" + GFF_n + "'" +
                        ",'" + A1 + "'" +
                        ",'" + A2 + "'" +
                        ",'" + A3 + "'" +
                        ",'" + A4 + "'" +
                        ",'" + Wn + "'" +
                        ",'" + t_n + "'" +
                        ",'" + ld_max_n + "'" +
                        ",'" + mass_add_n + "'" +
                        ",'" + mass_avail_n + "'" +
                        ",'" + rate_n + "'" +
                        ",'" + ld_n + "'" +
                        ",'" + mass_n + "'" +
                        ",'" + eneff_n + "'" +
                        ",'" + factIC_n + "'" +
                        ",'" + ReleaseType_n + "')" +
                        " ";
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "ADD FAIL!");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public void edit(int ID, String GFF_n, double A1, double A2, double A3, double A4, double Wn, double t_n, double ld_max_n, double mass_add_n, double mass_avail_n, double rate_n, double ld_n, double mass_n, double eneff_n, double factIC_n, String ReleaseType_n)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        " " +
                        "UPDATE [dbo].[RW_FULL_COF_HOLE_SIZE]" +
                        "SET [ID] = '" + ID + "'" +
                        ",[GFF_n] = '" + GFF_n + "'" +
                        ",[A1] = '" + A1 + "'" +
                        ",[A2] = '" + A2 + "'" +
                        ",[A3] = '" + A3 + "'" +
                        ",[A4] = '" + A4 + "'" +
                        ",[Wn] = '" + Wn + "'" +
                        ",[t_n] = '" + t_n + "'" +
                        ",[ld_max_n] = '" + ld_max_n + "'" +
                        ",[mass_add_n] = '" + mass_add_n + "'" +
                        ",[mass_avail_n] = '" + mass_avail_n + "'" +
                        ",[rate_n] = '" + rate_n + "'" +
                        ",[ld_n] = '" + ld_n + "'" +
                        ",[mass_n] = '" + mass_n + "'" +
                        ",[eneff_n] = '" + eneff_n + "'" +
                        ",[factIC_n] = '" + factIC_n + "'" +
                        ",[ReleaseType_n] = '" + ReleaseType_n + "'" +

                        " WHERE [ID] = '" + ID + "'" +
                        " ";
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "EDIT FAIL!");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public void delete(int ID)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        " " +
                        "DELETE FROM [dbo].[RW_FULL_COF_HOLE_SIZE]" +
                        " WHERE [ID] ='" + ID + "'" +
                        " ";
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "DELETE FAIL!");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        // get Datasource
        public List<RW_FULL_COF_HOLE_SIZE> getDataSource()
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            List<RW_FULL_COF_HOLE_SIZE> list = new List<RW_FULL_COF_HOLE_SIZE>();
            RW_FULL_COF_HOLE_SIZE obj = null;
            String sql = "Use[rbi] Select [ID]" +
                        ",[GFF_n]" +
                        ",[A1]" +
                        ",[A2]" +
                        ",[A3]" +
                        ",[A4]" +
                        ",[Wn]" +
                        ",[t_n]" +
                        ",[ld_max_n]" +
                        ",[mass_add_n]" +
                        ",[mass_avail_n]" +
                        ",[rate_n]" +
                        ",[ld_n]" +
                        ",[mass_n]" +
                        ",[eneff_n]" +
                        ",[factIC_n]" +
                        ",[ReleaseType_n]" +
                          "From [dbo].[RW_FULL_COF_HOLE_SIZE] ";
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader.HasRows)
                        {
                            obj = new RW_FULL_COF_HOLE_SIZE();
                            obj.ID = reader.GetInt32(0);
                            obj.GFF_n = reader.GetString(1);
                            if (!reader.IsDBNull(2))
                            {
                                obj.A1 = reader.GetFloat(2);

                            }
                            if (!reader.IsDBNull(3))
                            {
                                obj.A2 = reader.GetFloat(3);

                            }
                            if (!reader.IsDBNull(4))
                            {
                                obj.A3 = reader.GetFloat(4);

                            }
                            if (!reader.IsDBNull(5))
                            {
                                obj.A4 = reader.GetFloat(5);

                            }
                            if (!reader.IsDBNull(6))
                            {
                                obj.Wn = reader.GetFloat(6);
                            }
                            if (!reader.IsDBNull(7))
                            {
                                obj.t_n = reader.GetFloat(7);

                            }
                            if (!reader.IsDBNull(8))
                            {
                                obj.ld_max_n = reader.GetFloat(8);
                            }
                            if (!reader.IsDBNull(9))
                            {
                                obj.mass_add_n = reader.GetFloat(9);
                            }
                            if (!reader.IsDBNull(10))
                            {
                                obj.mass_avail_n = reader.GetFloat(10);
                            }
                            if (!reader.IsDBNull(11))
                            {
                                obj.rate_n = reader.GetFloat(11);
                            }
                            if (!reader.IsDBNull(12))
                            {
                                obj.ld_n = reader.GetFloat(12);
                            }
                            if (!reader.IsDBNull(13))
                            {
                                obj.mass_n = reader.GetFloat(13);
                            }
                            if (!reader.IsDBNull(14))
                            {
                                obj.eneff_n = reader.GetFloat(14);
                            }
                            if (!reader.IsDBNull(15))
                            {
                                obj.factIC_n = reader.GetFloat(15);
                            }
                            list.Add(obj);

                        }
                    }
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "GET DATA FAIL");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return list;
        }
        public RW_FULL_COF_HOLE_SIZE getData(int ID)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            RW_FULL_COF_HOLE_SIZE obj = new RW_FULL_COF_HOLE_SIZE();
            String sql = "Use[rbi] Select [ID]" +
                        ",[GFF_n]" +
                        ",[A1]" +
                        ",[A2]" +
                        ",[A3]" +
                        ",[A4]" +
                        ",[Wn]" +
                        ",[t_n]" +
                        ",[ld_max_n]" +
                        ",[mass_add_n]" +
                        ",[mass_avail_n]" +
                        ",[rate_n]" +
                        ",[ld_n]" +
                        ",[mass_n]" +
                        ",[eneff_n]" +
                        ",[factIC_n]" +
                        ",[ReleaseType_n]" +
                          "From [dbo].[RW_FULL_COF_HOLE_SIZE] WHERE [ID] = '" + ID + "' ";
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader.HasRows)
                        {
                            obj = new RW_FULL_COF_HOLE_SIZE();
                            obj.ID = reader.GetInt32(0);
                            obj.GFF_n = reader.GetString(1);
                            if (!reader.IsDBNull(2))
                            {
                                obj.A1 = reader.GetFloat(2);

                            }
                            if (!reader.IsDBNull(3))
                            {
                                obj.A2 = reader.GetFloat(3);

                            }
                            if (!reader.IsDBNull(4))
                            {
                                obj.A3 = reader.GetFloat(4);

                            }
                            if (!reader.IsDBNull(5))
                            {
                                obj.A4 = reader.GetFloat(5);

                            }
                            if (!reader.IsDBNull(6))
                            {
                                obj.Wn = reader.GetFloat(6);
                            }
                            if (!reader.IsDBNull(7))
                            {
                                obj.t_n = reader.GetFloat(7);

                            }
                            if (!reader.IsDBNull(8))
                            {
                                obj.ld_max_n = reader.GetFloat(8);
                            }
                            if (!reader.IsDBNull(9))
                            {
                                obj.mass_add_n = reader.GetFloat(9);
                            }
                            if (!reader.IsDBNull(10))
                            {
                                obj.mass_avail_n = reader.GetFloat(10);
                            }
                            if (!reader.IsDBNull(11))
                            {
                                obj.rate_n = reader.GetFloat(11);
                            }
                            if (!reader.IsDBNull(12))
                            {
                                obj.ld_n = reader.GetFloat(12);
                            }
                            if (!reader.IsDBNull(13))
                            {
                                obj.mass_n = reader.GetFloat(13);
                            }
                            if (!reader.IsDBNull(14))
                            {
                                obj.eneff_n = reader.GetFloat(14);
                            }
                            if (!reader.IsDBNull(15))
                            {
                                obj.factIC_n = reader.GetFloat(15);
                            }

                        }
                    }

                }

            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "GET DATA FAIL !");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return obj;
        }
        public Boolean checkExistCoFHS(int ID)
        {
            Boolean IsExist = false;
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "select GFF_n from rbi.dbo.RW_FULL_COF_HOLE_SIZE where ID = '" + ID + "'";
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader.IsDBNull(0))
                            IsExist = false;
                        else
                            IsExist = true;
                    }
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "GET DATA FAIL!");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return IsExist;
        }
    }
}