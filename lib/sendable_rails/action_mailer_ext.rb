require 'sendable'

module SendableRails
  module ActionMailerWithSendable
    def sendable_mail(params = {})
      data = {}
      instance_variables.each do |key|
        if key[0..1] != '@_'
          name = key[1..-1]
          data[name] = instance_variable_get(key)
        end
      end

      Sendable.client.email(params.merge(default_params).merge(data: data))
    end
  end
end

ActionMailer::Base.send(:prepend, SendableRails::ActionMailerWithSendable)
