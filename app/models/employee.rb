class Employee < ActiveRecord::Base
	require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      employee_hash = row.to_hash # exclude the price field
      employee = Employee.where( name: employee_hash["name"], number: employee_hash["number"])

      if employee.count == 1
        product.first.update_attributes(employee_hash)
      else
        Employee.create!(employee_hash)
      end # end if !employee.nil?
    end # end CSV.foreach
  end # end self.import(file)
end # end class