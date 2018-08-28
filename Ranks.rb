#this doc will add ranks to new members.

#--------------Vaild Users
@userArray = [
  {"name" => "VEX Justin", "id" => 200109},
  {"name" => "Gryphonizer", "id" => 190508}
]
#-------------------------

@tries = 3

def striker_startup
  puts "==============="
  puts "  Striker Bot  "
  puts "==============="
  puts "   1) Enter    "
  puts "   2) Exit     "
  choice = gets.strip.to_i

    case choice
      when 1
        validate_user
      when 2
        exit_striker
      else
        puts ">>!==Invaild Input==!<<"
        striker_startup
    end
end

def validate_user
  puts "==============="
  puts " >> EnterID << "
  puts "==============="
  choice = gets.strip.to_i

  puts "#{choice}"
  
  @user = @userArray.find {|id| id["id"] == choice}
  puts "#{@user}"
  if choice == @user['id']
    valid_await
  elsif choice == 0 && @user['id'] == nil
    @tries -= 1
    puts ">>!==Invaild Input==!<<"
      if @tries < 1
        puts ">>!==Out Of Tries==!<<"
        striker_startup
      else
        nil
      end
    validate_user
  else 
    @tries -= 1
    puts ">>!==Invaild Input==!<<"
      if @tries < 1
        puts ">>!==Out Of Tries==!<<"
        striker_startup
      else
        nil
      end
    validate_user
  end
end

def valid_await
  puts "One Moment..."
  sleep(5)
  user_confirmed
end

def user_confirmed
  puts "==============="
  puts "User Confirmed"
  puts " (#{@user['name']})"
  puts "==============="
  puts "1) View Members"
  puts "2) Add Points"
  puts "3) Logout"
  choice = gets.strip.to_i

  case choice
    when 1
      tgr_members
    when 2
      add_points
    when 3
      puts "================="
      puts "Logged Out #{@user['name']}"
      puts "================="
      striker_startup
    else
      puts ">>!==Invaild Input==!<<"
      user_confirmed
  end
end

def exit_striker
  puts "==============="
  puts " >> Goodbye << "
  puts "==============="
  exit
end

striker_startup