using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace ToDoList
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ToDoSQLDataContext db = new ToDoSQLDataContext();
            // Fetch the entered User from the database
            var Credential = (from p in db.Users
                              where (p.UserName == txtUserName.Text.ToLower() && p.Password == txtPassword.Text)
                              select p).FirstOrDefault();
            // Check if the User is valid or not
            if (Credential == null || txtUserName .Text == "" || txtPassword.Text == "")
            {
                // Not Success
                lblresult.Text = "Enter valid Credentials";
            }
            else
            {
                // Success
                Session["UserID"] = Credential.UserID;      // Assign UserID in Session 
                Session["UserName"] = Credential.UserName;  // Assign UserName in Session
                Response.Redirect("ToDo.aspx"); // Redirect to the Task page for the Loggedin User.
            }
        }
    }
}
