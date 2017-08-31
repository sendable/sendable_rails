require 'net/http'
require 'uri'

module SendableRails
  module ActionMailerExt
    def collect_responses(headers)
      if sendable = headers.delete(:sendable)
        project_id = SendableRails.config.project_id
        api_key = SendableRails.config.api_key

        uri = URI("https://api.sendable.io/v1/project/#{project_id}/template/#{sendable[:template_id]}/render")

        assigns = {}
        instance_variables.each do |key|
          if match = key.to_s.match(/@([^\_]+)/)
            assigns[match[1]] = instance_variable_get(match[0])
          end
        end

        params = {
          assigns: assigns,
        }

        headers = {
          'Authorization': "ApiKey #{api_key}",
        }

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.set_form_data(params)
        response = http.request(request)

        content = response.body

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
