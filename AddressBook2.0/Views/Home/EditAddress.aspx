<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			enableOrDisableSave();
			
			$('.required').keyup(function() {
				enableOrDisableSave();
			});
		});
		
		function enableOrDisableSave()
		{
			var requiredFieldNotFilled = false;
			
			//* Check for the existence of a required control that has not been filled in
			$(".required").each(function() {
				var requiredControl = $(this);
				if(requiredControl == null || requiredControl.val() == "")
					requiredFieldNotFilled = true;
			});
			
			if(requiredFieldNotFilled)
				$('#Save').attr('disabled', true);
			else
				$('#Save').removeAttr('disabled');
			
		}
	</script>	
</head>
<body>
	<form id="form1" method="post" action="/Home/SaveAddress">
		<%= Html.Hidden("Id") %>
		<label for="FirstName">FirstName</label>
		<%= Html.TextBox("FirstName", ViewData["FirstName"], new { @class = "required" }) %>
		<br/>
		<label for="LastName">Last Name</label>
		<%= Html.TextBox("LastName", ViewData["LastName"], new { @class = "required" }) %>
		<br/>
		<label for="Address">Address</label>
		<%= Html.TextBox("Address", ViewData["Address"], new { @class = "required" }) %>
		<br/>
		<input type="submit" value="Save" id="Save"/>
	</form>
</body>
