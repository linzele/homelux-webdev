<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Listing</title>
    <link rel="stylesheet" href="assets/css/CreateListing.css">
</head>
<body>
	<div class="container">
    	<h1>Update Property Listing</h1>
	 	<form action="UpdateListingController" method="post">
		    <input type="hidden" name="postalCode" value="${param.postalCode}">
		    <input type="hidden" name="unitNumber" value="${param.unitNumber}">
		    <label>Descriptions:</label>
		    <textarea name="descriptions" required>${property.descriptions}</textarea>
		    <label>Thumbnail URL:</label>
		    <input type="text" name="thumbnail" value="${property.thumbnail}" required>
		    <label>Bedrooms:</label>
		    <input type="number" name="bedrooms" value="${property.bedrooms}" min="0" required>
		    <label>Bathrooms:</label>
		    <input type="number" name="bathrooms" value="${property.bathrooms}" min="0" required>
		    <label>Square Feet:</label>
		    <input type="number" name="sqft" value="${property.sqft}" min="0" step="0.01" required>
		    <label>Price:</label>
		    <input type="number" name="price" value="${property.price}" min="0" step="0.01" required>
		    <button type="submit">Update Listing</button>
		</form>
	</div>
</body>
</html>
