def process_user_task name, email, password, admin
  if User.find_by(email: email).nil?
    begin
      obj = User.create! name: name, email: email, admin: admin,
        password: password, password_confirmation: password
      print "Admin has been created!"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  else
    puts "Error: Already exists!"
  end
end

def process_category_task name
  if Category.find_by(name: name).nil?
    begin
      obj = Category.create! name: name
      puts "#{obj.class.name} has been created!"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  else
    puts "Error: Already exists!"
  end
end

def process_book_task category_id, title, author, publish_date, page, rating
  if Category.find_by(title: title).nil? &&
      Category.find_by(category_id: category_id).nil?
    begin
      obj = Category.create! category_id: category_id, title: title,
        author: author, publish_date: publish_date, page: page, rating: rating
      puts "#{obj.class.name} has been created!"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  else
    puts "Error: Argument conflict"
  end
end

def _dump_errors exception
  n=80
  n.times {print "#"}
  puts "\nInvalid argument(s)"
  puts exception.message
  n.times {print "#"}
  puts ""
end