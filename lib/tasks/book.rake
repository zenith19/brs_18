namespace :book do
  desc "Create a random Book"
  task create: :environment do
    begin
      obj = FactoryGirl.create :book
      puts "#{obj.class.name} has been created!"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  end

  namespace :create do
    desc "Create a book"
    task :specify, [:category_id] => :environment do |t, args|
      begin
        obj = FactoryGirl.create :book, category_id: args[:category_id]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end