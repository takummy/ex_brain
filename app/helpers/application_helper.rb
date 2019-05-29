module ApplicationHelper
  def current_user?(user)
    current_user == user
  end

  def answered?(book_id)
    current_user.lessons.where(book_id: book_id).exists?
  end
end
