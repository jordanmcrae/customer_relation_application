require_relative 'contact'
require_relative 'rolodex'

class CRM
  def self.run  # => class methods always have self
    my_crm = new # => (CRM.new) -- Don't need because we are at the class level
    my_crm.main_menu
  end

  def initialize
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display a contact"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a selection"
  end

  def call_selection(selection)     # => Requires an argument or it will return an error
    add_new_contact if selection == 1
    modify_contact if selection == 2
    delete_contact if selection == 3
    display_contact if selection == 4
    display_by_attribute if selection == 5
    exit if selection == 6
  end

  def main_menu
    while true
      print_main_menu
      selection = gets.chomp.to_i
      call_selection(selection)
    end
  end

  def add_new_contact
    print "First name:"
    first_name = gets.chomp
    print "Last name:"
    last_name = gets.chomp
    print "Email:"
    email = gets.chomp
    print "Note:"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note) # => to get our new class to accept four values, we must use four values in the intialize method
    @rolodex.add_contact(contact)
  end

  def display_contact
    print "Enter id of user you would like to view:"
    contact_id = gets.chomp.to_i  # => who is responsible for holding contacts? Rolodex! We must communicate with it somehow.
    contact = @rolodex.find(contact_id)
    puts contact
  end

  def modify_contact
    print "Enter the id of the user you would like to modify:"      #Not making changes.
    modify_id = gets.chomp.to_i
    contact = @rolodex.modify_contact(modify_id)
  end

  def delete_contact
    print "Enter the id of the user you would like to delete:"
      delete_id = gets.chomp
    print "Are you sure? Write yes or no."
      verify = gets.chomp.upcase
    if verify == "YES"
      contact_delete = @rolodex.contact_delete(delete_id)
    else
      puts "Contact has not been deleted."
    end

  end

  def display_by_attribute
    print "Please input the number of the attribute you would like to change:"
    print "1 -- First Name"
    print "2 -- Last Name"
    print "3 -- Email"
    print "4 -- Notes"
    attribute_id = gets.chomp
    att = @rolodex.attribute_modify(attribute_id)

  end

end



CRM.run


