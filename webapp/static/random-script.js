
function getBaseAPIURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + api_port;
    return baseURL;
}

function getBaseWebURL() {
  var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port;
  return baseURL;
}

function display_story() {
  var url = getBaseAPIURL() + "/random";
  fetch(url, {method: 'get'}).then((response) => response.json()).then(function(story) {
    var text_location = document.getElementById('story');
    if (text_location) {
      text_location.innerHTML = story;
    }
  });

}

//Initialize home page button
function go_to_home_page() {
  document.location.href = getBaseWebURL();
}
document.getElementById('go_to_home_page').onclick = go_to_home_page;
document.getElementById('back-button').onclick = go_to_home_page;
document.getElementById('random').onclick = display_story;
