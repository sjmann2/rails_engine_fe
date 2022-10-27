require 'rails_helper'

RSpec.describe 'the landing page' do
  describe 'searching all merchants' do
    it 'displays a search bar that can search for all merchants by name fragment', :vcr do
      merchants = MerchantsFacade.search_all_merchants('sch')

      visit root_path

      fill_in 'Search', with: 'sch'
      click_on 'Search'
      
      merchants.each do |merchant|
        expect(page).to have_content("#{merchant.name}")
      end
    end
  end
end