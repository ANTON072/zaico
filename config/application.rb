require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Tokyo"
    # ロケールファイルのロードパスの設定
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :ja

    # ジェネレータによるソースコードの生成をOFF
    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.assets false
      # テストフレームワークをrspecに変更
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
  end
end
