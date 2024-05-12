<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.homelux.entities.Property" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Listings</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Available Properties</h1>
    <div class="property-list">
        <c:forEach items="${properties}" var="property">
            <div class="property-card">
                <img src="${property.thumbnail}" alt="Property Image" style="width:100px;height:100px;">
                <h2>${property.address}</h2>
                <p><strong>Price:</strong> $${property.price}</p>
                <p><strong>Sqft:</strong> ${property.sqft} sqft</p>
                <p><strong>Price per Sqft:</strong> $${property.pricePerSqft} per sqft</p>
                <p><strong>Description:</strong> ${property.descriptions}</p>
                <a href="details.jsp?propertyID=${property.propertyID}">View Details</a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
