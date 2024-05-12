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

// Use the parameter values as needed
console.log(param1Value);


// Function to render the list of properties
function renderPropertyList() {
  const propertyListElement = document.getElementById('suspendList');
  
  // Clear existing content
  propertyListElement.innerHTML = '';
  
  // Generate HTML for each property and append it to the propertyListElement
  properties.forEach(property => {
        var propertytext = property.name + " | " + property.value;
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.name = property.name;
        checkbox.value = property.name;
        checkbox.className = "options"
        checkbox.textContent = propertytext;

        if (property.name == param1Value) {
            checkbox.checked = true;
        }

        const label = document.createElement('label');
        
        label.textContent = propertytext;
        label.htmlFor = property.name;
        label.addEventListener('click', function() {
            // Toggle the checked state of the checkbox
            checkbox.checked = !checkbox.checked;
          });

        const div = document.createElement('div');
        div.className = "pl";
        div.appendChild(checkbox);
        div.appendChild(label);
        
        propertyListElement.appendChild(div);
  });

  const submit = document.createElement('button');
  submit.type = 'submit';
  submit.innerText = "Suspend";
  submit.className = "btn";

  propertyListElement.append(submit);

}

// Render the initial list of properties
renderPropertyList();

// Optional: Add event listener to the form for submission
const form = document.getElementById('suspendList');
form.addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent default form submission
  const formData = new FormData(this);
  // Iterate over checked checkboxes and log their values
  for (const entry of formData.entries()) {
    console.log(entry[0], entry[1]);
  }
});


function clickAcc (option) {
    console.log(option, " Listing button clicked!");

}
