class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  
  # インスタンスメソッドを定義
  # 戻り値：自インスタンスidとdescriptionクラスのuser_idが合致するdescriptonインスタンスを配列として返す
  def descriptions
    return Description.where(user_id: self.id).order(created_at: :desc)
  end
end