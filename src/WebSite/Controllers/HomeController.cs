using Neptuo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Neptuo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            LinkDataService dataService = new LinkDataService(Server.MapPath(LinkDataService.DataUri));
            return View(dataService.Get());
        }
    }
}