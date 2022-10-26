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

  def self.get_merchant_items(merchant_id)
    merchant_items = MerchantsService.get_merchant_items(merchant_id)
    merchant_items[:data].map do |data|
      Item.new(data)
    end
  end
end