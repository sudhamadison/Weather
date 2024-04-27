using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeatherApp
{
    public partial class WeatherReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDateDropDown();

            }
            else
            {
                //process submitted data;
            }

        }

        private void LoadDateDropDown()
        {

            DataSet ds = new DataSet();
            SqlConnection sqlWeather = new SqlConnection();
            DataTable weather_report = new DataTable();

            try
            {
                sqlWeather = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=weather;Integrated Security=True ");
                SqlDataAdapter da = new SqlDataAdapter("select distinct(weather_date) from weather_report", sqlWeather);
                da.Fill(weather_report);

                ddlDate.DataValueField = "weather_date"; //The Value of the DropDownList, to get it you should call ddlDepartments.SelectedValue;
                ddlDate.DataTextField = "weather_date"; //The Name shown of the DropDownList.
                ddlDate.DataSource = weather_report;
                ddlDate.DataBind();

            }
            catch (Exception x)
            {
                //MessageBox.Show(x.GetBaseException().ToString(), "Error",
                //MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {

                sqlWeather.Close();

            }
        }

        protected void buttonSubmit_Click(object sender, EventArgs e)
        {
            FillGridView();
        }
        void FillGridView()
        {
            var selectedDate = ddlDate.SelectedValue;
            var zipCode = Convert.ToInt32( textboxZipcode.Text);

            SqlConnection sqlWeather = new SqlConnection();
            SqlCommand cmd = new SqlCommand();

            DataTable dt = new DataTable();
            try
            {
                sqlWeather = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=weather;Integrated Security=True ");
                //SqlDataAdapter da = new SqlDataAdapter("GetWeatherReport", sqlWeather);
                cmd.CommandText = "GetWeatherReport";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlWeather;
                cmd.Parameters.AddWithValue("@zipcode", zipCode);
                cmd.Parameters.AddWithValue("@weather_date", selectedDate);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                gvWeatherReport.DataSource = dt;
                gvWeatherReport.DataBind();

            }
            catch (Exception x)
            {
                //MessageBox.Show(x.GetBaseException().ToString(), "Error",
                // MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                cmd.Dispose();
                sqlWeather.Close();
            }


        }
        // Cretae a method accept 2 parameter - date/zip returns list
    }
}