require "json"

RECONFIG_TYPE = {
  "spa" => Store::STORE_TYPES[:spa_and_massage],
  "nails" => Store::STORE_TYPES[:nails],
  "hair_removal" => Store::STORE_TYPES[:hair_removal],
  "babershop" => Store::STORE_TYPES[:babershop]
}

data_json = File.read("#{Rails.public_path}/data.json")
data = JSON.parse(data_json)
data.each do |e|
  type = RECONFIG_TYPE[e['types']]
  Store.create(name: e['name'], latitude: e['lat'], longitude: e['lng'], status: :active, store_type: type)
end