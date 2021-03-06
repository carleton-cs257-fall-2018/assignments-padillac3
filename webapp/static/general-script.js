// General Script
// Chris Padilla and Yasmeen Awad


function getBaseAPIURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + api_port;
    return baseURL;
}

function getBaseWebURL() {
  var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port;
  return baseURL;
}

//Initialize global variables
var current_demographic = 'region';
var current_interest = 'side';

var posX = '0px';
var posY = '0px';


//Initialize display function
function display({interest = current_interest, demographic = current_demographic}) {
  current_demographic = demographic;
  var url = getBaseAPIURL() + '/map?' + 'interest=' + interest + '&demographic=' + demographic;

  function parse_data(raw_data) {
    if (current_demographic == 'region') { //Demographic == region

      var formatted_data = {};
      var done_regions = [];

      for (let tuple of raw_data) {
        if (done_regions.includes(tuple[0])) {
          formatted_data[tuple[0]][0].labels.push(tuple[1]);
          formatted_data[tuple[0]][0].values.push(tuple[2]);
        } else {
          formatted_data[tuple[0]] = [{values: [], labels: [], type: 'pie'}];
          formatted_data[tuple[0]][0].labels.push(tuple[1]);
          formatted_data[tuple[0]][0].values.push(tuple[2]);
          done_regions.push(tuple[0]);
        }
      }

      var layout = {
        showlegend: true,
        autosize: false,
        width: 600,
        height: 250,
        margin: {
          l: 0,
          r: 0,
          b: 3,
          t: 3,
          pad: 2
        }
      };

      for (key in formatted_data) {
        if (key != 'null') {
          Plotly.newPlot((key + ' plotly'), formatted_data[key], layout, {responsive: true});
        }
      }

    } else { //Other demographic choice

      var tracelist = [];
      var done_interest = {};

      for (let tuple of raw_data) {
        if (Object.keys(done_interest).includes(tuple[1])) {
          tracelist[done_interest[tuple[1]]-1].x.push(tuple[0]);
          tracelist[done_interest[tuple[1]]-1].y.push(tuple[2]);
        } else {
          done_interest[tuple[1]] = tracelist.push({x: [tuple[0]], y: [tuple[2]], name: tuple[1], type: 'bar'});
        }
      }

      var layout = {
        barmode: 'stack',
        autosize: false,
        width: 813,
        height: 463,
        margin: {
          l: 50,
          r: 50,
          b: 50,
          t: 50,
          pad: 5
        }
      };

      Plotly.newPlot('data-vis-div', tracelist, layout, {responsive: true});

      document.getElementById('data-image').style.visibility = 'hidden';
      document.getElementById('data-image').style.top = '100%';
      document.getElementById('data-image').style.left = '100%';
      document.getElementById('data-image').style.position = 'absolute';

      plotlygraph = document.getElementById('data-vis-div')
      plotlygraph.style.visibility = 'visible';
      plotlygraph.style.top = 'auto';
      plotlygraph.style.left = 'auto';
      plotlygraph.style.position = 'relative';
      //plotlygraph.style.float = 'left';
    }
  }

  fetch(url, {method: 'get'}).then((response) => response.json()).then(function(raw_data){parse_data(raw_data);});

  if (current_demographic == 'region') {
    var region_bit_maps = Array.from(document.getElementById('region-image-map').childNodes);

    for (var i = 1; i < region_bit_maps.length; i+=2) {
      region_bit_maps[i].onmousemove = function() {
        var root = document.querySelector('html');
        root.style.setProperty('--posX', (window.event.clientX - 126) + 'px');
        root.style.setProperty('--posY', (window.event.clientY - 252) + 'px');
        plotlydiv = document.getElementById((this.id + ' plotly'));
        plotlydiv.style.visibility = 'visible';
        plotlydiv.style.top = 'var(--posY)';
        plotlydiv.style.left = 'var(--posX)';
        plotlydiv.onmouseover = function() {};
      };
      region_bit_maps[i].onmouseout = function() {
        plotlydiv = document.getElementById((this.id + ' plotly'));
        plotlydiv.style.visibility = 'hidden';
        plotlydiv.style.top = '100%';
        plotlydiv.style.left = '100%';
      };
    }
  }
}


// Left hand side buttons
document.getElementsByTagName('body')[0].onload = function() {display({demographic: 'region'})};
document.getElementById('map').onclick = function() {var url = getBaseWebURL(); document.location.href = url};
document.getElementById('age').onclick = function() {display({demographic: 'age'})};
document.getElementById('gender').onclick = function() {display({demographic: 'gender'})};
document.getElementById('population_density').onclick = function() {display({demographic: 'population_density'})};


// Arrow buttons
document.getElementById('right_arrow').onclick = function() {display({interest: getInterest(1)})};
document.getElementById('left_arrow').onclick = function() {display({interest: getInterest(-1)})};


function getInterest(direction) {
  interests = [];
  Array.from(document.getElementById('interest-button-list').childNodes).forEach(function(element) {
    if (element.tagName == 'LI'){interests.push(element.id);}
  });

  current_index = interests.indexOf(current_interest);

  if (((current_index + direction) % interests.length) == -1) {current_index = 16}

  new_interest = interests[((current_index + direction) % interests.length)];

  document.getElementById('selected-interest-button').name = new_interest;
  document.getElementById('selected-interest-button').innerHTML = document.getElementById(new_interest).innerHTML;

  current_interest = new_interest;
  return new_interest;
}

//Initialize random button to point to new page
function random() {
  var url = getBaseWebURL() + '/random';
  document.location.href = url;
}
document.getElementById('random').onclick = random;
