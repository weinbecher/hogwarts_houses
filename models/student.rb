require_relative('../db/sql_runner')
class Student

  attr_reader :id, :first_name, :second_name, :house, :age

  def initialize(options)

    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@second_name}"
  end


  def save()
    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house_id,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @second_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def house()
    house = House.find(@house_id)
    return house
  end



  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values)
  end


  def self.delete_all()
    sql = "DELETE From students"
    SqlRunner.run(sql)
  end



  def self.all()
    sql = "SELECT * From students"
    students = SqlRunner.run(sql)
    result = students.map{|student| Student.new(student)}
    return result
  end


  def self.find( id )
  sql = "SELECT * FROM students
  WHERE id = $1"
  values = [id]
  student = SqlRunner.run( sql, values )
  result = Student.new( student.first )
  return result
  end



end
