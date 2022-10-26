require 'rails_helper'

RSpec.describe MerchantsService do
  describe 'get_merchants' do
    it 'returns an HTTP response of all merchants', :vcr do
      merchants = MerchantsService.get_merchants

      expect(merchants).to be_a(Hash)
      expect(merchants[:data]).to be_an(Array)
      expect(merchants[:data].count).to eq(100)
      expect(merchants[:data][0][:attributes]).to have_key(:name)
      expect(merchants[:data][0][:attributes][:name]).to be_a(String)
    end
  end

  describe 'get_merchant(merchant_id)' do
    it 'returns an HTTP response of a single merchant by id', :vcr do
      merchant = MerchantsService.get_merchant(55)

      expect(merchant).to be_a(Hash)
      expect(merchant[:data]).to be_a(Hash)
      expect(merchant.count).to eq(1)
      expect(merchant[:data][:attributes]).to have_key(:name)
      expect(merchant[:data][:attributes][:name]).to be_a(String)
    end
  end

  describe 'get_merchant_items(merchant_id)' do
    it 'returns an HTTP response of a merchants items by merchant id', :vcr do
      items = MerchantsService.get_merchant_items(55)

      expect(items).to be_a(Hash)
      expect(items[:data]).to be_an(Array)
      expect(items[:data].count).to eq(37)
      expect(items[:data][0][:attributes]).to have_key(:name)
      expect(items[:data][0][:attributes][:name]).to be_a(String)
    end
  end
end