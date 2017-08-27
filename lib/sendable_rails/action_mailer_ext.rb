require 'net/http'
require 'uri'

module SendableRails
  module ActionMailerExt
    def collect_responses(headers)
      if sendable = headers.delete(:sendable)
        project_id = SendableRails.config.project_id
        api_key = SendableRails.config.api_key

        uri = URI("https://api.sendable.io/v1/project/#{project_id}/template/#{sendable[:template_id]}/render")
        params = {
        }

        res = Net::HTTP.post_form(uri, params)
        content = res.body

        [{
          content: content
        }]
      else
        super
      end
    end
  end
end

ActionMailer::Base.send(:prepend, SendableRails::ActionMailerExt)
