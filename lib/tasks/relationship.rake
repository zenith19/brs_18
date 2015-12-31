namespace :relationship do
  namespace :create do
    desc "Create a Relationship"
    task :specify, [:follower_id, :followed_id] => :environment do |t, args|
      process_relationship_task args[:follower_id], args[:followed_id]
    end
  end
end

def process_relationship_task follower_id, followed_id
  begin
    obj = Relationship.create! follower_id: follower_id,
      followed_id: followed_id
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end