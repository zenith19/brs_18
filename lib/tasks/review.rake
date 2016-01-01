namespace :review do
  namespace :create do
    desc "Create a Review"
    task :specify, [:user_id, :book_id, :rating, :content] =>
      :environment do |t, args|
      begin
        obj = FactoryGirl.create :review, user_id: args[:user_id],
          book_id: args[:book_id], rating: args[:rating],
          content: args[:content]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end