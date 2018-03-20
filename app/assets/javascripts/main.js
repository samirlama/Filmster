$(function(){
	let form = $("#movie-search");
	form.submit(function(e){
		e.preventDefault();
	$.ajax({
		url: 'https://api.themoviedb.org/3/search/movie?api_key=03a0b4b21f01e148a7cc40f3e013cb08',
		data: form.serialize()
	})
	.done(function(data){
		
		displaymovies(data);
	});
});
	$("#movies").on('click','img.image_poster',function(e){
		e.preventDefault;
		
		let id = $(e.target).data('id');

		  $.ajax({
		  	url: 'http://api.themoviedb.org/3/search/movie/' + id + '?',
		  	data: { "api_key": "03a0b4b21f01e148a7cc40f3e013cb08" },
		    crossDomain: true,
		    dataType: "JSON" ,
		    type: "GET",
		    headers: { 'Access-Control-Allow-Credentials': true, 'Access-Control-Allow-Origin':'http://localhost:3000'}
		  	
		  	
 		  })
 		  .done(function(data){
 		  	//displaymovies(data);
 		  	console.log("i m here")
 		  	
 		  })
		  

	});

	
	function getimageUrl () {
		var url = ""
		var settings = {
			"async": false ,
			"crossDomain": true,
			"url": "https://api.themoviedb.org/3/configuration?api_key=03a0b4b21f01e148a7cc40f3e013cb08",
			"method": "GET",
			"data": "{}"


		} 
		$.ajax(settings).done(function(response){
			url = response["images"]["base_url"] + response["images"]["poster_sizes"][3];
		});
		return url;
	};

	function displaymovies(data){
		let htmlstring="";
		let container = $("#movies");
		container.empty();
		let imageUrl = getimageUrl();

		if(data["results"].length == 0 )
		{
			htmlstring = `<div class="alert alert-danger text-center" role="alert">No Data Found!</div>`;
		}
		else
		{
		data["results"].forEach(function(movie){
			htmlstring+= `<img src=${movie["poster_path"] == null ? "/assets/your_default_image.png" : imageUrl + "/" + movie["poster_path"]} data-id="${movie['id']}" class="image_poster" />
							<p>${movie["title"]}</p>
							<p>${movie["overview"]}</p>` 

		});

		};


		container.append(htmlstring);

	};

});