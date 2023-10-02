console.log("Current_measurements.js loaded!");

document.addEventListener("DOMContentLoaded", () => {
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

document.addEventListener("DOMContentLoaded", () => {

    const initializeChart = (elementId, label, borderColor) => {
        const element = document.getElementById(elementId);
        if (element) {
            const ctx = element.getContext('2d');
            const temperatures = JSON.parse(element.getAttribute('data-temperatures'));
            const timestamps = JSON.parse(element.getAttribute('data-timestamps'));
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: timestamps,
                    datasets: [{
                        label: label,
                        data: temperatures,
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

    initializeChart('temperatureChart', 'Tagestemperatur', 'rgba(75, 192, 192, 1)');
    initializeChart('temperatureChartWeek', 'Wochendurchschnitt Temperatur', 'rgba(255, 99, 132, 1)');
    initializeChart('temperatureChartAll', 'Allzeittemperatur', 'rgba(153, 102, 255, 1)');
    initializeChart('humidityChart', 'Luftfeuchtigkeit Tagesverlauf', 'rgba(255, 159, 64, 1)');
    initializeChart('humidityChartWeek', 'Wochendurchschnitt Luftfeuchtigkeit', 'rgba(54, 162, 235, 1)');
    initializeChart('humidityChartAll', 'Allzeitluftfeuchtigkeit', 'rgba(255, 206, 86, 1)');
});
