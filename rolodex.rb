class Rolodex   # => This is the class that helps us hold the contacts and contain them and organize them

  def initialize
    @contacts = []
    @id = 0
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id      # => This whole block returns a value.
    end
  end

  def modify_contact(contact_id)
     contact = find(contact_id)

      puts "Which part of the contact would you like to modify?"
      puts "1 -- First Name"
      puts "2 -- Last Name"
      puts "3 -- Email"
      puts "4 -- Note"
      modify = gets.chomp.to_i

      if modify == 1
          puts "What would you like the first name of this user to be?"   # => Why aren't these changing the values?
          contact.first_name = gets.chomp
        elsif modify == 2
          puts "What would you like the last name of this user to be?"
          contact.last_name = gets.chomp
        elsif modify == 3
          puts "What would you like the email of this user to be?"
         contact.email = gets.chomp
        elsif modify == 4
          puts "What would you like the note of this user to be?"
          contact.notes = gets.chomp
        else
          puts "You have entered an invalid number."
      end
  end

    def contact_delete(contact_id)
      @contacts.delete_if do |x|
        x.id == contact_id
      end
    end

  def attribute_show(attribute_phrase)

    if attribute == "firstname"
      @contacts.find do |x|
      x.first_name = attribute_phrase
      end

    elsif attribute == "lastname"
      @contacts.find do |x|
      x.last_name = attribute_phrase
      end

    elsif attribute == "email"
      @contacts.find do |x|
      x.email = attribute_phrase
      end

    elsif attribute == "notes"
      @contacts.find do |x|
      x.notes = attribute_phrase
      end
    else
      puts "Invalid attribute."
    end

  end
end