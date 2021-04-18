class EmployeeController < ApplicationController
  def employ

    @emp= current_user
  end
end
