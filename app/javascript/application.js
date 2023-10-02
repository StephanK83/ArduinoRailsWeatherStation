// import "@hotwired/turbo-rails"
import "controllers"
import "https://cdn.jsdelivr.net/npm/chart.js"
import "https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"
import "https://cdn.jsdelivr.net/npm/chart.js"
import "./controllers/current_measurements.js"

document.addEventListener("DOMContentLoaded", () => {
  // Dark Mode Logik
  const darkModeToggle = document.getElementById("dark_mode_toggle");
  if(darkModeToggle) {
      darkModeToggle.addEventListener("click", function() {
          console.log("Toggle Button geklickt!");
          darkModeToggle.classList.toggle("active");

          document.body.classList.toggle("dark-mode");

          const isDarkMode = document.body.classList.contains("dark-mode");
          localStorage.setItem('dark-mode', isDarkMode ? 'enabled' : 'disabled');
      });

      const storedDarkMode = localStorage.getItem('dark-mode');
      if (storedDarkMode === 'enabled') {
          document.body.classList.add('dark-mode');
      }
  }

  // Burger Menu Logik
  const burgerToggle = document.getElementById('burger_toggle');
  const dropdownMenu = document.getElementById('dropdown_menu');

  if(burgerToggle && dropdownMenu) {
      burgerToggle.addEventListener('click', () => {
          dropdownMenu.classList.toggle('hidden');
      });
  }
});
