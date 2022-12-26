module OpenAI
  class Finetunes
    include HTTParty
    base_uri "https://api.openai.com"

    def initialize(access_token: nil, organization_id: nil)
      Ruby::OpenAI.configuration.access_token = access_token if access_token
      Ruby::OpenAI.configuration.organization_id = organization_id if organization_id
    end

    def list(version: Ruby::OpenAI.api_version)
      self.class.get(
        "/#{version}/fine-tunes",
        headers: Ruby::OpenAI.headers
      )
    end

    def create(version: Ruby::OpenAI.api_version, parameters: {})
      self.class.post(
        "/#{version}/fine-tunes",
        headers: Ruby::OpenAI.headers,
        body: parameters.to_json
      )
    end

    def retrieve(id:, version: Ruby::OpenAI.api_version)
      self.class.get(
        "/#{version}/fine-tunes/#{id}",
        headers: Ruby::OpenAI.headers
      )
    end

    def cancel(id:, version: Ruby::OpenAI.api_version)
      self.class.post(
        "/#{version}/fine-tunes/#{id}/cancel",
        headers: Ruby::OpenAI.headers
      )
    end

    def events(id:, version: Ruby::OpenAI.api_version)
      self.class.get(
        "/#{version}/fine-tunes/#{id}/events",
        headers: Ruby::OpenAI.headers
      )
    end
  end
end
