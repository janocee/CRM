class Contact
	attr_accessor :first_name, :last_name, :email, :notes
	attr_reader :id

	def initialize(id, first_name, last_name, email, notes)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
		@id = id
	end
end