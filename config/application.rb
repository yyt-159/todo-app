require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.action_controller.include_all_helpers = false #ヘルパー全部読み込まないよ
    config.i18n.default_locale = :ja #エラーメッセージを日本語にするよ
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s] #全てのymlファイルを読み込んでね
    config.action_view.embed_authenticity_token_in_remote_forms = true
    #チュートリアルのぶんだけど、ワンチいらない
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
