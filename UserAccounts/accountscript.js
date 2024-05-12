    'use strict';

    /**
     * element toggle function
     */

    //  const elemToggleFunc = function (elem) { elem.classList.toggle("active"); }

    // /*
    //  navbar toggle
    //  */

    // const navbar = document.querySelector("[data-navbar]");
    // const overlay = document.querySelector("[data-overlay]");
    // const navCloseBtn = document.querySelector("[data-nav-close-btn]");
    // const navOpenBtn = document.querySelector("[data-nav-open-btn]");
    // const navbarLinks = document.querySelectorAll("[data-nav-link]");

    // const navElemArr = [overlay, navCloseBtn, navOpenBtn];

    // /*
    //  close navbar when click on any navbar link
    //  */

    // for (let i = 0; i < navbarLinks.length; i++) { navElemArr.push(navbarLinks[i]); }

    // /*
    //  add event on all elements for toggling navbar
    //  */

    // for (let i = 0; i < navElemArr.length; i++) {
    // navElemArr[i].addEventListener("click", function () {
    //     elemToggleFunc(navbar);
    //     elemToggleFunc(overlay);
    // });
    // }

    // /*
    //  header active state
    //  */

    // const header = document.querySelector("[data-header]");

    // window.addEventListener("scroll", function () {
    // window.scrollY >= 400 ? header.classList.add("active")
    //     : header.classList.remove("active");
    // }); 

    // Close button
   function closebtn () {
        window.location.href="./systemAdmin.html";
    }

    // Create Account
    function create () {
        var userType = document.getElementById("users").value;
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var pwd = document.getElementById("pwdField").value;

        var combinedDetails = userType + "|" + username + "|" + email + "|" + pwd;
        console.log(combinedDetails);

        localStorage.setItem(userType + "Details", combinedDetails);
        alert("Account created successfully!");
    }

    // Suspend Account
    function suspend () {
        var userType = document.getElementById("users").value;
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;

        var combinedDetails = userType + "|" + username + "|" + email;
        console.log(combinedDetails);
        
        localStorage.setItem(userType + "Details", combinedDetails);
        alert("Account suspend successfully!");
    }

    // Update Account
    function update () {
        var userType = document.getElementById("users").value;
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;

        var combinedDetails = userType + "|" + username + "|" + email;
        console.log(combinedDetails);
        
        localStorage.setItem(userType + "Details", combinedDetails);
        alert("Account update successfully!");
    }

    // Toggle Password Visibility
    function toggle () {
        const pwdbox = document.getElementById("pwdField");
        const pwdicon = document.getElementById("pwdIcon");
        const icon = pwdIcon.querySelector('ion-icon');
        const currentIconName = icon.getAttribute('name');

        if (pwdbox.type == "password") {
            pwdbox.type ="text";
            icon.setAttribute('name', 'lock-open-outline');
          } else {
            pwdbox.type = "password";
            icon.setAttribute('name', 'lock-closed-outline');
          }
    }
