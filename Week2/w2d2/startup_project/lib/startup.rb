require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize (name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(str)
        salaries.has_key?(str)
    end

    def > (startup)
        @funding > startup.funding
    end

    def hire (name, title )
        if salaries.has_key?(title)
            new_employee = Employee.new(name,title)
            @employees << new_employee
        else
            raise 
        end
    end

    def size 
        @employees.length
    end

    def pay_employee(employee)
        if @salaries[employee.title] < @funding
            @funding -= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
        else
            raise
        end
    end

    def payday
        employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        count = 0
         @employees.each do |employee|
            count += salaries[employee.title]
        end

        return count / @employees.length
    end

    def close 
        @employees.clear
        @funding = 0
    end

    def acquire (startup)
        @funding += startup.funding

        new_salaries = startup.salaries

        new_salaries.each do |key, v|
            if !@salaries.has_key?(key)
                @salaries[key] = v
            end
        end

        @employees += startup.employees

        startup.close
    end
end
