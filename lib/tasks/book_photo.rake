namespace :book_photo do
  namespace :create do
    desc "Create a BookPhoto"
    task :specify, [:book_id, :image] => :environment do |t, args|
      begin
        obj = FactoryGirl.create :book_photo, book_id: args[:book_id],
          image: args[:image]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end