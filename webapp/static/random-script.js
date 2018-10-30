alert("random page!")

//Initialize home page button
function go_to_home_page() {
  document.location.href = getBaseWebURL();
}
document.getElementById('go_to_home_page').onclick = go_to_home_page;
