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
		
		#region "Data access methods"
		private List<AddressModel> AddressStore
		{
			get
			{
				if(this.TempData["AddressList"] == null)
					this.TempData["AddressList"] = new List<AddressModel>();
				
				return this.TempData["AddressList"];
			}
		}
		
		private AddressModel GetAddressById(int Id)
		{
			foreach(AddressModel address in this.AddressStore)
				if(address.Id == Id) return address;
			
			//* No address by that ID found
			throw new ApplicationException("No Address with that ID was found in the Address Store");
		}
		
		private void SaveModel(AddressModel address)
		{
			int newId = this.AddressStore.Max(x => x.Id) + 1;
			address.Id = newId;
			this.AddressStore.Add(address);
		}
		
		#endregion
		
		public ActionResult Index ()
		{
			
			if(this.AddressStore.Count == 0)
			{
				//* Populate AddressStore with seed data
				AddressModel johnWayne = new AddressModel();
				
				johnWayne.FirstName = "John";
				johnWayne.LastName = "Wayne";
				johnWayne.Address = "123 Test St.";
				johnWayne.Id = 1;
				
				AddressModel tomCruise = new AddressModel();
				
				tomCruise.FirstName = "Tom";
				tomCruise.LastName = "Cruise";
				tomCruise.Address = "123 Test St.";
				tomCruise.Id = 2;
				
				this.AddressStore.Add(johnWayne);
				this.AddressStore.Add(tomCruise);
			}
			
			return View ();
		}
		
		public ActionResult EditAddress(int Id)
		{
			
			if(Id == -1)
			{
				//* This is a new address; initialize all values to an empty string
				this.ViewData["FirstName"] = "";
				this.ViewData["LastName"] = "";
				this.ViewData["Address"] = "";
			}
			else
			{
				//* TODO: query for address by Id	
			}
			return View ();	
		}
		
		public ActionResult NewAddress()
		{
			this.ViewData["FirstName"] = "";
			this.ViewData["LastName"] = "";
			this.ViewData["Address"] = "";
			return this.RedirectToAction ("EditAddress", "Home", new {Id = -1});
		}
		
		public ActionResult SaveAddress()
		{
			//* TODO: Query up Address to save 
			AddressModel address = new AddressModel();
			
			address.FirstName = Request.Form["FirstName"];
			address.LastName = Request.Form["LastName"];
			address.Address = Request.Form["Address"];
			
			//* TODO: Save or update
			return this.RedirectToAction("Index");
		}
	}
}

