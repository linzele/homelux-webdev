    'use strict';

    /**
     * element toggle function
     */

    // const elemToggleFunc = function (elem) { elem.classList.toggle("active"); }

    // /**
    //  * navbar toggle
    //  */

    // const navbar = document.querySelector("[data-navbar]");
    // const overlay = document.querySelector("[data-overlay]");
    // const navCloseBtn = document.querySelector("[data-nav-close-btn]");
    // const navOpenBtn = document.querySelector("[data-nav-open-btn]");
    // const navbarLinks = document.querySelectorAll("[data-nav-link]");

    // const navElemArr = [overlay, navCloseBtn, navOpenBtn];

    // /**
    //  * close navbar when click on any navbar link
    //  */

    // for (let i = 0; i < navbarLinks.length; i++) { navElemArr.push(navbarLinks[i]); }

    // /**
    //  * add event on all elements for toggling navbar
    //  */

    // for (let i = 0; i < navElemArr.length; i++) {
    // navElemArr[i].addEventListener("click", function () {
    //     elemToggleFunc(navbar);
    //     elemToggleFunc(overlay);
    // });
    // }

    // /**
    //  * header active state
    //  */

    // const header = document.querySelector("[data-header]");

    // window.addEventListener("scroll", function () {
    // window.scrollY >= 400 ? header.classList.add("active")
    //     : header.classList.remove("active");
    // });
    
    // Close Icon onclick
    document.getElementById('closeIcon').addEventListener('click', function () {
        window.location.href="./systemAdmin.html";
    })
 
    const dropdownSuspend = document.getElementById("userProfileSuspend");
    const dropdownUpdate = document.getElementById("userProfileUpdate");
    // Create Profile
    function create () {
        var role = document.getElementById("roleName").value;
        // Initialize an empty array to store the checked checkbox values
        var permissionList = [];
        // Select all checkboxes of type 'checkbox'
        var checkboxes = document.querySelectorAll("input[type='checkbox']");
        // Iterate over each checkbox
        checkboxes.forEach(function(checkbox) {
            // Check if the checkbox is checked
            if (checkbox.checked) {
                // If checked, add its value to the array
                permissionList.push(checkbox.name);
            }
        });

        var combinedDetails = role + "|" + permissionList.join();
        console.log(combinedDetails);


        localStorage.setItem(roleName + "Permissions", combinedDetails);
        alert("Profile created successfully!");
    }

    // Suspend Account
    function suspend () {
        var userOption = document.getElementById("userProfileSuspend");
        var userType = userOption.value;
        
        // Retrieving array from localStorage
        var retrievedArray = JSON.parse(localStorage.getItem('suspendArray')) || [];
        
        userOption.querySelector('option[value="' + userType + '"]').disabled = true;

        console.log(userType);
        retrievedArray.push(userType);
        console.log(retrievedArray);    
        localStorage.setItem('suspendArray', JSON.stringify(retrievedArray));

        localStorage.setItem(userType, "disabled");
        alert("Profile suspend successfully!");
    }

    // Update Account
    function update () {
        var userOption = document.getElementById("userProfileUpdate");
        var userType = userOption.value;

        // Retrieving array from localStorage
        var retrievedArray = JSON.parse(localStorage.getItem('updateArray')) || [];
        
        // Initialize an empty array to store the checked checkbox values
        var permissionList = [];

        // Select all checkboxes of type 'checkbox'
        var checkboxes = document.querySelectorAll("input[type='checkbox']");

        // Iterate over each checkbox
        checkboxes.forEach(function(checkbox) {
            // Check if the checkbox is checked
            if (checkbox.checked) {
                // If checked, add its value to the array
                permissionList.push(checkbox.name);
            }
        });

        var combinedDetails = userType + "|" + permissionList.join();
        console.log(combinedDetails);
        retrievedArray.push(userType);
        console.log(retrievedArray);    
        localStorage.setItem('updateArray', JSON.stringify(retrievedArray));

        
        localStorage.setItem(userType + "Details", combinedDetails);
        alert("Profile update successfully!");
    }

    function loadSuspendOptions() {
        var suspendArray = JSON.parse(localStorage.getItem('suspendArray')) || [];
        var updateArray = JSON.parse(localStorage.getItem("updateArray")) || [];
    
        for (let option of dropdownSuspend.options) {
            if (suspendArray.includes(option.value)) {
                option.disabled = true;
            }
            if (updateArray.includes(option.value)) {
                option.disabled = false;

                var suspendProfile = suspendArray.indexOf(option.value);
                if (suspendProfile !== -1) {
                    suspendArray.splice(suspendProfile, 1);
                }

                var updateProfile = updateArray.indexOf(option.value);
                if (updateProfile !== -1) {
                    updateArray.splice(updateProfile, 1);
                }
                
            }
        }
        
        localStorage.setItem('suspendArray', JSON.stringify(suspendArray));
        localStorage.setItem('updateArray', JSON.stringify(updateArray));
        console.log(suspendArray);
    }
    

    /**
     * Filling checkboxes based on selected option
     */

    // document.getElementById('userProfileSelect').addEventListener('change', function() {
    //     var selectedOption = this.value;
    //     var checkboxes = document.querySelectorAll('.permissions input[type="checkbox"]');
        
    //     if (selectedOption === 'admin') {
    //         // If "System Admin" is selected, fill all checkboxes
    //         checkboxes.forEach(function(checkbox) {
    //             checkbox.checked = true;
    //         });
    //     } else if (selectedOption === 'agent') {
    //         // If "Real Estate Agent" is selected, fill the first 3 checkboxes
    //         for (let i = 0; i < 3; i++) {
    //             checkboxes[i].checked = true;
    //         }
    //     } else {
    //         // If any other option is selected, only fill the first checkbox (Permission 1)
    //         checkboxes.forEach(function(checkbox, index) {
    //             checkbox.checked = (index === 0); // Index 0 corresponds to Permission 1
    //         });
    //     }
    // });
