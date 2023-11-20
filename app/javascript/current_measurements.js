console.log("Current_measurements.js loaded!");

document.addEventListener("DOMContentLoaded", () => {

  const initializeChart = (elementId, label, borderColor, dataType) => {
      const element = document.getElementById(elementId);
      if (element) {
          const ctx = element.getContext('2d');
          const dataValues = JSON.parse(element.getAttribute(dataType));
          const timestamps = JSON.parse(element.getAttribute('data-timestamps'));
          new Chart(ctx, {
              type: 'line',
              data: {
                  labels: timestamps,
                  datasets: [{
                      label: label,
                      data: dataValues,
                      borderColor: borderColor,
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
      }
  }

  initializeChart('temperatureChart', 'Tagestemperatur', 'rgba(75, 192, 192, 1)', 'data-temperatures');
  initializeChart('temperatureChartWeek', 'Wochendurchschnitt Temperatur', 'rgba(255, 99, 132, 1)', 'data-temperatures');
  initializeChart('temperatureChartAll', 'Allzeittemperatur', 'rgba(153, 102, 255, 1)', 'data-temperatures');
  initializeChart('humidityChart', 'Luftfeuchtigkeit Tagesverlauf', 'rgba(255, 159, 64, 1)', 'data-humidities');
  initializeChart('humidityChartWeek', 'Wochendurchschnitt Luftfeuchtigkeit', 'rgba(54, 162, 235, 1)', 'data-humidities');
  initializeChart('humidityChartAll', 'Allzeitluftfeuchtigkeit', 'rgba(255, 206, 86, 1)', 'data-humidities');
});
