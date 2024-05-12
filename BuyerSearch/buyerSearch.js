document.getElementById('searchForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevents the default form submission
    
    var keyword = document.getElementById('searchInput').value.toLowerCase(); // Get the keyword from the search input and convert to lowercase for case-insensitive matching
    
    var content = document.body.innerText.toLowerCase(); // Get all the text content of the webpage's body and convert to lowercase
    
    // Use regular expression to find matches of the keyword in the content
    var regex = new RegExp("\\b" + keyword + "\\b", "g");
    var matches = content.match(regex);

    if (matches) {
        alert('Keyword "' + keyword + '" found ' + matches.length + ' times on the page.');
    } else {
        alert('Keyword "' + keyword + '" not found on the page.');
    }
});
