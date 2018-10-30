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

var current_demographic = 'region'

//Initialize demographics buttons

//Initialize map
function display({interest = 'side', demographic = current_demographic}) {
  current_demographic = demographic;
  var url = getBaseAPIURL() + '/map?' + 'interest=' + interest + '&demographic=' + demographic;

  function parse_data(raw_data) {
    if (current_demographic == 'region') { //Demographic == region
      alert("Region data!");

      var formatted_data = {};
      var done_regions = [];

      //alert("INITIAL RAW DATA: " + raw_data);
      //alert("INITIAL FORMATTED DATA" + formatted_data);
      for (let tuple of raw_data) {
        //alert("TUPLE: " + tuple);
        if (done_regions.includes(tuple[0])) {
          alert("TRUE");
          formatted_data[tuple[0]][0].labels.push(tuple[1]);
          formatted_data[tuple[0]][0].values.push(tuple[2]);
        } else {
          formatted_data[tuple[0]] = [{values: [], labels: [], type: 'pie'}];
          formatted_data[tuple[0]][0].labels.push(tuple[1]);
          formatted_data[tuple[0]][0].values.push(tuple[2]);
          done_regions.push(tuple[0]);
        }
        //alert("DATA: " + formatted_data);
      }

      alert("DONE PARSING: " + formatted_data);

      alert(JSON.stringify(formatted_data));

      document.getElementById('PLOTLYTEST').INNERHTML = formatted_data;


      for (key in formatted_data) {
        if (key != 'null') {
          alert(key + " : " + formatted_data[key]);
          Plotly.newPlot(key, formatted_data[key]);
        }
      }


      //{'pacific': [{values: [], labels: [], type: 'pie'}] }


    } else { //Other demographic choice
      alert("other demographic");
      var done_interest = [];
      for (var tuple in raw_data) {
        if (tuple[1] in done_interest) {
          //ADD TO EXISTING TRACE
        } else {
          //CREATE NEW TRACE AND ADD DATA TO IT
        }
      }
    }
  }

  fetch(url, {method: 'get'}).then((response) => response.json()).then(function(raw_data){alert(raw_data);parse_data(raw_data);})
}

// Left hand side buttons
document.getElementById('map').onclick = function() {display({demographic: 'region'})};
document.getElementById('age').onclick = function() {display({demographic: 'age'})};
document.getElementById('gender').onclick = function() {display({demographic: 'gender'})};
document.getElementById('population_density').onclick = function() {display({demographic: 'population_density'})};

// Arrow buttons
document.getElementById('right_arrow').onclick = function() {display({interest: getInterest('right')})};
document.getElementById('left_arrow').onclick = function() {display({interest: getInterest('left')})};

function getInterest(direction) {
  // TODO cycle through interests to return the next
  //RETURN INNERHTML OF NEW LIST ITEM
}

//Initialize random
function random() {
  var url = getBaseWebURL() + '/random';
  document.location.href = url;
}
document.getElementById('random').onclick = random;
document.getElementById('back-button').onclick = display;
