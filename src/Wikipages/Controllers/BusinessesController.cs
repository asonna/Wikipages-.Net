using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Wikipages.Models;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace Wikipages.Controllers
{
    public class BusinessesController : Controller
    {
        private WikipagesContext db = new WikipagesContext();
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View(db.Businesses.ToList());
        }

        public IActionResult Details(int id)
        {
            var thisBusiness = db.Businesses.FirstOrDefault(businesses => businesses.BusinessId == id);
            return View(thisBusiness);
        }
    }
}
