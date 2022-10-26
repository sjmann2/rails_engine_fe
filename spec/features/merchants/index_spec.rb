# As a visitor,
# When I visit '/merchants'
# I should see a list of merchants by name
# and when I click the merchant's name
# I should be on page '/merchants/:id'
# And I should see a list of items that merchant sells.
require 'rails_helper'

RSpec.describe 'the merchant index page' do
  describe 'When I visit /merchants I see a list of merchants by name' do
    describe 'When I click the merchants name it directs me to that merchants show page' do
      it 'displays all merchants as a link to their show page', :vcr do
        merchants = MerchantsFacade.get_merchants
        merchant_1 = MerchantsFacade.get_merchant(merchants.first.id)
        items = MerchantsFacade.get_merchant_items(merchants.first.id)

        visit merchants_path

        merchants.each do |merchant|
          expect(page).to have_link(merchant.name)
        end

        click_link("#{merchants.first.name}")
        expect(current_path).to eq(merchant_path(merchant_1.id))

        items.each do |item|
          expect(page).to have_content("#{item.name}")
        end
      end
    end
  end
end