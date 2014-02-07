json.array!(@plans) do |plan|
  json.extract! plan, :wbsno, :wbsname, :quantitiesplan, :quantitiesfact, :wbspctcomp
 # json.url plan_url(plan, format: :json)
end
