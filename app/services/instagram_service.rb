class InstagramService
  def self.get_instagram_account
    # response = conn.get('/instagram_oembed') do |req|
    response = Faraday.new('https://graph.facebook.com/v10.0/instagram_oembed?url=https://www.instagram.com/p/COZT_qYlvLo/&access_token=4312760068785684|wq7RVJ1sFACXADNYzf_PbuRExOY')
    # response = Faraday.new('https://graph.facebook.com/v10.0').get('/instagram_oembed') do |req|
      binding.pry
      # req.params[url] = ENV['INSTAGRAM_URL']
      # req.params[access_token] = ENV['INSTAGRAM_ACCESS_TOKEN']
    # end
    parse_data(response)
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  private
  def self.conn
    Faraday.new('https://graph.facebook.com/v10.0')
  end
end
