// Add an event listener to the form submission
document.getElementById('mortgageForm').addEventListener('submit', function(e) {
  // Prevent the default form submission behavior
  e.preventDefault();

  // Get form values
  var purchasePrice = parseFloat(document.getElementById('purchasePrice').value);
  var downPayment = parseFloat(document.getElementById('downPayment').value);
  var interestRate = parseFloat(document.getElementById('interestRate').value) / 100 / 12; // Monthly interest rate
  var loanTerm = parseFloat(document.getElementById('loanTerm').value) * 12; // Total number of payments

  // Calculate mortgage
  var principal = purchasePrice - downPayment;
  var monthlyPayment = (principal * interestRate * Math.pow(1 + interestRate, loanTerm)) / (Math.pow(1 + interestRate, loanTerm) - 1);
  var totalPayment = monthlyPayment * loanTerm;
  var totalInterest = totalPayment - principal;

  // Display results
  var resultsDiv = document.getElementById('results');
  resultsDiv.innerHTML = '<h2>Results</h2>' +
                          '<p>Monthly Mortgage Payment: $' + monthlyPayment.toFixed(2) + '</p>' +
                          '<p>Total Interest Paid: $' + totalInterest.toFixed(2) + '</p>' +
                          '<p>Total Payment: $' + totalPayment.toFixed(2) + '</p>';
});
