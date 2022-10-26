require 'rails_helper'

RSpec.describe Item do
  before :each do
    merchant = Merchant.new({id: 1, attributes: {name: "Claire's"}})
    @item = Item.new({id: 1, attributes: { name: "Sparkly earrings", description: "Sparkly", unit_price: 10.99, merchant_id: merchant.id }})
  end

  it 'exists' do
    expect(@item).to be_a(Item)
  end

  it 'has an id' do
    expect(@item.id).to eq(1)
  end

  it 'has a name' do
    expect(@item.name).to eq("Sparkly earrings")
  end

  it 'has a description' do
    expect(@item.description).to eq('Sparkly')
  end

  it 'has a unit price' do
    expect(@item.unit_price).to eq(10.99)
  end
end