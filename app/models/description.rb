class Description < ApplicationRecord
  # contentカラムは空文字はエラー
  validates :content, {presence: true}
  # memoTitleカラムは21文字以上でエラー
  validates :memoTitle, {length: {maximum: 20}}
end
