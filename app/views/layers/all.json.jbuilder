
json.array!( @layers ) do | j, layer |
  j.name layer['name']
  j.objectname do | s |
 	 json.array!(layer.unity3ds) do |unity3d|
	 	  	json.extract! unity3d, :objectname
	 end
  end
end