<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<style type="text/css">
		.header td
		{
			font-weight: bold;
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<div>
		<table>
			<tr class="header">
				<td>First Name</td>
				<td>Last Name</td>
				<td>Address</td>
				<td></td>
			</tr>
			<% foreach(AddressModel model in (List<AddressModel>)ViewData["Addresses"]) 
			{  %>
				<tr>
					<td><%= Html.TextBox("FirstName", model.FirstName) %></td>
					<td><%= Html.TextBox("LastName", model.LastName) %></td>
					<td><%= Html.TextBox("Address", model.Address) %></td>
					<td><%= Html.ActionLink("Edit", "EditAddress", "Home", new { Id = model.Id }) %></td>
				</tr>
			<% } %>
		</table>
	</div>
</body>

