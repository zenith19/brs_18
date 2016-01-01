namespace :comment do
  namespace :create do
    desc "Create a Comment"
    task :specify, [:content, :user_id, :review_id] => :environment do |t, args|
      begin
        obj = FactoryGirl.create :comment, content: args[:content],
          user_id: args[:user_id], review_id: args[:review_id]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end