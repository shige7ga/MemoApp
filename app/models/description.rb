class Description < ApplicationRecord
  # contentカラムは空文字はエラー
  validates :content, {presence: true}
  # memoTitleカラムは21文字以上でエラー
  validates :memoTitle, {length: {maximum: 20}}
  validates :user_id, {presence: true}
  
  # Definition of instance method
  def user
    # 自インスタンスのuser_idの値に紐付くuserインスタンスを戻り値として返す
    return User.find(self.user_id)
  end
end
