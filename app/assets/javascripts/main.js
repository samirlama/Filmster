$(function(){
	
	

	let form = $("#movie-search");
	form.submit(function(e){
		e.preventDefault();
	$.ajax({
		url: 'https://api.themoviedb.org/3/search/movie?api_key=03a0b4b21f01e148a7cc40f3e013cb08',
		data: form.serialize()
	})
	.done(function(data){
		//console.log(data);
		displaymovies(data);
	});
});
	$("#movies").on('click','img.image_poster',function(e){
		e.preventDefault;
		
		let id = $(e.target).data('id');

		  $.ajax({
		  	url: 'https://api.themoviedb.org/3/movie/' + id + '?',
		  	data: { "api_key": "03a0b4b21f01e148a7cc40f3e013cb08" }
		    
		    
		  	
		  	
 		  })
 		  .done(function(data){
 		  	displayMovie(data);
 		  	
 		  	

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
	function displayMovie(movie){
		let htmlstring="";
		let container = $("#movies");
		let imageUrl = getimageUrl();
		container.empty();
		htmlstring = `<div class="container">
						<div class=" box panel panel-default ">
							
								<img src=${imageUrl}/${movie["poster_path"]}>
								<div class="panel-body box">
							
						  <p>${movie["title"]}</p>
						  <p>${movie["overview"]}</p>
						  
						  	<form id="rating-form" action="/reviews" method="POST">
						  <input type="hidden" name="authenticity_token" value=${window._token} />
  <input type="hidden" name="tmdb_id" value=${movie["id"]} />
  <textarea name= "review[comment]" class="form-control" placeholder="Your movie review"/>
  <br />
  <input type="submit" class="btn btn-success pull-right" />
</form></div></div>`
		container.append(htmlstring);
		
		
	}

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
			htmlstring+= `<div class="container">
							<div class="box panel panel-default">
								<img src=${movie["poster_path"] == null ? "/assets/your_default_image.png" : imageUrl + "/" + movie["poster_path"]} data-id="${movie['id']}" class="image_poster" />
							<div class="panel-body">
							<p>${movie["title"]}</p>
							<p>${movie["overview"]}</p></div>
							
							</div>` 

		});

		};


		container.append(htmlstring);
		
		container.imagesLoaded(function(){
			container.masonry({
				itemSelector: '.box',
				isFitWidth: true
			});
		});

	};

});