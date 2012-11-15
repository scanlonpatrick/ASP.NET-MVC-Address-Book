<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<div>
		<% foreach(AddressModel model in (List<AddressModel>)ViewData["Addresses"]) 
		{  %>
			<div>
				<label>First Name:</label>
				<%= Html.TextBox("FirstName", model.FirstName) %>
				<br/>
				<label>Last Name:</label>
				<%= Html.TextBox("LastName", model.LastName) %>
				<br/>
				<label>Address:</label>
				<%= Html.TextBox("Address", model.Address) %>
				<br/>
				<%= Html.ActionLink("Edit", "EditAddress", "Home", new { Id = model.Id }) %>
			</div>
		<br/>
		<br/>
		<% } %>
	</div>
</body>

