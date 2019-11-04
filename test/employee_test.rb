require 'minitest/autorun'
require_relative '../lib/employee'

class TestEmployee < Minitest::Test

  def setup
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
  end

  def test_employee_initialized
    assert_instance_of Employee, @bobbi
    assert_equal 'Bobbi Jaeger', @bobbi.name
    assert_equal '30', @bobbi.age
    assert_equal '100000', @bobbi.salary
  end

end
