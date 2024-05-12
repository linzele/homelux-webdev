<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %> 
<%@ page import="com.homelux.entities.Property" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Property Listings</title> 
    <link rel="stylesheet" href="assets/css/ViewListings.css"> 
</head> 
<body> 
    <div class="container"> 
        <h1>All Properties</h1> 
        <c:forEach items="${properties}" var="property"> 
            <div class="property-card"> 
                <div class="${property.isSold ? 'property-thumbnail sold' : 'property-thumbnail'}"> 
                    <img src="${property.thumbnail}" alt="Property Image"> 
                    <div class="sold-overlay">SOLD</div> 
                </div> 
                <div class="property-details"> 
                    <h2 class="property-header">${property.address}, ${property.postalCode} ${property.unitNumber}</h2> 
                    <p class="property-text">${property.descriptions}</p> 
                    <div class="property-footer">
					    Price: <fmt:formatNumber value="${property.price}" type="currency" currencySymbol="$" groupingUsed="true" maxFractionDigits="0" /> | Sqft: ${property.sqft} sqft | Price/Sqft: <fmt:formatNumber value="${property.pricePerSqft}" type="currency" currencySymbol="$" groupingUsed="true" maxFractionDigits="0" /> | Bedrooms: ${property.bedrooms} | Bathrooms: ${property.bathrooms}
					</div>
                </div> 
            </div> 
        </c:forEach> 
    </div> 
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script> 
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script> 
</body> 
</html>