namespace :user_book do
  namespace :create do
    desc "Create a UserBook"
    task :specify, [:user_id, :book_id, :favourite, :status] =>
      :environment do |t, args|
      begin
        obj = FactoryGirl.create :user_book, user_id: args[:user_id],
          book_id: args[:book_id], favourite: args[:favourite],
          status: args[:status]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end