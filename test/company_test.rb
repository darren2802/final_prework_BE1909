require 'minitest/autorun'
require_relative '../lib/company'
require_relative '../lib/department'
require_relative '../lib/employee'

class TestCompany < Minitest::Test
  def setup
    @cocacolasub = Company.new('Coca Cola Subsidiary')
    @customer_service = Department.new("Customer Service")
    @warehouse = Department.new('Warehouse')
    @finance = Department.new('Finance')
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
    @darren = Employee.new({name: "Darren Campbell", age: "34", salary: "60000"})
    @dione = Employee.new({name: "Dione Wilson", age: "25", salary: "90000"})
    @megan = Employee.new({name: "Megan McMahon", age: "25", salary: "90000"})
    @aurora = Employee.new({name: "Aurora Z", age: "25", salary: "90000"})
  end

  def test_company_initialized
    assert_instance_of Company, @cocacolasub
    assert_equal 'Coca Cola Subsidiary', @cocacolasub.name
    assert_equal [], @cocacolasub.departments
  end

  def test_company_has_departments
    @cocacolasub.add_department(@customer_service)
    @cocacolasub.add_department(@warehouse)
    @cocacolasub.add_department(@finance)
    assert_equal [@customer_service, @warehouse, @finance], @cocacolasub.departments
  end

  def test_company_can_list_all_employees
    @cocacolasub.add_department(@customer_service)
    @cocacolasub.add_department(@warehouse)
    @cocacolasub.add_department(@finance)
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    @warehouse.hire(@darren)
    @warehouse.hire(@dione)
    @finance.hire(@megan)
    @finance.hire(@aurora)
    assert_equal [@bobbi, @aaron, @darren, @dione, @megan, @aurora], @cocacolasub.all_employees
  end

  def test_company_average_age
    @cocacolasub.add_department(@customer_service)
    @cocacolasub.add_department(@warehouse)
    @cocacolasub.add_department(@finance)
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    @warehouse.hire(@darren)
    @warehouse.hire(@dione)
    @finance.hire(@megan)
    @finance.hire(@aurora)
    assert_equal 27.3, @cocacolasub.average_age
  end

end
