require 'rails_helper'

RSpec.describe Merchant do
  before :each do
    @merchant = Merchant.new({id: 1, attributes: { name: "John's Hot Dogs"}})
  end

  it 'exists' do
    expect(@merchant).to be_a(Merchant)
  end

  it 'has an id' do
    expect(@merchant.id).to eq(1)
  end

  it 'has a name' do
    expect(@merchant.name).to eq("John's Hot Dogs")
  end
end