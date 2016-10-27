using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Services;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
   public static bool Insert_Data(string name, string age, string sex)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Insert into Personal_Details (Name,Age,Sex) values(@name,@age,@sex)", conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@sex", sex);            
            int count = cmd.ExecuteNonQuery();
            conn.Close();
            if (count >0)
            {
                return true;
            }
            return false;
        }
        
        catch (Exception ex)
        {
            return false;
        }
    }

}