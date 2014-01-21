require_relative 'contact'
require_relative 'rolodex'

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

