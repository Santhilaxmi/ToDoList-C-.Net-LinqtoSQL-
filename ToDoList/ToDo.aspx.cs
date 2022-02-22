using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDoList
{
    public partial class ToDo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                PopulateList();
            }
            lblUsrValue.Text = Session["UserName"].ToString(); // Assign Loggedin UserName
        }
        
        // To Populate the tasks for the loggedin User
        private void PopulateList()
        {
            ToDoSQLDataContext db = new ToDoSQLDataContext();
            gvTaskView.DataSource = db.ToDos.Where(p => p.UserID == Int32.Parse(Session["UserID"].ToString())).ToList();
            gvTaskView.DataBind();
            txtToDoName.Text = "";
            lblErrMsg.Text = "";
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            // Before adding the task to check whether the user entered a task or not.
            if (txtToDoName.Text == "")
            {
                lblErrMsg.Text = "Enter Task Description";
            }
            else
            {
                ToDoSQLDataContext db = new ToDoSQLDataContext();
                ToDo AddToDo = new ToDo
                {
                    Description = txtToDoName.Text,
                    Timestamp = DateTime.Now,
                    UserID = Int32.Parse(Session["UserID"].ToString())
                };

                db.ToDos.InsertOnSubmit(AddToDo); // Insert the task into database
                db.SubmitChanges();
                PopulateList(); // Rebind the Task lists
            }
        }

        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {
            ToDoSQLDataContext db = new ToDoSQLDataContext();

            foreach (GridViewRow row in gvTaskView.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkRow");
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (chk.Checked)
                    {
                        var delobj = db.ToDos.Where(p => p.ToDoID == Int32.Parse(gvTaskView.DataKeys[row.DataItemIndex].Value.ToString())).SingleOrDefault();
                        db.ToDos.DeleteOnSubmit(delobj); // Delete the task from the database
                        db.SubmitChanges();
                    }
                }
            }
            PopulateList(); // Rebind the Task lists
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clear the Session Variables
            Response.Redirect("Login.aspx"); // Redirect to Login Page
        }
    }
}