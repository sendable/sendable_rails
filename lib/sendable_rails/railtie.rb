require 'sendable'

module SendableRails
  class Railtie < Rails::Railtie
    config.sendable = ActiveSupport::OrderedOptions.new

    initializer "sendable.configure" do |app|
      Sendable.config do |config|
        if app.config.sendable[:project_id]
          config.project_id = app.config.sendable[:project_id]
        end

        if app.config.sendable[:api_key]
          config.api_key = app.config.sendable[:api_key]
        end
      end
    end
  end
end
