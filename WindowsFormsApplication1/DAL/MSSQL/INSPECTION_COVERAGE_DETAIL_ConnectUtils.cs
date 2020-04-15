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
    class INSPECTION_COVERAGE_DETAIL_ConnectUtils
    {
        public void add(int CoverageID,int DMItemID, DateTime InspectionDate, String EffectivenessCode,String InspectionSummary)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                         "INSERT INTO [dbo].[INSPECTION_COVERAGE_DETAIL]" +
                            "([CoverageID]" +
                            ",[DMItemID]" +
                            ",[InspectionDate]" +
                            ",[EffectivenessCode]" +
                            ",[InspectionSummary])" +
                            "VALUES" +
                            "('" + CoverageID + "'" +
                            ",'" + DMItemID + "'" +
                            ",'" + InspectionDate + "'" +
                            ",'" + EffectivenessCode + "'" +
                            ",'" + InspectionSummary + "')";
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
        public void edit(int ID, int CoverageID, int DMItemID, DateTime InspectionDate, String EffectivenessCode, String InspectionSummary, int IsCarriedOut, DateTime CarriedOutDate)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        "UPDATE [dbo].[INSPECTION_COVERAGE_DETAIL]" +
                        "SET [CoverageID] = '" + CoverageID + "'" +
                        ",[DMItemID] = '" + DMItemID + "'" +
                        ",[InspectionDate] = '" + InspectionDate + "'" +
                        ",[EffectivenessCode] = '" + EffectivenessCode + "'" +
                        ",[InspectionSummary] = '" + InspectionSummary + "'" +
                        ",[IsCarriedOut] = '" + IsCarriedOut + "'" +
                        ",[CarriedOutDate] = '" + CarriedOutDate + "'" +                        
                        "WHERE [ID] = '" + ID + "'";

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
                        "DELETE FROM [dbo].[INSPECTION_COVERAGE_DETAIL]" +
                        "WHERE [ID] = '" + ID + "'";
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
        public void deletebyCoverageID(int CoverageID)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        "DELETE FROM [dbo].[INSPECTION_COVERAGE_DETAIL]" +
                        "WHERE [CoverageID] = '" + CoverageID + "'";
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
        public List<INSPECTION_COVERAGE_DETAIL> getDataSource()
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            List<INSPECTION_COVERAGE_DETAIL> list = new List<INSPECTION_COVERAGE_DETAIL>();
            INSPECTION_COVERAGE_DETAIL obj = null;
            String sql = " Use [rbi] Select [ID]" +
                          ",[CoverageID]" +
                          ",[DMItemID]" +
                          ",[InspectionDate]" +
                          ",[EffectivenessCode]" +
                          ",[InspectionSummary]" +
                          ",[IsCarriedOut]" +
                          ",[CarriedOutDate]" +
                          "From [dbo].[INSPECTION_COVERAGE_DETAIL]";
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
                            obj = new INSPECTION_COVERAGE_DETAIL();
                            obj.ID = reader.GetInt32(0);
                            obj.CoverageID = reader.GetInt32(1);
                            obj.DMItemID = reader.GetInt32(2);
                            obj.InspectionDate = reader.GetDateTime(4);
                            obj.EffectivenessCode = reader.GetString(5);
                            
                            obj.IsCarriedOut = reader.GetInt32(6);
                            if (!reader.IsDBNull(7))
                            {
                                obj.CarriedOutDate = reader.GetDateTime(8);
                            }
                            list.Add(obj);
                        }
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
            return list;
        }
        public String getEffectivenessCodebyCoverageIDandDMItemID(int CoverageID, int DMItemID)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String EffectivenessCode = "E";
            String sql = " Use [rbi] Select [EffectivenessCode]" +
                          "From [dbo].[INSPECTION_COVERAGE_DETAIL] where CoverageID = '" + CoverageID + "' and DMItemID= '" + DMItemID + "'";
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
                            EffectivenessCode = reader.GetString(0);
                        }
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
            return EffectivenessCode;
        }

    }

}


