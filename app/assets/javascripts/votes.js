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
  reviewId = this.document.activeElement.attributes.id.value

  var request = $.ajax({
    method: "POST",
    url: 'api/v1/reviews/' + reviewId + '/votes',
    data: { vote: vote }
  });

  request.done(function(data) {
    document.getElementById("score_" + reviewId).innerHTML = "Score: " + data.score
  });
}
