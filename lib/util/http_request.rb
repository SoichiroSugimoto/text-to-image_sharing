module HttpRequest::HttpRequest
  class Requester
    def initialize(url)
      @url = url
    end
    
    def http_get(path, params = [], headers = nil)
      conn.get path, params do |request|
        request.headers = headers if headers.present?
      end.tap do |response|
        record_http_response_log(response)
      end
    end

    def http_post(path, req_params = [], headers = nil, params)
      conn.post path, req_params do |request|
        request.params = params if params.present?
        request.headers = headers if headers.present?
      end.tap do |response|
        record_http_response_log(response)
      end
    end

    private

    def conn
      @conn ||= Faraday.new(url: @url) do |f|
        f.adapter Faraday.default_adapter
      end
    end
end