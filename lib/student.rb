class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    self.send
  end
  
# class Klass
#   def hello(*args)
#     "Hello " + args.join(' ')
#   end
# end
# k = Klass.new
# k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"

  def self.create_from_collection(students_array)
    
  end

  def add_student_attributes(attributes_hash)
    
  end

  def self.all
    
  end
end


