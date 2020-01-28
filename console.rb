require("pry-byebug")
require_relative("models/property")

Property.delete_all()

house1 = Property.new({
  "address" => "East Pilton",
  "value" => "250000",
  "num_of_bedrooms" => "4",
  "yr_build" => "2010"
  })
house1.save()
house2 = Property.new({
  "address" => "West Pilton",
  "value" => "50000",
  "num_of_bedrooms" => "2",
  "yr_build" => "2010"
  })
house2.save()
house3 = Property.new({
  "address" => "Farm Crescent",
  "value" => "111250000",
  "num_of_bedrooms" => "7",
  "yr_build" => "2010"
  })
house3.save()


  binding.pry#STOPS EXECUTION OF A CODE
  nil
