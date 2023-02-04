class MapsController < ApplicationController
  def index
    @stores = Store.data_markers
  end
end