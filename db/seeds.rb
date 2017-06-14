museum1 = Museum.create(
  name:'The Franklin Institute',
  description:'Sweet Sweet IMAX',
  hours:'9:30am to 5:00pm M,T,W,TH,F,S,SU',
  address:'222 N 20th St, Philadelphia, PA 19103',
  admission:20.0
)

museum2 = Museum.create(
  name:'Philadelphia Museum of Art',
  description:'Come be a Snob!',
  hours:'9:30am to 5:00pm M,T,W,TH,F,S,SU',
  address:'2600 Benjamin Franklin Pkwy',
  admission:20.0
)

museums = [museum1, museum2]

museums.each do |museum|
  Review.create(rating: 3, body:"I would come back", museum: museum)
  Review.create(rating: 1, body:"I would not come back", museum: museum)
  Review.create(rating: 5)
end
