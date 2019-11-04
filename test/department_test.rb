require 'minitest/autorun'
require_relative '../lib/department'
require_relative '../lib/employee'

class TestDepartment < Minitest::Test
  def setup
    @customer_service = Department.new("Customer Service")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  def test_department_initialized
    assert_instance_of Department, @customer_service
    assert_equal 'Customer Service', @customer_service.name
    assert_equal [], @customer_service.employees
  end

  def test_department_employees
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    assert_equal [@bobbi, @aaron], @customer_service.employees
  end

  def test_department_expenses
    assert_equal 0, @customer_service.expenses
    @customer_service.expense(100)
    @customer_service.expense(25)
    assert_equal 125, @customer_service.expenses
  end
end
