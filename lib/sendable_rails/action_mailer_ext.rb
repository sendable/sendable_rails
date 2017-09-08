require 'sendable'

module SendableRails
  module ActionMailerWithSendable
    def sendable_mail(params = {})
      template_id = params.delete(:template_id)

      assigns = {}
      instance_variables.each do |key|
        if match = key.to_s.match(/@([^\_]+)/)
          assigns[match[1]] = instance_variable_get(match[0])
        end
      end

      Sendable.client.email(template_id, params.merge(assigns: assigns))
    end
  end
end

ActionMailer::Base.send(:prepend, SendableRails::ActionMailerWithSendable)
