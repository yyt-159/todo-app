module UsersHelper
  def who_is_this?(user_id)
    user = User.find_by(id:user_id)
    if user
      user.name
    end
  end#タスクの方でも書いた。ドライじゃなくてすみません。

  def is_deadline_over?(date)
    today = Date.today
    if date < today
      "red"
    else
       "black"
    end
  end
end
