// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

var date = new Date();

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["10대", "20대", "30대", "40대", "50대 이상"],
    datasets: [{
      data: [20, 20, 20, 20, 20],
      backgroundColor: ['#28a745', '#007bff', '#ffc107', '#ff7f00', '#dc3545'],
    }],
  },
});
