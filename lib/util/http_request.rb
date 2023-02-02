module HttpRequest
  def setup_connection
    uri = "http://[適当なURI]/"
    req = Faraday::Connection.new(url: uri) do |conn|
      conn.adapter Faraday.default_adapter
      conn.request :url_encoded
      conn.response :logger # ログを出す
      conn.headers['Content-Type'] = 'application/json' # ヘッダー指定
    end
  end
end