module UsersHelper

  def post_detector?
    @posts.length == 0
  end

  def comment_detector?

    @user.comments.size == 0
  end
end
