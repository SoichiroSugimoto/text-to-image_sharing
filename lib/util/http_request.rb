module HttpRequest
  def man_faraday
    conn = Faraday.new(
      url: 'http://httpbingo.org',
      params: {param: '1'},
      headers: {'Content-Type' => 'application/json'}
    )

    response = conn.post('/post') do |req|
      req.params['limit'] = 100
      req.body = {query: 'chunky bacon'}.to_json
    end
  end
end