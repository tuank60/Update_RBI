﻿using RBI.Object.ObjectMSSQL;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RBI.DAL.MSSQL
{
    class RW_FULL_COF_TANK_ConnectUtils
    {
        public void add(int ID, double CoFValue, String CoFCategory, double ProdCost, double CoFMatrixValue)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        " " +
                        "INSERT INTO [dbo].[RW_FULL_COF_TANK]" +
                        "([ID]" +
                        ",[CoFValue]" +
                        ",[CoFCategory]" +
                        ",[ProdCost]" +
                        ",[CoFMatrixValue])" +
                        "VALUES" +
                        "('" + ID + "'" +
                        ",'" + CoFValue + "'" +
                        ",'" + CoFCategory + "'" +
                        ",'" + ProdCost + "'" +
                        ",'" + CoFMatrixValue + "')" +
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
        public void edit(int ID, double CoFValue, String CoFCategory, double ProdCost, double CoFMatrixValue)
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            String sql = "USE [rbi]" +
                        " " +
                        "UPDATE [dbo].[RW_FULL_COF_TANK]" +
                        "SET [ID] = '" + ID + "'" +
                        ",[CoFValue] = '" + CoFValue + "'" +
                        ",[CoFCategory] = '" + CoFCategory + "'" +
                        ",[ProdCost] = '" + ProdCost + "'" +
                        ",[CoFMatrixValue] = '" + CoFMatrixValue + "'" +
                        
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
                        "DELETE FROM [dbo].[RW_FULL_COF_TANK]" +
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
        // get datasource
        public List<RW_FULL_COF_TANK> getDataSource()
        {
            SqlConnection conn = MSSQLDBUtils.GetDBConnection();
            conn.Open();
            List<RW_FULL_COF_TANK> list = new List<RW_FULL_COF_TANK>();
            RW_FULL_COF_TANK obj = null;
            String sql = " Use [rbi] Select [ID]" +
                        ",[CoFValue]" +
                        ",[CoFCategory]" +
                        ",[ProdCost]" +
                        ",[CoFMatrixValue]" +
                          "From [dbo].[RW_FULL_COF_TANK]  ";
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
                            obj = new RW_FULL_COF_TANK();
                            obj.ID = reader.GetInt32(0);
                            if (!reader.IsDBNull(1))
                            {
                                obj.CoFValue = reader.GetFloat(1);
                            }
                            if (!reader.IsDBNull(2))
                            {
                                obj.CoFCategory = reader.GetString(2);

                            }
                            if (!reader.IsDBNull(3))
                            {
                                obj.ProdCost = reader.GetFloat(3);
                            }
                            if (!reader.IsDBNull(4))
                            {
                                obj.CoFMatrixValue = reader.GetFloat(4);
                            }
                            list.Add(obj);

                        }
                    }
                }
            }
            catch(Exception e)
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
    }
}
