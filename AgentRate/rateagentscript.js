'use strict';

/**
 * element toggle function
 */

const elemToggleFunc = function (elem) { elem.classList.toggle("active"); }



/**
 * navbar toggle
 */

const navbar = document.querySelector("[data-navbar]");
const overlay = document.querySelector("[data-overlay]");
const navCloseBtn = document.querySelector("[data-nav-close-btn]");
const navOpenBtn = document.querySelector("[data-nav-open-btn]");
const navbarLinks = document.querySelectorAll("[data-nav-link]");

const navElemArr = [overlay, navCloseBtn, navOpenBtn];

/**
 * close navbar when click on any navbar link
 */

for (let i = 0; i < navbarLinks.length; i++) { navElemArr.push(navbarLinks[i]); }

/**
 * addd event on all elements for toggling navbar
 */

for (let i = 0; i < navElemArr.length; i++) {
  navElemArr[i].addEventListener("click", function () {
    elemToggleFunc(navbar);
    elemToggleFunc(overlay);
  });
}

/**
 * header active state
 */

const header = document.querySelector("[data-header]");

window.addEventListener("scroll", function () {
  window.scrollY >= 400 ? header.classList.add("active")
    : header.classList.remove("active");
}); 

// Below function for star ratings based on ratingValue variable
document.addEventListener('DOMContentLoaded', function() {
    const ratingDiv = document.getElementById('stars');
    const ratingValue = 3.5; // Example rating value
    
    // Generate star icons based on rating value
    const starsHTML = generateStars(ratingValue);
    
    // Set the HTML content of the rating div
    ratingDiv.innerHTML += starsHTML;
  });
  
  function generateStars(rating) {
    const numFullStars = Math.floor(rating);
    const remainder = rating - numFullStars;
    console.log(remainder);
    let starsHTML = '';
    
    // Add full stars
    for (let i = 0; i < numFullStars; i++) {
      starsHTML += "</i><i class='fa fa-star' style='color:#fbcc05'></i>";
    }
    
    // Add half star if remainder is greater than 0
    if (remainder > 0) {
      starsHTML += "<i class='fa fa-star-half-o' style='color:#fbcc05'></i>"; // Use half-filled star icon
    }
    
    // Add empty stars to fill up the rest
    const numEmptyStars = 5 - Math.ceil(rating);
    for (let i = 0; i < numEmptyStars; i++) {
      starsHTML += "<i class='fa fa-star' style='color:#bfbfbf'></i>"; // Use empty star icon
    }
    
    return starsHTML;
  }
  


function clickAcc (option) {
    console.log(option, " Listing button clicked!");

}