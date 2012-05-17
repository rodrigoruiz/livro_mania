require 'yaml'

task :books => :environment do
	filename = "livros20120508-082751.txt"
	File.open(filename, 'r') do |f|
		books = YAML.load(f)
		books.each do |book|
			puts book[0]
			Book.create(:title => book[0], :author => book[1], :isbn => book[2], :pages => book[3], :edition => book[4], :language => book[5], :publisher => book[6])
		end
	end
end

task :reset_db => [:environment, 'db:drop', 'db:create', 'db:migrate', :books, 'db:seed'] do
  desc 'run tasls: db:drop, db:migrate, books, db:seed'
end
