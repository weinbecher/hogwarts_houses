require_relative('../db/sql_runner')

class House
  attr_reader :id, :name, :logo

  def initialize(options)

    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses
    (
      name,
      logo
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @logo]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end


  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    house = House.new(result)
    return house
  end



  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end



  def self.delete_all()
    sql = "DELETE From houses"
    SqlRunner.run(sql)
  end

end
