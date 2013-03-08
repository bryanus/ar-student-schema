require_relative '../../db/config'

# implement your Student model here


class Student < ActiveRecord::Base #need to inherit here or delete_all errors
  
  validates :email, :uniqueness => true, :format => { :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i, :message => "try entering a REAL email" }
  validates :age,   :numericality => { :greater_than_or_equal_to => 5 }
  validates :phone, :format => { :with =>  /^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$/, :message => "try entering a REAL phone number" }

  #initialize not needed; must be getting it from AR
  
 
  def name
    "#{@first_name} #{@last_name}"
  end
  
  def age
    today = Date.today
    today.year - birthday.year - ((today.month > birthday.month || (today.month == birthday.month && today.day >= birthday.day)) ? 0 : 1)
  end

  # def validations
  #   #valid email address has @ and .
    

  #   if email adress includes 
  #   while @email.include?('@') && @email.include?('.')
  #     @email.to_s

  # #   it "shouldn't accept invalid emails" do
  # #   ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
  # #     @student.assign_attributes(:email => address)
  # #     @student.should_not be_valid
  # #   end
  # # end

  # # it "should accept valid emails" do
  # #   ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
  # #     @student.assign_attributes(:email => address)
  # #     @student.should be_valid
  # #   end
  # # end


  # #  it "shouldn't allow two students with the same email" do
  # #   another_student = Student.create!(
  # #     :birthday => @student.birthday,
  # #     :email => @student.email,
  # #     :phone => @student.phone
  # #   )
  # #   @student.should_not be_valid
  # # end


  #   #must be at least 5yrs old
  #   today = Date.today
  #   today.year - birthday.year > 5
  #   #no duplicate emails
  #   # @email


  # end


end  
