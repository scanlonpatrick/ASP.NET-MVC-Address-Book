using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Controllers
{
	[HandleError]
	public class HomeController : Controller
	{
		public ActionResult Index ()
		{
			List<AddressModel> models = new List<AddressModel>();
			
			AddressModel johnWayne = new AddressModel();
			
			johnWayne.FirstName = "John";
			johnWayne.LastName = "Wayne";
			johnWayne.Address = "123 Test St.";
			
			AddressModel tomCruise = new AddressModel();
			
			tomCruise.FirstName = "Tom";
			tomCruise.LastName = "Cruise";
			tomCruise.Address = "123 Test St.";
			
			models.Add(johnWayne);
			models.Add(tomCruise);
			
			this.ViewData["Addresses"] = models;
			
			return View ();
		}
		
		public ActionResult EditAddress(int Id)
		{
			
			//* TODO: Get an address from peristance layer by Id
			this.ViewData["FirstName"] = "";
			this.ViewData["LastName"] = "";
			this.ViewData["Address"] = "";
			return View ();	
		}
		
		public ActionResult NewAddress()
		{
			this.ViewData["FirstName"] = "";
			this.ViewData["LastName"] = "";
			this.ViewData["Address"] = "";
			return EditAddress(-1);	
		}
		
		public ActionResult SaveAddress()
		{
			//* TODO: Query up Address to save 
			AddressModel address = new AddressModel();
			
			address.FirstName = Request.Form["FirstName"];
			address.LastName = Request.Form["LastName"];
			address.Address = Request.Form["Address"];
			
			//* TODO: Save or update
			return Index();
		}
	}
}

