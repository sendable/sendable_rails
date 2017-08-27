module SendableRails
  class Railtie < Rails::Railtie
    config.sendable = ActiveSupport::OrderedOptions.new

    initializer "sendable.configure" do |app|
      SendableRails.config do |config|
        config.project_id = app.config.sendable[:project_id]
        config.api_key = app.config.sendable[:api_key]
      end
    end
  end
end
