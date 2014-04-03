json.categories do | i |
	i.array!( @texturecategories ) do | j, category |
	  j.name category['name']
	  j.textures do | s |
	 	 json.array!(category.textures) do |texture|
 	 	  	json.extract! texture, :name,:image_url
 		 end
	  end
	end
end