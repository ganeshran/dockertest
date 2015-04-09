json.array!(@sw_interactions) do |sw_interaction|
  json.extract! sw_interaction, 
  json.url sw_interaction_url(sw_interaction, format: :json)
end
