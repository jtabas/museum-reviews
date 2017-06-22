$(document).ready(function() {
  $(".upvote").on("click",(function(event) {
    vote(true);
  }))
  $(".downvote").on("click",(function(event) {
    vote(false);
  }))
});

function vote(vote) {
  event.preventDefault();
  museumId = this.window.location.pathname.split('/')[2]
  reviewId = this.document.activeElement.attributes.id.value
  console.log("Review id: " + reviewId)
  console.log("Museum id: " + museumId)

  var request = $.ajax({
    method: "POST",
    url: '/api/v1/museums/' + museumId + '/reviews/' + reviewId + '/votes',
    data: { vote: vote }
  });

  request.done(function(data) {
    document.getElementById("score_" + reviewId).innerHTML = "Score: " + data.score
  });
}
