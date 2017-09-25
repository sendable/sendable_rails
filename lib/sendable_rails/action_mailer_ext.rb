require 'sendable'

module SendableRails
  module ActionMailerWithSendable
    def sendable_mail(params = {})
      template_id = params.delete(:template_id)

      assigns = {}
      instance_variables.each do |key|
        if key[0..1] != '@_'
          name = key[1..-1]
          assigns[name] = instance_variable_get(key)
        end
      end

      Sendable.client.email(template_id, params.merge(default_params).merge(assigns: assigns))
    end
  end
end

ActionMailer::Base.send(:prepend, SendableRails::ActionMailerWithSendable)
