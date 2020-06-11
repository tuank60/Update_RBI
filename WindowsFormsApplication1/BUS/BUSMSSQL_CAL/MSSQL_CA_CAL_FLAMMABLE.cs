using RBI.BUS.BUSMSSQL;
using RBI.Object.ObjectMSSQL;
using RBI.Object.ObjectMSSQL_CAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RBI.DAL.MSSQL_CAL;
using RBI.BUS.BUSMSSQL_CAL;

namespace RBI.BUS.BUSMSSQL_CAL
{
    public class MSSQL_CA_CAL_FLAMMABLE
    {
        API_COMPONENT_TYPE_BUS API_COMPONENT_BUS = new API_COMPONENT_TYPE_BUS();
        MSSQL_RBI_CAL_ConnUtils DAL_CAL = new MSSQL_RBI_CAL_ConnUtils();
        MSSQL_CA_CAL CA_CAL = new MSSQL_CA_CAL();
        public String FLUID { set; get; }
        public float MITIGATION_SYSTEM { get; set; }
        public float STORE_TEMP { get; set; }
        public String FLUID_PHASE { set; get; }
        public float TOXIC_PERCENT { get; set; }
        private String TYPE_FLUID()
        {
            String API_TYPE = null;
            if (FLUID == null || FLUID == "")
                API_TYPE = "TYPE 0";
            else
            {
                switch (FLUID)
                {
                    case "C1-C2":
                    case "C13-C16":
                    case "C17-C25":
                    case "C25+":
                    case "C3-C4":
                    case "C5":
                    case "C6-C8":
                    case "C9-C12":
                    case "Acid":
                    case "AlCl3":
                    case "H2":
                    case "H2S":
                    case "HCl":
                    case "HF":
                    case "Nitric Acid":
                    case "NO2":
                    case "Phosgene":
                    case "Pyrophoric":
                    case "Steam":
                    case "TDI":
                    case "Water":
                        API_TYPE = "TYPE 0";
                        break;
                    case "CO":
                    case "DEE":
                    case "EE":
                    case "EEA":
                    case "EG":
                    case "EO":
                    case "Methanol":
                    case "PO":
                    case "Styrene":
                        API_TYPE = "TYPE 1";
                        break;
                    default:
                        API_TYPE = "TYPE 0";
                        break;
                }
            }
            return API_TYPE;
        }
        public String GET_AMBIENT()
        {
            //Console.WriteLine(DAL_CAL.GET_RELEASE_PHASE(FLUID));
            return DAL_CAL.GET_RELEASE_PHASE(FLUID);
        }
        public float GET_NBP()
        {
            //Console.WriteLine(DAL_CAL.GET_NBP(FLUID));
            return DAL_CAL.GET_NBP(FLUID);
        }
        public String GET_RELEASE_PHASE()
        {
            if(FLUID_PHASE=="Gas")
            {
                return "Gas";
            }
            else if (GET_AMBIENT() == "Liquid" && FLUID_PHASE == "Liquid")
            {
                return "Liquid";
            }
            else if (GET_NBP() <= 300)
            {
                return "Liquid";
            }
            else
                return "Gas";
        }
        public float fact_mit()
        {
            float fact_mit = 0;
            if (CA_CAL.MITIGATION_SYSTEM == "Inventory Blowdown, coupled with isolation system actived remotely or automatically")
                fact_mit = 0.25f;
            else if (CA_CAL.MITIGATION_SYSTEM == "Fire water deluge system and monitors")
                fact_mit = 0.2f;
            else if (CA_CAL.MITIGATION_SYSTEM == "Fire water monitor only")
                fact_mit = 0.05f;
            else
                fact_mit = 0.15f;
            return fact_mit;
        }
        public float eneff_n(int n)
        {
            float eff = (float)(4 * Math.Log10(DAL_CAL.GET_TBL_3B21(4) * CA_CAL.mass_n(n)) - 15);
            if (eff < 1 )
                return 1;
            else
                return eff;
        }
        public float a_cont(int select)
        {
            //Console.WriteLine("hihi" + FLUID);
            float[] data = DAL_CAL.GET_TBL_58(FLUID);
            //Console.WriteLine("gfoasd" + data[0]);
            float[] a_cont = { 0, 0, 0, 0 };
            Console.WriteLine("release phase= " +GET_RELEASE_PHASE());
            if (GET_RELEASE_PHASE() == "Gas")
            {
                a_cont[0] = data[0];
                a_cont[1] = data[4];
                a_cont[2] = data[8];
                a_cont[3] = data[12];
            }
            else
            {
                a_cont[0] = data[2];
                a_cont[1] = data[6];
                a_cont[2] = data[10];
                a_cont[3] = data[14];
            }
                return a_cont[select - 1];
        }
        public float b_cont(int select)
        {
            float[] data = DAL_CAL.GET_TBL_58(FLUID);
            float[] b_cont = { 0, 0, 0, 0 };
            if (GET_RELEASE_PHASE() == "Gas")
            {
                b_cont[0] = data[1];
                b_cont[1] = data[5];
                b_cont[2] = data[9];
                b_cont[3] = data[13];
            }
            else
            {
                b_cont[0] = data[3];
                b_cont[1] = data[7];
                b_cont[2] = data[11];
                b_cont[3] = data[15];
            }
            return b_cont[select - 1];
        }
        public float a_inj(int select)
        {
            float[] data = DAL_CAL.GET_TBL_59(FLUID);
            float[] a_inj = { 0, 0, 0, 0 };
            if (GET_RELEASE_PHASE() == "Gas")
            {
                a_inj[0] = data[0];
                a_inj[1] = data[4];
                a_inj[2] = data[8];
                a_inj[3] = data[12];
            }
            else
            {
                a_inj[0] = data[2];
                a_inj[1] = data[6];
                a_inj[2] = data[10];
                a_inj[3] = data[14];
            }
            return a_inj[select - 1];
        }
        public float b_inj(int select)
        {
            float[] data = DAL_CAL.GET_TBL_59(FLUID);
            float[] b_inj = { 0, 0, 0, 0 };//{ data[1], data[3], data[5], data[7], data[9], data[11], data[13], data[15] };
            if (GET_RELEASE_PHASE() == "Gas")
            {
                b_inj[0] = data[1];
                b_inj[1] = data[5];
                b_inj[2] = data[9];
                b_inj[3] = data[13];
            }
            else
            {
                b_inj[0] = data[3];
                b_inj[1] = data[7];
                b_inj[2] = data[11];
                b_inj[3] = data[15];
            }
            return b_inj[select - 1];
        }
        public float ca_cmdn_cont(int select, int n)
        {
            float ca_cmdn_cont = 0;
            String API_FLUID_TYPE = TYPE_FLUID();
            Console.WriteLine("API_FLUID_TYPE= " + API_FLUID_TYPE);
            float x = CA_CAL.rate_n(n) * (TOXIC_PERCENT / 100);
            Console.WriteLine("x= " +x);
            ca_cmdn_cont = (float)Math.Round(a_cont(select) * Math.Pow(x, b_cont(select)) * (1 - fact_mit()), 5);
            return ca_cmdn_cont;
        }
        private float effrate_n(int select, int n)
        {
            float effrate_n = 0;
            String API_FLUID_TYPE = TYPE_FLUID();
            if ((CA_CAL.GET_RELEASE_PHASE() == "Liquid") && (API_FLUID_TYPE == "TYPE 0"))
                effrate_n = (float)Math.Round((1 / (DAL_CAL.GET_TBL_3B21(4)) * Math.Exp(Math.Log10(ca_cmdn_cont(select, n) / (a_cont(select) * (DAL_CAL.GET_TBL_3B21(8)))) * Math.Pow(b_cont(select), -1))), 2);
            else
                effrate_n = CA_CAL.rate_n(n);
            return effrate_n;
        }
        private float ca_cmdn_inst(int select, int n)
        {
            float ca_cmdn_inst = 0;
            String API_FLUID_TYPE = TYPE_FLUID();
            if ((CA_CAL.GET_RELEASE_PHASE() == "Liquid") && (API_FLUID_TYPE == "TYPE 0"))
                ca_cmdn_inst = (float)Math.Round(Math.Min(a_cont(select) * Math.Pow(CA_CAL.mass_n(n), b_cont(select)), (DAL_CAL.GET_TBL_3B21(7))) * ((1 - CA_CAL.fact_mit()) / eneff_n(n)), 2);
            else
                ca_cmdn_inst = (float)Math.Round(a_cont(select) * Math.Pow(CA_CAL.mass_n(n), b_cont(select)) * (1 - CA_CAL.fact_mit()), 2);
            return ca_cmdn_inst;
        }
        public float ca_injn_cont(int select, int n)
        {
            float ca_injn_cont;
            ca_injn_cont = (float)Math.Round(a_inj(select) * Math.Pow(effrate_n(select, n), b_inj(select)) * (1 - CA_CAL.fact_mit()), 2);
            return ca_injn_cont;
        }
        public float ca_injn_inst(int select, int n)
        {
            float ca_injn_inst;
            ca_injn_inst = (float)Math.Round(a_inj(select) * Math.Pow(effrate_n(select, n), b_inj(select)) * ((1 - CA_CAL.fact_mit()) / eneff_n(n)), 2);
            return ca_injn_inst;
        }
        public double fact_n_ic(int n)
        {
            String releasetype = CA_CAL.releaseType(n);
            if (releasetype == "Continuous")
                return Math.Min(CA_CAL.rate_n(n) / (DAL_CAL.GET_TBL_3B21(5)), 1.0);
            else
                return 1.0;
        }
        public float fact_ait()
        {
            float[] data = DAL_CAL.GET_TBL_52(FLUID);
            float fact_ait = 0;
            float ait = 273 + (float)Math.Round((data[9] - 32) / 1.8, 2);
            if ((CA_CAL.STORED_TEMP + (DAL_CAL.GET_TBL_3B21(6))) <= ait)
                fact_ait = 0;
            else if ((CA_CAL.STORED_TEMP - (DAL_CAL.GET_TBL_3B21(6))) >= ait)
                fact_ait = 1;
            else
                fact_ait = (CA_CAL.STORED_TEMP - ait + (DAL_CAL.GET_TBL_3B21(6))) / (2 * (DAL_CAL.GET_TBL_3B21(6)));
            return fact_ait;
        }
        public float ca_cmdn_flame(int n)
        {
            float ca_cmdn_flame = 0;
            float caailcmdn = (float)(ca_cmdn_cont(2, n) * fact_n_ic(n) + ca_cmdn_inst(4, n) * (1 - fact_n_ic(n)));
            float caainlcmdn = (float)(ca_cmdn_cont(1, n) * fact_n_ic(n) + ca_cmdn_inst(3, n) * (1 - fact_n_ic(n)));
            ca_cmdn_flame = caailcmdn * fact_ait() + caainlcmdn * (1 - fact_ait());
            return ca_cmdn_flame;
        }
        public float ca_injn_flame(int n)
        {
            float caailinjn = (float)(Math.Abs(ca_injn_cont(2, n)) * fact_n_ic(n) + Math.Abs(ca_injn_inst(4, n)) * (1 - fact_n_ic(n)));
            float caainlinjn = (float)(Math.Abs(ca_injn_cont(1, n)) * fact_n_ic(n) + Math.Abs(ca_injn_inst(3, n)) * (1 - fact_n_ic(n)));
            return caailinjn * fact_ait() + caainlinjn * (1 - fact_ait());

        }
        private Boolean checkFlame()
        {
            Boolean check = false;
            string[] itemsFrammable = { "C1-C2", "C3-C4", "C5", "C6-C8", "C9-C12", "C13-C16", "C17-C25", "C25+", "H2", "H2S", "HF", "CO", "DEE", "Methanol", "PO", "Styrene", "Aromatics", "EEA", "EE", "EG", "EO" };
            for (int i = 0; i < itemsFrammable.Length; i++)
            {
                if (FLUID == itemsFrammable[i])
                {
                    check = true;
                    break;
                }
            }
            return check;
        }
        public float ca_cmd_flame()
        {
            if (!checkFlame())
            {
                return 0;
            }
            else
            {
                float t = 0;
                API_COMPONENT_TYPE obj = CA_CAL.GET_DATA_API_COM();
                t = obj.GFFSmall * ca_cmdn_flame(1) + obj.GFFMedium * ca_cmdn_flame(2) + obj.GFFLarge * ca_cmdn_flame(3) + obj.GFFRupture * ca_cmdn_flame(4);
                float ca_cmd_flame = t / obj.GFFTotal;
                return Math.Abs(ca_cmd_flame);
            }

        }
        public float ca_inj_flame()
        {
            if (!checkFlame())
            {
                return 0;
            }
            else
            {
                float t;
                API_COMPONENT_TYPE obj = CA_CAL.GET_DATA_API_COM();
                t = obj.GFFSmall * ca_injn_flame(1) + obj.GFFMedium * ca_injn_flame(2) + obj.GFFLarge * ca_injn_flame(3) + obj.GFFRupture * ca_injn_flame(4);
                float ca_inj = t / obj.GFFTotal;
                return Math.Abs(ca_inj);
            }
        }
    }
}
