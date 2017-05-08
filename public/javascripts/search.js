console.log('Search.js loaded');

$('#submit').on('click', function(e){
	let target = $('#searchterm').val()
	var newURL = window.location.protocol + "//" + window.location.host + "/";
	e.preventDefault();
	window.location.replace(newURL + target);
})