class Importer < ActiveImporter::Base
  imports User
  # sheet 'Master List'

  column 'Name', :name
  column 'Pledge Class', :pledge_class
  column 'Pledge Class Name', :pledge_class_name
  column 'Graduation Year', :grad_year
  column 'Major', :major
  column 'Street Address', :street
  column 'City and State', :city_state
  column 'Email', :email
  column 'Other email(s)', :email2
  column 'Phone', :phone
  column 'Employer', :employer  
  column 'Job Title', :job_title
  column 'Comments', :comments
end
