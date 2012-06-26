#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => 'halbuquerquevieira@gmail.com', :password => '123456', :password_confirmation => '123456',
            :name => 'Heitor Vieira', :cpf => '067.704.724-06', :cep => '50710-170')

User.create(:email => 'aderomir@gmail.com', :password => '123456', :password_confirmation => '123456',
            :name => 'Antônio Deromir', :cpf => '044.284.103-52', :cep => '60430-580')

User.create(:email => 'rodrigo.ruiz7@gmail.com', :password => '07091990', :password_confirmation => '07091990',
            :name => 'Rodrigo Ruiz', :cpf => '384.546.898-00', :cep => '04320-120')

User.create(:email => 'luamaralalmeida@gmail.com', :password => 'luisaa', :password_confirmation => 'luisaa',
            :name => 'Luisa', :cpf => '108.893.446-39', :cep => '35500-095')

User.create(:email => 'cassiokendi@gmail.com', :password => 'cassio', :password_confirmation => 'cassio',
            :name => 'Cassio', :cpf => '383.732.868-61', :cep => '12243-750')

User.create(:email => 'eadrgv@gmail.com', :password => '123456', :password_confirmation => '123456',
            :name => 'Luis', :cpf => '687.304.407-50', :cep => '12062-150')

User.create(:email => 'ehbf@gmail.com', :password => '123456', :password_confirmation => '123456',
            :name => 'Mauricio', :cpf => '272.154.362-84', :cep => '22460-320')

User.create(:email => 'rstf@gmail.com', :password => '123456', :password_confirmation => '123456',
            :name => 'Gustavo', :cpf => '877.942.536-40', :cep => '88062-200')


Message.create(:body => 'Oi, quer me dar aula do Jackson?', :sender_id => 1, :receiver_id => 2)
Message.create(:body => 'Pode ser, mas você faz o trabalho do Clovis', :sender_id => 2, :receiver_id => 1)
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

User.find(2).books << Book.find(9)
User.find(2).books << Book.find(4)
User.find(3).books << Book.find(5)
User.find(3).books << Book.find(9)
User.find(1).books << Book.find(10)
User.find(1).books << Book.find(7)
User.find(1).books << Book.find(8)

MyBook.create(:book_id => 281, :user_id => 1, :weight => 4, :additional_information => "Livro em ótimo estado" )
MyBook.create(:book_id => 281, :user_id => 2, :weight => 3, :additional_information => "Livro em ótimo estado, apenas com algumas página amassadas" )
MyBook.create(:book_id => 281, :user_id => 4, :weight => 3, :additional_information => "siaugehisuzdkvbeslhbadfb dafb df sd vds " )
MyBook.create(:book_id => 281, :user_id => 5, :weight => 3, :additional_information => "df sg sgf gf vfg sgfbfgn shethrdtjh srtjrjtrsj rttrsj srthrt jmn" )
MyBook.create(:book_id => 281, :user_id => 5, :weight => 3, :additional_information => "df sg sgf gf vfg sgfbfgn shethrdtjh srtjrjtrsj rttrsj srthrt jmn" )


MyBook.create(:book_id => 8, :user_id => 5, :weight => 3, :additional_information => "df sg sgf gf vfg sgfbfgn shethrdtjh srtjrjtrsj rttrsj srthrt jmn" )
MyBook.create(:book_id => 8, :user_id => 2, :weight => 3, :additional_information => "Livro em ótimo estado, apenas com algumas página amassadas" )
MyBook.create(:book_id => 8, :user_id => 6, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )
MyBook.create(:book_id => 8, :user_id => 3, :weight => 5, :additional_information => "Livro em ótimo estado, o que os ricos ensinam a seus filhos sobre dinheiro. o objetivo deste livro é o de partilhar percepções quanto à maneira como uma maior inteligência financeira pode ser empregada para resolver muitos dos problemas comuns da vida. Sem treinamento financeiro, freqüentemente recorremos a fórmulas padronizadas para levar a vida, como trabalhar com afinco, poupar, fazer empréstimos e pagar impostos demais. livro novo. por isso pode levar esse livro." )



MyBook.create(:book_id => 16, :user_id => 1, :weight => 4, :additional_information => "Livro em ótimo estado" )
MyBook.create(:book_id => 16, :user_id => 3, :weight => 4, :additional_information => "Livro meio acabadinho, sem capa, e com duas páginas faltnado" )
MyBook.create(:book_id => 16, :user_id => 3, :weight => 5, :additional_information => "Livro em ótimo estado, o que os ricos ensinam a seus filhos sobre dinheiro. o objetivo deste livro é o de partilhar percepções quanto à maneira como uma maior inteligência financeira pode ser empregada para resolver muitos dos problemas comuns da vida. Sem treinamento financeiro, freqüentemente recorremos a fórmulas padronizadas para levar a vida, como trabalhar com afinco, poupar, fazer empréstimos e pagar impostos demais. livro novo. por isso pode levar esse livro." )
MyBook.create(:book_id => 16, :user_id => 6, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )



MyBook.create(:book_id => 5, :user_id => 6, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )
MyBook.create(:book_id => 5, :user_id => 8, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )
MyBook.create(:book_id => 5, :user_id => 7, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )
MyBook.create(:book_id => 5, :user_id => 3, :weight => 4, :additional_information => "Livro meio acabadinho, sem capa, e com duas páginas faltnado" )



MyBook.create(:book_id => 115, :user_id => 4, :weight => 3, :additional_information => "siaugehisuzdkvbeslhbadfb dafb df sd vds " )
MyBook.create(:book_id => 115, :user_id => 5, :weight => 3, :additional_information => "df sg sgf gf vfg sgfbfgn shethrdtjh srtjrjtrsj rttrsj srthrt jmn" )


MyBook.create(:book_id => 17, :user_id => 1, :weight => 5, :additional_information => "Excelente leitura, egseh pequenos cortes" )
MyBook.create(:book_id => 17, :user_id => 7, :weight => 5, :additional_information => "Excelente leitura,  weth seh pequenos cortes" )
MyBook.create(:book_id => 17, :user_id => 3, :weight => 5, :additional_information => "Excelente leitura, eth  pequenos cortes" )
MyBook.create(:book_id => 17, :user_id => 5, :weight => 5, :additional_information => "Excelente heh leitura,  aerg pequenos cortes" )


MyBook.create(:book_id => 32, :user_id => 2, :weight => 3, :additional_information => "Livro em ótimo estado, apenas com algumas página amassadas" )
MyBook.create(:book_id => 32, :user_id => 2, :weight => 3, :additional_information => "Livro em ótimo estado, apenas com algumas página amassadas" )


MyBook.create(:book_id => 43, :user_id => 8, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )
MyBook.create(:book_id => 43, :user_id => 7, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )



MyBook.create(:book_id => 266, :user_id => 6, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )
MyBook.create(:book_id => 266, :user_id => 7, :weight => 3, :additional_information => "rtj rstjrtdfhngfhrtxfgh steh tsrehjtrdghg rtjrjrtg trj srtjgxt r" )