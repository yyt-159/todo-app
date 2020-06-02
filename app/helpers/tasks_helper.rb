module TasksHelper
  def is_deadline_over?(date)
    today = Date.today
    if date < today
      "red"
    else
       "black"
    end
  end

  def who_is_this?(user_id)
    user = User.find_by(id:user_id)
    if user
      user.name
    end
  end

  

end
