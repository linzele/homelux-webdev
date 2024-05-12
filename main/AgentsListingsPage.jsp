<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %> 
<%@ page import="com.homelux.entities.Property" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Agent Property Listings</title> 
    <link rel="stylesheet" href="assets/css/MyListings.css"> 
    <script> 
    function suspendListing(postalCode, unitNumber) { 
        const xhttp = new XMLHttpRequest(); 
        xhttp.onload = function() { 
            if (this.responseText === "success") { 
                location.reload();
            } else {
                alert('Failed to suspend listing.');
            }
        }; 
        xhttp.open("POST", "SuspendListingController", true); 
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("postalCode=" + postalCode + "&unitNumber=" + unitNumber); 
    }
    </script>
</head> 
<body> 
    <div class="container"> 
        <h1>My Listings</h1> 
        <c:forEach items="${listings}" var="property"> 
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
		        <div class="property-actions"> 
		            <button class="action-button-suspend" onclick="suspendListing('${property.postalCode}', '${property.unitNumber}')">
		            <ion-icon name="close-outline"></ion-icon>
					</button>
					<button class="action-button-update" onclick="updateListing('${property.postalCode}', '${property.unitNumber}')">
					    <ion-icon name="build-outline"></ion-icon>
					</button>		
		        </div> 
		    </div> 
		</c:forEach>
    </div>
    <script type="text/javascript">
        function updateListing(postalCode, unitNumber) {
            const updateUrl = 'UpdateListingPage.jsp?postalCode=' + encodeURIComponent(postalCode) + '&unitNumber=' + encodeURIComponent(unitNumber);
            window.location.href = updateUrl;
        }
    </script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body> 
</html>
