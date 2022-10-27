class MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.get_merchants
  end

  def show
    @merchant = MerchantsFacade.get_merchant(params[:id])
    @items = MerchantsFacade.get_merchant_items(params[:id])
  end

  def search
    @merchants = MerchantsFacade.search_all_merchants(params[:search])
    render "welcome/landing"
  end
end