namespace :request do
  namespace :create do
    desc "Create a Request"
    task :specify, [:user_id, :title, :author, :link, :status, :publisher] =>
      :environment do |t, args|
      begin
        obj = FactoryGirl.create :request, user_id: args[:user_id],
          title: args[:title], author: args[:author], link: args[:link],
          status: args[:status], publisher: args[:publisher]
        puts "#{obj.class.name} has been created!"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end