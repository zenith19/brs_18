namespace :admin do
  desc "Create primary admin user"
  task create: :environment do
    name = "Muhammad Tamzid"
    email = "muhammad.tamzid@gmail.com"
    process_task name, email
  end

  namespace :create do
    desc "Create other admin users"
    task :additional, [:name, :email] => :environment do |t, args|
      name = args[:name]
      email = args[:email]
      process_task name, email
    end
  end

  def process_task name, email
    if User.find_by(email: email).nil?
      User.create name: name, email: email, admin: true
      puts "An additional admin has been created!"
      puts "Name: #{name}"
      puts "Email: #{email}"
    else
      puts "This admin already exists!"
      puts "Name: #{name}"
      puts "Email: #{email}"
    end
  end
end