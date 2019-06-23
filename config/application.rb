require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MemoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # エラーメッセージ日本語化_20190608
    config.i18n.default_locale = :ja
    # ja.ymlファイルの読み込み(config/locales以下のymlファイル全て読み込む)
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    
    # DBへデータ投入時刻を日本時間に設定_20190611
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    
    # validation時のdivタグ(field_with_errorsクラス)を生成しないよう設定_20190623
    config.action_view.field_error_proc = Proc.new do |html_tag|
      %Q(#{html_tag}).html_safe
    end
    
  end
end
