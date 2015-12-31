namespace :review do
  namespace :create do
    desc "Create a Review"
    task :specify, [:user_id, :book_id, :rating, :content] =>
      :environment do |t, args|
      process_review_task args[:user_id], args[:book_id], args[:rating],
        args[:content]
    end
  end
end

def process_review_task user_id, book_id, rating, content
  begin
    obj = Review.create! user_id: user_id, book_id: book_id, rating: rating,
      content: content
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end