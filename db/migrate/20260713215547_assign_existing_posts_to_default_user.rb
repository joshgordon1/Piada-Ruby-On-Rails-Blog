class AssignExistingPostsToDefaultUser < ActiveRecord::Migration[8.1]
  def up
    user = User.find_by(email_address: "joshgordon567@gmail.com")
    BlogPost.where(user_id: nil).update_all(user_id: user.id) if user

    change_column_null :blog_posts, :user_id, false
  end

  def down
    change_column_null :blog_posts, :user_id, true
  end
end
