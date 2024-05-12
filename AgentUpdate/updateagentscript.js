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


// Sample list of properties (you can replace this with your dynamic data)
const properties = [
{ name: 'property-1', value: 'Value 1' },
{ name: 'property-2', value: 'Value 2' },
{ name: 'property-3', value: 'Value 3' }];

// Get the query string from the URL
const queryString = window.location.search;

// Create a URLSearchParams object
const params = new URLSearchParams(queryString);

// Retrieve parameter values by key
const param1Value = params.get('property');
const param2Value = params.get('desc')

// Use the parameter values as needed
console.log(param1Value, param2Value);


// Function to render the list of properties
function renderPropertyList() {
  const propertyListElement = document.getElementById('pListings');
  
  // Generate HTML for each property and append it to the propertyListElement
  properties.forEach(property => {
        const select = document.createElement('option');
        select.value = property.name;
        select.className = "options"
        select.textContent = property.name;

        if (property.name == param1Value) {
            select.selected = true;
            const desc = document.getElementById('desc');
            desc.value = param2Value;
        }
        
        propertyListElement.appendChild(select);

  });
}

// Render the initial list of properties
renderPropertyList();


function clickAcc (option) {
    console.log(option, " Listing button clicked!");

}
