json.array!(@units) do |unit|
  json.address unit.address
  json.unit_id unit.id
end