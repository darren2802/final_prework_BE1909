class Employee

  attr_reader :name, :age, :salary

  def initialize(input_data)
    @name = input_data[:name]
    @age = input_data[:age]
    @salary = input_data[:salary]
  end
end
