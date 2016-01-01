namespace :like do
  namespace :create do
    desc "Create a Like"
    task :specify, [:activity_id, :user_id] => :environment do |t, args|
      begin
        obj = FactoryGirl.create :like, activity_id: args[:activity_id],
          user_id: args[:user_id]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end