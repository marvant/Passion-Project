$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
 	$(".new-category-form").submit(function(event){
		event.preventDefault();
		console.log("stoped");

		var catData = $(this).serialize();
		console.log(catData)


		$.ajax({
			method: 'post',
			url: '/categories',
			data: catData
		}).done(function(response){
			// post = JSON.parse(response)
			// console.log(post.title)
			// $("#posts").append('<article class="post"><h1>'+ post.title + '</h1><p class="post_details">Written by '+ post.author_name + '|| <span class="like_count">' + post.likes_count + '</span> likes</p><p class="post_body">' + post.body + '</p><form class="post_like" action="/posts/' + post.id + '/like" method="POST"><input type="hidden" name="_method" value="PUT"><input type="submit" class="post_like_button" value="👍 Like!"></form></article>')

			console.log(response)
			$(".flex-container").append(response)
			// $("#post_form").trigger('reset')
		})
	})


});




