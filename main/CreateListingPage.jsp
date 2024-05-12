<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Listing</title>
    <link rel="stylesheet" href="assets/css/CreateListing.css">
</head>
<body>

<c:if test="${not empty sessionScope.flash}">
    <script>alert('${sessionScope.flash}');</script>
    <% session.removeAttribute("flash"); %>
</c:if>

   <div class="container">
        <h1>Create Property Listing</h1>
        <form action="CreateListingController" method="POST">
        	<label>Seller's Username:</label>
            <input type="text" name="sellerUsername" required>
            <label>Address:</label>
            <input type="text" name="address" required>
            <label>Postal Code:</label>
            <input type="text" name="postalCode" required>
            <label>Unit Number:</label>
            <input type="text" name="unitNumber" required>
		    <label>Descriptions:</label>
		    <textarea name="descriptions" required></textarea>
		    <label>Thumbnail URL:</label>
		    <input type="text" name="thumbnail" required>
		    <label>Bedrooms:</label>
		    <input type="number" name="bedrooms" min="0" required>
		    <label>Bathrooms:</label>
		    <input type="number" name="bathrooms" min="0" required>
		    <label>Square Feet:</label>
		    <input type="number" name="sqft" min="0" step="0.01" required>
		    <label>Price:</label>
		    <input type="number" name="price" min="0" step="0.01" required>
            <button type="submit">Create Listing</button>
        </form>
    </div>
</body>
</html>
