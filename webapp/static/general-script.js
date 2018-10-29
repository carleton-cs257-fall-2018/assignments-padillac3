


function getBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + api_port;
    return baseURL;
}


//Initialize demographics buttons

function map() {
  var url = getBaseURL() + '/map?' /* + get keyword args */
  fetch (url, {method: 'get'}).then((response) => response.json()).then(alert(response));



}

function random() {
  var url = getBaseURL() + '/random/';
  alert(url)
  fetch(url, {method: 'get'}).then((response) => response.json()).then(alert(response));
}

document.getElementById('random').onclick = random;
