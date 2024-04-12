using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;


namespace validators_ex.App_start
{
    public class BundleConfig
       
    {
        public static void RegisterBundle(BundleCollection bundle)
        {
            bundle.Add(new ScriptBundle("~/asset/MyAppJs")
                .Include("~/validators/formValidators.js"));
            bundle.Add(new StyleBundle("~/asset/MyAppCss")
                .Include("~/style/forms.css"));
            BundleTable.EnableOptimizations = false;
        }
    }
}