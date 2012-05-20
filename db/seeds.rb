#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => 'rodrigo.ruiz7@gmail.com', :password => '07091990', :password_confirmation => '07091990',
            :name => 'Rodrigo Ruiz', :cpf => '384.546.898-00', :cep => '04320-120')

User.create(:email => 'luamaralalmeida@gmail.com', :password => 'luisaa', :password_confirmation => 'luisaa',
            :name => 'Luisa', :cpf => '108.893.446-39', :cep => '12228-460')

User.create(:email => 'cassiokendi@gmail.com', :password => 'cassio', :password_confirmation => 'cassio',
            :name => 'Cassio', :cpf => '383.732.868-61', :cep => '12243-750')

Message.create(:body => 'Oi, quer me dar aula do Jackson?', :sender_id => 1, :receiver_id => 2)
Message.create(:body => 'Pode ser, mas você faz o trabalho do Clovis People', :sender_id => 2, :receiver_id => 1)
Message.create(:body => 'Ah, e tem que fazer bem feito!', :sender_id => 2, :receiver_id => 1)
Message.create(:body => 'Oi, como vai você?', :sender_id => 3, :receiver_id => 2)
Message.create(:body => 'Fechado, só não quero trancar!', :sender_id => 1, :receiver_id => 2)
Message.create(:body => 'Oi, já entregou o trabalho do PA?', :sender_id => 3, :receiver_id => 1)
Message.create(:body => 'Muito bem, e você?', :sender_id => 2, :receiver_id => 3)
Message.create(:body => 'O que você quer?', :sender_id => 2, :receiver_id => 3)
Message.create(:body => 'Sim, tiramos 10!', :sender_id => 1, :receiver_id => 3)
Message.create(:body => 'Um livro.', :sender_id => 3, :receiver_id => 2)

Book.create(:isbn => '0212387', :title => 'Harry Potter', :author => 'JKRolling',
            :edition => '1', :language =>'Inglês', :pages => '529', :publisher => 'Rocco')
Book.create(:isbn => '0112387', :title => 'Código Da Vinci', :author => 'Dan Brown',
            :edition => '3', :language =>'Português', :pages => '498', :publisher => 'Rocco')
Book.create(:isbn => '0212357', :title => 'Ruby on Rails Tutorial', :author => 'Mickael Hartl',
            :edition => '7', :language =>'Inglês', :pages => '1234', :publisher => 'Online')
Book.create(:isbn => '0134387', :title => 'Engenharia de Software', :author => 'Sommerville',
            :edition => '2', :language =>'Português', :pages => '1109', :publisher => 'Abril')

filename = "livros20120508-082751.txt"
File.open(filename, 'r') do |f|
	books = YAML.load(f)

	books.each do |book|
		puts book[0]
		Book.create(:title => book[0], :author => book[1], :isbn => book[2], :pages => book[3], :edition => book[4], :language => book[5], :publisher => book[6])
			end
end