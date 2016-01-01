namespace :user do
  desc "Create a random User"
  task create: :environment do
    begin
      obj = FactoryGirl.create :user
      print "An user has been created!"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  end
end