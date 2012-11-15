<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" target="/Home/SaveAddress">
		<label for="FirstName">FirstName</label>
		<% Html.TextBox("FirstName") %>
		<br/>
		<label for="LastName">Last Name</label>
		<% Html.TextBox("LastName") %>
		<br/>
		<label for="Address">Address</label>
		<% Html.TextBox("Address") %>
		<br/>
		<input type="submit" value="Save"/>
	</form>
</body>
