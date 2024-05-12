<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomeLux - Find Your Dream House</title>
    <link rel="stylesheet" href="assets/css/Agent	Home.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600;700&family=Poppins:wght@400;500;600;700&display=swap">
	<script>
	    function redirectToPage() {
	        
	        var targetUrl = "MainPage.html";
	        window.location.href = targetUrl;
	    }
    </script>
</head>
<body>
<header class="header">
    <div class="container">
        <img src="assets/images/logo.png" alt="Homelux Logo" class="logo">
        <nav class="navbar">
            <a href="ViewListingsController" class="navbar-link">All Listings</a>
            <a href="CreateListingController" class="navbar-link">Create Listing</a>
            <a href="MyListingsController" class="navbar-link">Manage Listings</a>
            <a href="#about" class="navbar-link">View Reviews</a>
            <a href="#about" class="navbar-link">View Ratings</a>
            <a href="SearchController" class="navbar-link"><ion-icon name="search-outline"></ion-icon></a>
            <button class="header-top-btn login-btn" onclick="redirectToPage()">Log Out</button>
        </nav>
    </div>
</header>
<main>
    <section class="hero">
        <div class="container-body">
            <div class="text-container">
                <h1>Welcome back, <span>${sessionScope.username}</span></h1>
            </div>
            <div class="image-container">
                <img src="assets/images/agent.jpg" alt="Modern house model" class="w-100">
            </div>
        </div>
    </section>
</main>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>

