using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class demopage3 : System.Web.UI.Page
{
    public int iWarningTimeoutInMilliseconds;
    public int iSessionTimeoutInMilliseconds;
    public string sTargetURLForSessionTimeout;

    protected void Page_Load(object sender, EventArgs e)
    {
        //In a real app, stuff these values into web.config.
        sTargetURLForSessionTimeout = "Error.aspx?Reason=Timeout";
        int iNumberOfMinutesBeforeSessionTimeoutToWarnUser = 1;

        //Get the sessionState timeout (from web.config).
        //If not set there, the default is 20 minutes.
        int iSessionTimeoutInMinutes = Session.Timeout;

        //Compute our timeout values, one for
        //our warning, one for session termination.
        int iWarningTimeoutInMinutes = iSessionTimeoutInMinutes -
            iNumberOfMinutesBeforeSessionTimeoutToWarnUser;

        iWarningTimeoutInMilliseconds = iWarningTimeoutInMinutes * 60 * 1000;

        iSessionTimeoutInMilliseconds = iSessionTimeoutInMinutes * 60 * 1000;

        if (!this.IsPostBack)
        {
            //Don't show the warning message div tag until later.
            //Setting the property here so we can see the div at design-time.
            divSessionTimeoutWarning.Style.Add("display", "none;");
        }
    }

    protected void btnContinueWorking_Click(object sender, EventArgs e)
    {
        //Do nothing. But the Session will be refreshed as a result of 
        //this method being called, which is its entire purpose.
    }
}