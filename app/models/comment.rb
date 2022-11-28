class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: "User"

  def created_time_formatted
    created_at.strftime("%b %-d, %Y - %l:%M %P")
  end
end
