namespace :admin do
  desc "Create primary admin user"
  task create: :environment do
    process_user_task "Muhammad Tamzid", "muhammad.tamzid@gmail.com",
      "12345678", true
  end

  namespace :create do
    desc "Create other admin users"
    task :specify, [:name, :email, :password] => :environment do |t, args|
      process_user_task args[:name], args[:email], args[:password], true
    end
  end
end