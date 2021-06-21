crumb :root do
  link "ホーム", root_path
end

crumb :user_show do |user|
  link "ユーザープロフィール", user_path(user)
  parent :root
end

crumb :user_mypage do |user|
  link "マイページ", mypage_user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "プロフィールの編集", edit_user_path(user)
  parent :user_mypage, user
end

crumb :book_search do |q|
  link "本を探す", search_books_path(q: q)
  parent :root
end

crumb :new_post do |q|
  link "新規投稿", new_post_path()
  parent :book_search, q
end

crumb :post_show do |post|
  link "投稿詳細", post_path(post)
  parent :root
end

crumb :post_edit do |post|
  link "投稿の編集", edit_post_path(post)
  parent :post_show, post
end
