json.array!(@landlords) do |landlord|
  json.name landlord.name
  json.landlord_id landlord.id
end