


function getBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + api_port;
    return baseURL;
}


//Initialize demographics buttons

//Initialize map
function map() {
  var url = getBaseURL() + '/map/?' + 'demographic=region&interest=' + ''/*ID OF SELECTED INTEREST CATEGORY*/;
}
document.getElementById('map').onclick = map;

//Initialize other demographics
function display_data() {
  var url = getBaseURL() + '/map/?' + 'interest=' + /*ID OF SELECTED INTEREST CATEGORY*/ + '&demographic=' + ''/*ID OF CLICKED BUTTON*/;
  fetch (url, {method: 'get'}).then((response) => response.json()).then(alert(response));

}
document.getElementById('age').onclick = display_data;
document.getElementById('gender').onclick = display_data;
document.getElementById('population_density').onclick = display_data;



//MAYBE GET RID OF THIS SCRIPT IF RANDOM IS MEANT TO LINK TO DIFFERENT HTML PAGE?
//Initialize random
function random() {
  var url = getBaseURL() + '/random/';
  alert(url);
  fetch(url, {method: 'get'}).then((response) => response.json()).then(alert(response));
}
document.getElementById('random').onclick = random;
