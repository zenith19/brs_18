namespace :category do
  desc "Create a random category"
  task create: :environment do
    process_category_task Faker::Name.name
  end

  namespace :create do
    desc "Create a category"
    task :specify, [:name] => :environment do |t, args|
      process_category_task args[:name]
    end
  end
end