using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Simple.OData.Client;
using System.Data.Services.Client;
using WebApp.SecurityService;
using System.Configuration;
using WebApp.PropertiesService;

namespace WebApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RESULT objCreds = GetCredentials();

            this.txtToken.Text = objCreds.Details.ToString();
        }

        private void OnSending(object sender, SendingRequestEventArgs e)
        {
            e.RequestHeaders.Add("ApplicationToken", this.txtToken.Text);
        }


        private RESULT GetCredentials() {
            RESULT objSecurity = null;

            string _clientId = ConfigurationManager.AppSettings["clientId"].ToString();
            string _clientSecret = ConfigurationManager.AppSettings["clientSecret"].ToString();

            SecurityEntities entities = new SecurityEntities(new Uri("http://search.dev2.obiwebservices.com/RESO/Security.svc/"));

            var result = entities.Execute<RESULT>(new Uri(string.Format("http://search.dev2.obiwebservices.com/RESO/Security.svc/ApplicationToken?$filter=clientId eq {0} and clientSecret eq {1}", _clientId, _clientSecret)));

            foreach (var r in result) {
                objSecurity = r;
            }

            return objSecurity;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PropertiesService.PropertyEntities entities = new PropertiesService.PropertyEntities(new Uri("http://search.dev2.obiwebservices.com/RESO/Properties.svc/"));

            entities.SendingRequest += new EventHandler<SendingRequestEventArgs>(OnSending);

            var results = entities.Execute<PROPERTY>(new Uri(string.Format("http://search.dev2.obiwebservices.com/RESO/Properties.svc/Property?$filter={0}", txt_url.Text.ToString())));

            List<PROPERTY> prop = new List<PROPERTY>();
            foreach (var result in results)
            {
                prop.Add(result);
            }

            this.GridView1.DataSource = prop;
            this.GridView1.DataBind();

            //this.GridView1.DataBind;
        }
 
    }
}