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
  alert(url);
  fetch (url, {method: 'get'}).then(raw_data = function(response){return response.json();}).then(alert(raw_data));
  alert(raw_data);
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

//MAYBE GET RID OF THIS SCRIPT IF RANDOM IS MEANT TO LINK TO DIFFERENT HTML PAGE?
//Initialize random
function random() {
  var url = getBaseWebURL() + '/random';
  document.location.href = url;
}
document.getElementById('random').onclick = random;
