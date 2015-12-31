namespace :book do
  desc "Create a random Book"
  task create: :environment do
    if Category.all.empty?
      puts "Error: No category exists!"
    else
      process_book_task Category.take.id, Faker::Book.title, Faker::Book.author,
        Faker::Date.backward(days=365), Faker::Number.number(3),
          Faker::Number.between(1, 5)
    end
  end

  namespace :create do
    desc "Create a book"
    task :specify, [:category_id, :title, :author, :publish_date, :page,
      :rating] => :environment do |t, args|
      process_book_task args[:category_id], args[:title], args[:author],
        args[:publish_date], args[:page], args[:rating]
    end
  end
end