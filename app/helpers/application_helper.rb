module ApplicationHelper
  def get_google_map_api
    "#{ENV['GOOGLE_MAP_API']}?key=#{ENV['GOOGLE_MAP_KEY']}&callback=initMap&v=weekly"
  end

  def extract_stores_for_markers(stores)
    [stores.map { |e| e.store_type.titleize },
     stores.map { |e| e.latitude },
     stores.map { |e| e.longitude }]
  end
end
