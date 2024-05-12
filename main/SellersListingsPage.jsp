<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="com.homelux.entities.Property" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Seller Property Listings</title> 
    <link rel="stylesheet" href="assets/css/MyListings.css"> 
</head> 
<body> 
    <div class="container"> 
        <h1>My Properties</h1> 
        <c:forEach items="${properties}" var="entry">
		    <div class="property-card">
		        <div class="${entry.key.isSold ? 'property-thumbnail sold' : 'property-thumbnail'}">
		            <img src="${entry.key.thumbnail}" alt="Property Image">
		            <div class="sold-overlay">SOLD</div>
		        </div>
		        <div class="property-details">
		            <h2 class="property-header">${entry.key.address}, ${entry.key.postalCode} ${entry.key.unitNumber}</h2>
		            <p class="property-text">${entry.key.descriptions}</p>
		            <div class="property-footer">
					    Price: <fmt:formatNumber value="${entry.key.price}" type="currency" currencySymbol="$" groupingUsed="true" maxFractionDigits="0" /> | Sqft: ${entry.key.sqft} sqft | Price/Sqft: <fmt:formatNumber value="${entry.key.pricePerSqft}" type="currency" currencySymbol="$" groupingUsed="true" maxFractionDigits="0" /> | Bedrooms: ${entry.key.bedrooms} | Bathrooms: ${entry.key.bathrooms}
		                <div class="saves-count">Saves: ${entry.value}</div>  <!-- Display saves count from the map -->
		            </div>
		        </div>
		    </div>
		</c:forEach>
    </div> 
</body> 
</html>
