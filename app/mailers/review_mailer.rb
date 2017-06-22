class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.user.email,
      subject: "Review Recieved For #{review.museum.name}"
    )
  end
end
