namespace :book_photo do
  namespace :create do
    desc "Create a BookPhoto"
    task :specify, [:book_id, :image] => :environment do |t, args|
      process_book_photo_task args[:book_id], args[:image]
    end
  end
end

def process_book_photo_task book_id, image
  begin
    obj = BookPhoto.create! book_id: book_id, image: image
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end