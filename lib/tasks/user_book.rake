namespace :user_book do
  namespace :create do
    desc "Create a UserBook"
    task :specify, [:user_id, :book_id, :favourite_status, :study_status] =>
      :environment do |t, args|
      process_user_book_task args[:user_id], args[:book_id],
        args[:favourite_status], args[:study_status]
    end
  end
end

def process_user_book_task user_id, book_id, favourite_status, study_status
  begin
    obj = Like.create! user_id: user_id, book_id: book_id,
      favourite_status: favourite_status, study_status: study_status
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end