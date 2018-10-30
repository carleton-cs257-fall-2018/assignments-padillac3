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
  current_demographic = demographic
  var url = getBaseAPIURL() + '/map?' + 'interest=' + interest + '&demographic=' + demographic;
  alert(url)
  //fetch (url, {method: 'get'}).then((response) => response.json()).then(alert(response));
}

//TODO: CHANGE ALL ONCLICKS TO NOT ACTUALLY CALL THE FUNCTION (parentheses) --CALL A NAMELESS FUNCTION INSTEAD WHICH UPDATES current_demographic AND THEN CALLS THE DISPLAY FUNCTION?

// Left hand side buttons
document.getElementById('map').onclick = display({demogrpahic: 'map'});
document.getElementById('age').onclick = display_age({demographic: 'age'});
document.getElementById('gender').onclick = display_graph({demographic: 'gender'});
document.getElementById('population_density').onclick = display_graph({demographic: 'population_density'});

// Arrow buttons
document.getElementById('right_arrow').onclick = display_map({interest: getInterest('right')});
document.getElementById('left_arrow').onclick = display_map({interest: getInterest('left')});

function getInterest(direction) {
  // TODO cycle through interests to return the next
}

//MAYBE GET RID OF THIS SCRIPT IF RANDOM IS MEANT TO LINK TO DIFFERENT HTML PAGE?
//Initialize random
function random() {
  var url = getBaseWebURL() + '/random';
  document.location.href = url;
}
document.getElementById('random').onclick = random;
