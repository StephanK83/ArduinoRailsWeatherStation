document.addEventListener("DOMContentLoaded", () => {
  const ctx = document.getElementById('temperatureChart').getContext('2d');
  const temperatureChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: <%= @timestamps.map { |t| t.strftime('%H:%M') }.to_json.html_safe %>,
          datasets: [{
              label: 'Temperature',
              data: <%= @temperatures.to_json.html_safe %>,
              borderColor: 'rgba(75, 192, 192, 1)',
              borderWidth: 2,
              fill: false
          }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });
});
