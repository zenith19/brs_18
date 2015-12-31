namespace :user do
  desc "Create a random User"
  task create: :environment do
    process_user_task Faker::Name.name, Faker::Internet.email, "1234", false
  end

  namespace :create do
    desc "Create a User"
    task :specify, [:name, :email, :password] => :environment do |t, args|
      process_user_task args[:name], args[:email], args[:password], false
    end
  end
end