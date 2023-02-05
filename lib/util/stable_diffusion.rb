module Util::StableDiffusion
  BASE_URL = ''.freeze

  class Request
    def query(uri, params = {}, headers = {})
      req_params = base_params.merge(params)
      req_headers = base_headers.merge(headers)
      requester.http_get(uri, req_params, req_headers)
    end

    def create(uri, params = {}, headers = {})
      req_params = URI.encode_www_form(base_params.merge(params))
      req_headers = base_headers.merge(headers)
      requester.http_post(uri, req_params, req_headers, params)
    end

    private

    def base_params
      {}
    end

    def requester
      @requester ||= ::Util::HttpRequest::Requester.new(BASE_URL)
    end

    def base_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{ENV['TOKEN']}"
      }
    end
  end
end