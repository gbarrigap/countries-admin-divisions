class AddressesController < ApplicationController
  def index
  end

  def create
  end

  def new
    @address = Address.first
  end
end
