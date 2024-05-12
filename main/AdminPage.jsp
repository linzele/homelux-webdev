<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomeLux - Find your dream house</title>
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="assets/css/AdminHome.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600;700&family=Poppins:wght@400;500;600;700&display=swap"
        rel="stylesheet">
    </head>
    <body>
    <header class="header" data-header>
        <div class="overlay" data-overlay></div>
        <div class="header-top">
        <div class="container">
            <div class="wrapper">
            <button class="header-top-btn login-btn">Log Out</button>
            </div>
        </div>
        </div>
        <div class="header-bottom">
        <div class="container">
            <a href="#" class="logo">
            <img src="assets/images/logo.jpg" alt="Homelux logo">
            </a>
            <nav class="navbar" data-navbar>
            <div class="navbar-top">
                <a href="#" class="logo">
                <img src="assets/images/logo.jpg" alt="Homeverse logo">
                </a>
                <button class="nav-close-btn" data-nav-close-btn aria-label="Close Menu">
                <ion-icon name="close-outline"></ion-icon>
                </button>
            </div>
            <div class="navbar-bottom">
                <ul class="navbar-list">
                <li class="dropdown">
                    <a href="#about" class="navbar-link" data-nav-link>Manage User Account</a>
                </li>
                <li class="dropdown">
                    <a href="#about" class="navbar-link" data-nav-link>Manage User Profile</a>
                </li>
                </ul>
            </div>
            </nav>
            <div class="header-bottom-actions">
            <button class="header-bottom-actions-btn login-btn" aria-label="Search" href="#">
                <ion-icon name="search-outline"></ion-icon>
                <span>Search</span>
            </button>
            <button class="header-bottom-actions-btn" data-nav-open-btn aria-label="Open Menu">
                <ion-icon name="menu-outline"></ion-icon>
                <span>Menu</span>
              </button>
            </div>
        </div>
        </div>
    </header>
    <main>
        <article>
        <section class="hero" id="home">
            <div class="container">
            <div class="hero-content">
                <p class="hero-subtitle">
                <ion-icon name="home"></ion-icon>
                <span>HomeLux</span>
                </p>
                <h1 class="h1 hero-title">Welcome back, <span><c:out value="${sessionScope.username}"/></span></h1>
            </div>
            <figure class="hero-banner">
                <img src="assets/images/systemadmin.jpg" alt="Modern house model" class="w-100">
            </figure>
            </div>
        </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
    <script>
        function clickAcc (option) {
            console.log(option, " Accounts button clicked!");

        }
    </script>
    <script>
    var logoutBtn = document.querySelector('.header-top-btn');
    logoutBtn.addEventListener('click', function() {
        console.log('Logout button clicked!');
        window.location.href = 'MainPage.html';
});
    </script>
    </html>