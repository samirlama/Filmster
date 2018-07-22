	json.id @user.id
json.username @user.username
json.introduction @user.introduction
json.avatar_url @user.avatar
json.reviews do
  json.array! @user.reviews do |review|
    json.movie review.movie, :title, :id, :release_date, :popularity, :tmdb_id, :poster
    json.comment review.comment
  end
end
json.following_relationships do
  json.array! @user.following_relationships do |following_relationship|
    json.user following_relationship.followed, :id, :email, :introduction
  end
end
json.followed_relationships do
  json.array! @user.followed_relationships do |followed_relationship|
    json.user followed_relationship.follower, :id, :email, :introduction
  end
 end  