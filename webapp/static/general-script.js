


function getBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + api_port;
    return baseURL;
}


//Initialize demographics buttons

//Initialize map
function display_map(interest) {
  var url = getBaseURL() + '/map?' + 'demographic=region&interest=' + interest;
}
document.getElementById('map').onclick = display_map;

//Initialize other demographics
function display_graph(interest, demographic) {
  var url = getBaseURL() + '/map?' + 'interest=' + interest + '&demographic=' + demographic;
  fetch (url, {method: 'get'}).then((response) => response.json()).then(alert(response));

}
document.getElementById('age').onclick = display_graph;
document.getElementById('gender').onclick = display_graph;
document.getElementById('population_density').onclick = display_graph;



//MAYBE GET RID OF THIS SCRIPT IF RANDOM IS MEANT TO LINK TO DIFFERENT HTML PAGE?
//Initialize random
function random() {
  var url = getBaseURL() + '/random/';
  alert(url);
  fetch(url, {method: 'get'}).then((response) => response.json()).then(alert(response));
}
document.getElementById('random').onclick = random;
