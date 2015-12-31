namespace :request do
  namespace :create do
    desc "Create a Request"
    task :specify, [:user_id, :title, :author, :link, :status, :publisher] =>
      :environment do |t, args|
      process_request_task args[:user_id], args[:title], args[:author],
         args[:link], args[:status], args[:publisher]
    end
  end
end

def process_request_task user_id, title, author, link, status, publisher
  begin
    obj = Request.create! user_id: user_id, title: title, author: author,
      link: link, status: status, publisher: publisher
    puts "#{obj.class.name} has been created!"
    obj.attributes.each {|_name, value| puts "#{_name}: #{value}"}
  rescue => exception
    _dump_errors exception
  end
end