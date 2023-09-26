console.log("Current_measurements.js loaded!");
document.addEventListener("DOMContentLoaded", () => {
  const chartElement = document.getElementById('temperatureChart');
  // const temperatures = JSON.parse(chartElement.dataset.temperatures);
  // const timestamps = JSON.parse(chartElement.dataset.timestamps);
  const temperatures = JSON.parse(canvas.dataset.temperatures);
  const timestamps = JSON.parse(canvas.dataset.timestamps);


  const ctx = chartElement.getContext('2d');
  const temperatureChart = new ChartJS.Chart(ctx, {
      type: 'line',
      data: {
          labels: timestamps,
          datasets: [{
              label: 'Temperature',
              data: temperatures,
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
