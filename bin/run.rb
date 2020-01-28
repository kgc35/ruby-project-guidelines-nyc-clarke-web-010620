require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1

def prompt_user
  #system("clear")
  system("say -v samantha 'Please choose from the following'")
  puts "Please choose from the following."
  puts "1. Create a User Profile"
  puts "2. Select existing user"
  puts "3. Exit"

  user_input = gets.chomp.to_i
  action_router(user_input)
end


def action_router(input)
  case input
  when 1
    make_user
  when 2
    select_user
  when 3
    return
  else
    system("say -v samantha 'Invalid'")
    puts "Invalid Entry"
  end
  prompt_user
end

def make_user
    system("say -v samantha 'Please enter your name'")
  puts "Please enter your name."
  name = gets.chomp.to_s

  system("say -v samantha 'Please enter your email'")
  puts "Please enter your e-mail."
  contact_information = gets.chomp.to_s

  system("say -v samantha 'Please choose your user type'")
  puts "Please choose your user type. If you want to create events, type 'creator'. If you want to join events, type 'joiner'."
  user_type = gets.chomp.to_s
    while user_type != "creator" && user_type != "joiner"
        system("say -v samantha 'Invalid'")
        puts "Invalid User type. Please type 'creator' or  'joiner'"
        user_type = gets.chomp.to_s
        #binding.pry
    end
  
    
  user = User.new(
        name: name, 
        contact_information: contact_information, 
        user_type: user_type
         )
  user.save
  system("say -v samantha 'Thank you'")
  puts "Thank you for creating your username"

  prompt_event(user)
end


def select_user
    system("say -v samantha 'Please enter your username'")
    puts "Please enter your username"
    user_name = gets.chomp

    #binding.pry 
    found_user = User.find_by name: user_name;

    if found_user
        puts "Name: #{found_user.name}"
        puts "Contact Information: #{found_user.contact_information}"
        puts "User Type: #{found_user.user_type}"

        prompt_event(found_user)
    else 
      system("clear")
      system("say -v samantha 'No user found'")
      puts "There is no user by that name. Would you like to create an Account?"
      puts "1. Yes"
      puts "2. No"
    end

      user_input = gets.chomp.to_i
      if user_input == 2
        user_input = 3
      end

      action_router(user_input)
    end


def prompt_event(user)
    if user.user_type = "creator"
        system('say -v samantha "Create or edit event"')
      puts "Would you like to create or edit an event?"
      puts "1. Create Event"
      puts "2. Edit Existing Event" 
      puts "3. Exit"
    
      
      user_input = gets.chomp.to_i
      case user_input
      when 1 
        create_event
      when 2 
        edit_event
      when 3
        return
      end


    else
        system('say -v samantha "Please choose from the following"')
      puts "Please choose from the following!"
      puts "4. See Listed Events"
      puts "5. Join Event"
      puts "6. Exit"

      user_input = gets.chomp.to_i
      case user_input
      when 4
        list_events
      when 5
        join_event
      when 6
        return
      end
    end
  end



def create_event
    system('say -v samantha "What is the name of your event"')
  puts "What is the name of your event?"
  name_of_event = gets.chomp
  
  system('say -v samantha "what is your email"')
  puts "What is your email?"
  contact_information = gets.chomp
  
  system('say -v samantha "what is the date of your event"')
  puts "What is the date of your event?"
  date_of_event = gets.chomp

  system('say -v samantha "what is the time of your event"')
  puts "What time is your event?"
  time_of_event = gets.chomp

  system('say -v samantha "where will your event take place"')
  puts "Where will your event take place?"
  location = gets.chomp

  system('say -v samantha "please describe your event"')
  puts "Please describe your event."
  event_description = gets.chomp

  event = Event.new(
    name_of_event: name_of_event,
    contact_information: contact_information,
    date_of_event: date_of_event,
    time_of_event: time_of_event,
    location: location,
    event_description: event_description
  )
  event.save

system("say -v samantha 'Thank you'")
puts "Thank you for adding #{event.name_of_event} to Kent's Event!"

end

def edit_event
    system('say -v samantha "what is the name of your event"')
  puts "What is the name of your event?"
  event_name = gets.chomp.to_s

  found_event = Event.find_by name_of_event: event_name;

  if found_event
    system("say -v samantha'What would you like to change'")
    puts "What would you like to change?"
    puts "name of event"
    puts "contact information"
    puts "date of event"
    puts "time of event"
    puts "location"
    puts "event description"

    user_input = gets.chomp

    if user_input == "name of event"
        system("say -v samantha 'What is the new name of event'")
      puts "What is the new name of event?"
      found_event.name_of_event = user_input

    elsif user_input == "contact information"
        system("say -v samantha 'what is the new'")
      puts "What is the new email for the event?"
      found_event.contact_information = user_input

    elsif user_input == "date of event"
        system('say -v samantha "what is the new date of the event"')
      puts "What is the new date of the event?"
      found_event.date_of_event = user_input
      
    elsif user_input == "time of event"
        system('say -v samantha "what is the new time of the event"')
      puts "What is the new time of the event?"
      found_event.time_of_event = user_input
    
    elsif user_input == "location"
        system('say -v samantha "where is the event now located"')
      puts "Where is the event now located?"
      found_event.location = user_input

    elsif user_input == "event description"
        system('say -v samantha what is your new description')
      puts "What is your new description?"
      found_event.event_description = user_input
    end
    system("say -v samantha 'Success'")
    puts "Your event has been successfully updated!"
    
  else
    system('say -v samantha There is no event by this name')
    puts "There is no event by this name. Would you like to create one?"
    puts "1. Yes"
    puts "2. No"
    end

      user_input = gets.chomp.to_i
      if user_input == 2
        user_input = 3
      end

      action_router(user_input)
    end

  def list_events
    Event.all
  end

  def join_event
    system('say -v samantha "what is the name of the event"')
    puts "What is the name of the event would you like to join?"
    event_name = gets.chomp.to_s
    found_event = Event.find_by(name_of_event: event_name)

    if found_event
      attendance = 
      Attendance.new(
      user_id: found_event.user_id,
      event_id: found_event.event_id)

      attendance.save
      
    else
        system('say -v samantha "Invalid"')
      puts "That event does not exist."
    end
end


system("say -v samantha 'welcome to Kents events!'")
puts "Welcome to Kent's Events!"
puts "(press any key to continue)"
gets.chomp
prompt_user

