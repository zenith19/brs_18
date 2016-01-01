namespace :admin do
  desc "Create primary admin user"
  task create: :environment do
    begin
      obj = FactoryGirl.create :primary_admin
      print "Primary admin has been created!\n"
      obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
    rescue => exception
      _dump_errors exception
    end
  end

  namespace :create do
    desc "Create other admin users"
    task non_primary: :environment do
      begin
        obj = FactoryGirl.create :admin
        print "An admin has been created!\n"
        obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
      rescue => exception
        _dump_errors exception
      end
    end
  end
end