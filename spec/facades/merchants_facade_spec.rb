require 'rails_helper'

RSpec.describe MerchantsFacade do
  describe 'get_merchants' do
    it 'returns all merchants', :vcr do
      merchants = MerchantsFacade.get_merchants

      expect(merchants).to be_an(Array)
      expect(merchants.first).to be_a(Merchant)
    end
  end

  describe 'get_merchant(merchant_id)' do
    it 'returns a merchant by id', :vcr do
      merchant = MerchantsFacade.get_merchant(55)

      expect(merchant).to be_a(Merchant)
      expect(merchant.name).to be_a(String)
    end
  end

  describe 'get_merchant_items(merchant_id)' do
    it 'returns all of a specified merchants items', :vcr do
      items = MerchantsFacade.get_merchant_items(55)

      expect(items).to be_an(Array)
      expect(items.count).to eq(37)
      expect(items.first).to be_a(Item)
      expect(items.first.name).to be_a(String)
    end
  end
end