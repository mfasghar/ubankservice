using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (YourValidationFunction(Login1.UserName, Login1.Password))

        {

           // e.Authenticated = true;

            Login1.Visible = false;

           

        }

        else

        {

            e.Authenticated = false;

        }
        }


        protected void Login1_LoginError(object sender, EventArgs e)
        {

            if (ViewState["LoginErrors"] == null)

                ViewState["LoginErrors"] = 0;



            int ErrorCount = (int)ViewState["LoginErrors"] + 1;

            ViewState["LoginErrors"] = ErrorCount;



            if ((ErrorCount > 3) && (Login1.PasswordRecoveryUrl != string.Empty))

                Response.Redirect(Login1.PasswordRecoveryUrl);

        }

        private bool YourValidationFunction(string UserName, string Password)

      {

        bool boolReturnValue = false;
        databaseDataContext myDB = new databaseDataContext();



        var user = (from u in myDB.UserManagers
                    
                    select u).FirstOrDefault();

       

            if ((UserName == user.UserID) & (Password == user.Password.ToString()))

            {

                boolReturnValue = true;

                Response.Redirect("actionregaddforall.aspx");

            }

           

        

        return boolReturnValue;

    }




    }
}