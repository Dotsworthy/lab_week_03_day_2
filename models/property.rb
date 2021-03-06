require("pg")

class Property

  attr_accessor :address, :value, :num_of_bedrooms, :yr_build

  def initialize(options)
    @id = options["id"]
    @address = options["address"]
    @value = options["value"].to_i()
    @num_of_bedrooms = options["num_of_bedrooms"].to_i()
    @yr_build = options["yr_build"].to_i()

  end
  def save()
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "INSERT INTO property_tracker (address, value, num_of_bedrooms, yr_build) VALUES ($1, $2, $3, $4) RETURNING id"
      values = [@address, @value, @num_of_bedrooms, @yr_build]

    db.prepare("save", sql)

    @id = db.exec_prepared("save",values).first()["id"].to_i
    db.close()
  end
    def delete()
      db = PG.connect({
        dbname: "property_tracker",
        host: "localhost"
        })
      sql = "DELETE FROM property_tracker WHERE id = $1"
      values = [@id]
      db.prepare("delete_one", sql)
      db.exec_prepared("delete_one", values)
      db.close()
    end

    def update()
      db = PG.connect({
        dbname: "property_tracker",
        host: "localhost"
        })
        sql = "UPDATE property_tracker
        SET
        (address, value, num_of_bedrooms, yr_build) =
        ($1, $2, $3, $4) WHERE id = $5"
        values = [@address, @value, @num_of_bedrooms, @yr_build, @id]
        db.prepare("update_method", sql)
        db.exec_prepared("update_method", values)
        db.close()
      end

  def Property.all()
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "SELECT * FROM property_tracker"
      db.prepare("all", sql)
      houses = db.exec_prepared("all")
      db.close()
      # return orders
      return houses.map{|house| Property.new(house)}
  end

  def Property.delete_all()
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "DELETE FROM property_tracker"
      db.prepare("delete_all",sql)
      db.exec_prepared("delete_all")
      db.close()
  end

  def Property.find(search_id)
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "SELECT * FROM property_tracker WHERE id = $1"
      values = [search_id]
      db.prepare("find",sql)
      found_property = db.exec_prepared("find", values)
      db.close()
      # return found_property.
      # return Property.new(found_property)
      return found_property.map{|ids| Property.new(ids)}
    end

  def Property.find_by_address(search_address)
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "SELECT * FROM property_tracker WHERE address = $1"
      values = [search_address]
      db.prepare("find_by_address",sql)
      found_property = db.exec_prepared("find_by_address", values)
      db.close()
      return found_property.map{|ids| Property.new(ids)}
  end
end
