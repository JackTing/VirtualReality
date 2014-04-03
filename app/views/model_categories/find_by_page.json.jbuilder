
json.categories do | i |
	i.array!( @model_categories ) do | j, category |
	  j.name category['name']
	  j.models do | s |
	 	 json.array!(category.model_libs) do |model_lib|
 	 	  	json.extract! model_lib, :name,:image_url,:source_url
 		 end
	  end
	end
end