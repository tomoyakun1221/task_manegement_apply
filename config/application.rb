require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BoardApp
  class Application < Rails::Application
    config.load_defaults 5.1
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :ja # デフォルトのlocaleを日本語(:ja)にする
    
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
