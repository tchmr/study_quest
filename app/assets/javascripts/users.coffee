window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    barNum = gon.logs_time.length
    bgColors = new Array(barNum)
    bdColors = new Array(barNum)
    for time, i in gon.logs_time
      if time > 3
        bgColors[i] = '#7A8740'
        bdColors[i] = '#7A8740'
      else
        bgColors[i] = '#BE494D'
        bdColors[i] = '#BE494D'
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: gon.logs_ymd,
            datasets: [{
                label: '学習記録',
                data: gon.logs_time,
                backgroundColor: bgColors,
                borderColor: bdColors,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })