class MerchantsService
  def self.conn
    Faraday.new(url: 'http://localhost:3000')
  end

  def self.get_merchants
    response = conn.get('/api/v1/merchants')
    json_parser(response)
  end

  def self.get_merchant(merchant_id)
    response = conn.get("/api/v1/merchants/#{merchant_id}")
    json_parser(response)
  end

  def self.get_merchant_items(merchant_id)
    response = conn.get("/api/v1/merchants/#{merchant_id}/items")
    json_parser(response)
  end

  def self.json_parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end