# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  latitude   :float
#  longitude  :float
#  name       :string
#  status     :integer
#  store_type :integer
#
# Indexes
#
#  index_stores_on_store_type_and_status  (store_type,status)
#
class Store < ActiveRecord::Base
  STORE_TYPES = {
    spa_and_massage: 1,
    nails: 2,
    hair_removal: 3,
    babershop: 4
  }

  enum status: { active: 1, inactive: 2 }
  enum store_type: STORE_TYPES

  scope :data_markers, -> { active.select(:store_type, :latitude, :longitude, :name) }

  def active_markers
    data = nil
    data = ManualCacheService.new(:get, 'store').deliver unless ENV['TURN_OFF_MANUAL_CACHE']

    return JSON.parse(data) if data

    data_markers.as_json
  end
end
