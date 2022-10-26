class MerchantsFacade
  def self.get_merchants
    merchants_data = MerchantsService.get_merchants
    merchants_data[:data].map do |data|
      Merchant.new(data)
    end
  end
  
  def self.get_merchant(merchant_id)
    merchant_data = MerchantsService.get_merchant(merchant_id)
    Merchant.new(merchant_data[:data])
  end
end