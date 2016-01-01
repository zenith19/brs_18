namespace :category do
  desc "Create a random category"
  task create: :environment do
    begin
      obj = FactoryGirl.create :category
      puts "#{obj.class.name} has been created!"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  end

  namespace :create do
    desc "Create a category"
    task :specify, [:name] => :environment do |t, args|
      begin
        obj = FactoryGirl.create :category, name: args[:name]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end