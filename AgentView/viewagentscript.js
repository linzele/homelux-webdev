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

// Function to generate HTML for each property
function generatePropertyHTML(property) {
  var suspendURL = '../AgentSuspend/suspendAgent.html?property=' + encodeURIComponent(property.name);
  var updateURL = '../AgentUpdate/updateAgent.html?property=' + encodeURIComponent(property.name) + '&desc=' + encodeURIComponent(property.value);
  console.log(updateURL);
  return `
      <div class="propertyBox">
          <h3>${property.name}</h3>
          <p>${property.value}</p>
          <img src="../assets/images/${property.name}.jpg" alt="New Apartment Nice View" class="w-100"></a>
          <div class="btns">
            <form action=${suspendURL} method="post" id="suspendForm">
              <button type="submit" class="btn">Suspend</button>
            </form>
            <form action=${updateURL} method="post" id="updateForm">
              <button type="submit" class="btn">Update</button>
            </form>
          </div>
      </div>
  `;
}

// Function to render the list of properties
function renderPropertyList() {
  const propertyListElement = document.getElementById('propertyList');
  
  // Clear existing content
  propertyListElement.innerHTML = '';
  
  // Generate HTML for each property and append it to the propertyListElement
  properties.forEach(property => {
      const propertyHTML = generatePropertyHTML(property);
      propertyListElement.innerHTML += propertyHTML;

  });

}

// Render the initial list of properties
renderPropertyList();


function clickAcc (option) {
    console.log(option, " Listing button clicked!");

}