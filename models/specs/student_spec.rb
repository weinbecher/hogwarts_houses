require("minitest/autorun")
require_relative("../student.rb")

class TestStudent < Minitest::Test

  def setup
    options = {
    "first_name" => "Harry",
    "second_name" => "Potter",
    "house" => "Gryffindor",
    "age" => 12
    }

    @student = Student.new(options)
  end


end
