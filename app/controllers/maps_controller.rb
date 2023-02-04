class MapsController < ApplicationController
  def index
    @stores = Store.active_markers
  end
end