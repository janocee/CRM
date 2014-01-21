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

class Rolodex
	def initialize
		@contacts = []
		@id = 100
	end

	def add_new_contact
		@id += 1

		puts "Input first name"
		first_name = gets.chomp

		puts "Input last name"
		last_name = gets.chomp

		puts "Input email"
		email = gets.chomp

		puts "Input notes"
		notes = gets.chomp

		contact = Contact.new(@id, first_name, last_name, email, notes)
		@contacts << contact
		puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
	end

	def display_contact
		puts "Please enter the ID of the contact you are searching for"
		id = gets.chomp.to_i
		@contacts.each do |contact|
			if contact.id == id
				puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
			end
		end
	end

	def delete_contact
		 puts "Please enter the ID of the contact you wish to delete"
		 id = gets.chomp.to_i
		 result = nil
		 @contacts.each do |contact|
		 	if contact.id == id
		 		result = contact
		 	end
		 end
		 @contacts.delete(result)
	end

	def modify_existing_contact
		puts "Please enter the ID of the contact you wish to modify"
		id = gets.chomp.to_i
		@contacts.each do |contact|
			if contact.id == id

				puts "Please select from the following:\n[1] edit the first name\n[2] edit the last name\n[3] edit the email\n[4] edit the note"
				selection = gets.chomp.to_i

				if selection == 1
					puts "Please enter the new first name"
					new_first = gets.chomp
					contact.first_name = new_first
					puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
				elsif selection == 2
					puts "Please enter the new last name"
					new_last = gets.chomp
					contact.last_name = new_last
					puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
				elsif selection == 3
					puts "Please enter the new email"
					new_email = gets.chomp
					contact.email = new_email
					puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
				elsif selection == 4
					puts "Please enter a new note"
					new_note = gets.chomp
					contact.notes = new_note
					puts "ID: #{contact.id}\nFirst Name: #{contact.first_name}\nLast Name: #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
				end
			end
		end
	end

	def display_info_by_attribute
		puts "Please enter the ID of the contact you wish to modify"
		id = gets.chomp.to_i
		@contacts.each do |contact|
			if contact.id == id

				puts "Please indicate which attribute to display from the following:\n[1] First name\n[2] Last Name\n[3] Email\n[4] Notes"
				selection = gets.chomp.to_i
				if selection == 1
					puts "First name: #{contact.first_name}"
				elsif selection == 2
					puts "Last name: #{contact.last_name}"
				elsif selection == 3
					puts "Email: #{contact.email}"
				elsif selection == 4
					puts "Notes: #{contact.notes}"
				end
			end
		end
	end

end

class CRM

	def initialize
		@rolodex = Rolodex.new
	end

  def print_main_menu
  	puts "[1] Add a new contact"
  	puts "[2] Modify an existing contact"
  	puts "[3] Delete a contact"
  	puts "[4] Display a contact"
  	puts "[5] Display an attribute"
  	puts "[6] Exit"
  	puts "Enter a number: "
	end

  def call_option(user_selected)
  	@rolodex.add_new_contact if user_selected == 1
  	@rolodex.modify_existing_contact if user_selected == 2
  	@rolodex.delete_contact if user_selected == 3
  	@rolodex.display_contact if user_selected == 4
  	@rolodex.display_info_by_attribute if user_selected == 5
  end

  def run
  	print_main_menu
  	user_selected = gets.chomp.to_i

  	while user_selected != 6 do
  		call_option(user_selected)

  		print_main_menu
  		user_selected = gets.chomp.to_i
  	end
  end
end


crm = CRM.new
crm.run