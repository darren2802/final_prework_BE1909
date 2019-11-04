class Company

  attr_reader :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def all_employees
    all_employees = @departments.flat_map { |dept| dept.employees }
  end

  def average_age
    total_age = all_employees.sum { |employee| employee.age.to_i }
    (total_age / all_employees.length.to_f).round(1)
  end
end
