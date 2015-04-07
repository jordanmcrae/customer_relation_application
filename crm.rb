require_relative 'contact'
require_relative 'rolodex'
require 'faker'

class CRM
  def self.run  # => class methods always have self
    my_crm = new # => (CRM.new) -- Don't need because we are at the class level
    my_crm.main_menu
  end

  def initialize
    @rolodex = Rolodex.new
    100.times do
      @rolodex.add_contact(Contact.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::Hacker.say_something_smart))
    end
  end

  def print_main_menu
    puts "[1] Add new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all"
    puts "[5] Display a contact"
    puts "[6] Search"
    puts "[0] Exit"
    puts "Enter a selection"
  end

  def call_selection(selection)     # => Requires an argument or it will return an error
    add_new_contact if selection == 1
    modify_contact if selection == 2
    delete_contact if selection == 3
    display_all_contacts if selection == 4
    display_contact if selection == 5
    search if selection == 6
    exit if selection == 0
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
    print "Enter the id of the user you would like to modify:"
    contact_id = gets.chomp.to_i
    @rolodex.modify_contact(contact_id)
  end

  def display_all_contacts
    puts @rolodex.contacts
  end

  def delete_contact
    print "Enter the id of the user you would like to delete:"
      contact_id = gets.chomp.to_i
    print "Are you sure? Write yes or no."
      verify = gets.chomp.upcase
    if verify == "YES"
      @rolodex.contact_delete(contact_id)
    else
      puts "Contact has not been deleted."
    end
  end

  def search
    print "Enter the query:"
    query = gets.chomp
    puts @rolodex.search(query)
  end

end



CRM.run


