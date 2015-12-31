namespace :comment do
  namespace :create do
    desc "Create a Comment"
    task :specify, [:content, :user_id, :review_id] => :environment do |t, args|
      process_comment_task args[:content], args[:user_id], args[:review_id]
    end
  end
end

def process_comment_task content, user_id, review_id
  begin
    obj = Comment.create! content: content, user_id: user_id,
      review_id: review_id
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end