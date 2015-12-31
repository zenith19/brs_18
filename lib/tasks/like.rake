namespace :like do
  namespace :create do
    desc "Create a Like"
    task :specify, [:activity_id, :user_id] => :environment do |t, args|
      process_like_task args[:activity_id], args[:user_id]
    end
  end
end

def process_like_task activity_id, user_id
  begin
    obj = Like.create! activity_id: activity_id, user_id: user_id
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end