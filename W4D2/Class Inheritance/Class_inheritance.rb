class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def add_employees(*employee)
    @employees = []
    @employees += employee
  end

  def bonus(multiplier)
    bonus_pay = 0
    @employees.each { |employee| bonus_pay += employee.salary * multiplier }
    bonus_pay
  end
end

Ned = Manager.new("Ned", "Founder", 1000000)
Darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
David = Employee.new("David", "TA", 10000, "Darren")
puts "------"
Ned.add_employees(Darren, *Darren.employees)
Darren.add_employees(Shawna, David)
p Ned.employees
p Ned.bonus(5)
p Darren.bonus(4) # => 88_000
p David.bonus(3) # => 30_000
