module ApplicationHelper
  def current_user?(user)
    current_user == user
  end

  def answered?(book_id)
    current_user.lessons.where(book_id: book_id).exists?
  end

  def last_lesson(book_id)
    current_user.lessons.where(book_id: book_id).pluck(:id)
  end
end