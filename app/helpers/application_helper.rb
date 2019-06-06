module ApplicationHelper
  # 各ページごとで適したタイトルを返すメソッド
  def full_title(page_title = '')
    base_title = "MemoApp"
    # ページのタイトルが空の場合
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
