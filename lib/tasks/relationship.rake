namespace :relationship do
  namespace :create do
    desc "Create a Relationship"
    task :specify, [:follower_id, :followed_id] => :environment do |t, args|
      begin
        obj = FactoryGirl.create :relationship, follower_id: args[:follower_id],
          followed_id: args[:followed_id]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end