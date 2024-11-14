// App.jsx
import React from 'react';

const App = () => {
  return (
    <div>
      <h1>Welcome to HomeLux</h1>
      <iframe
        src="/MainPage.html"
        title="Main Page"
        style={{
          width: '100%',
          height: '100vh',
          border: 'none',
        }}
      ></iframe>
    </div>
  );
};

export default App;
