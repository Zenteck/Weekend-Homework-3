require('pry')

require_relative('./models/customers')
require_relative('./models/films')
require_relative('./models/tickets')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

#Customers
customer1 = Customer.new({
  'name' => 'Jeb',
  'funds' => 20
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Bill',
  'funds' => 40
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Bob',
  'funds' => 30
  })
customer3.save()

customer4 = Customer.new({
  'name' => 'Val',
  'funds' => 25
  })
customer4.save()

#Films
film1 = Film.new({
  'title' => 'Apollo 13',
  'price' => 5
})
film1.save()

film2 = Film.new({
  'title' => 'Interstellar',
  'price' => 15
})
film2.save()

film3 = Film.new({
  'title' => 'The Martian',
  'price' => 10
})
film3.save()

film4 = Film.new({
  'title' => 'Contact',
  'price' => 5
})
film4.save()

#Tickets

ticket1 = Ticket.new({
  'user_id' => customer1.id,
  'film_id' => film1.id,
  })
ticket1.save()

ticket2 = Ticket.new({
  'user_id' => customer2.id,
  'film_id' => film2.id,
  })
ticket2.save()

ticket3 = Ticket.new({
  'user_id' => customer2.id,
  'film_id' => film3.id,
  })
ticket3.save()

ticket4 = Ticket.new({
  'user_id' => customer3.id,
  'film_id' => film1.id,
  })
ticket4.save()

ticket5 = Ticket.new({
  'user_id' => customer3.id,
  'film_id' => film4.id,
  })
ticket5.save()

ticket6 = Ticket.new({
  'user_id' => customer4.id,
  'film_id' => film2.id,
  })
ticket6.save()

ticket7 = Ticket.new({
  'user_id' => customer4.id,
  'film_id' => film1.id,
  })
ticket7.save()

ticket8 = Ticket.new({
  'user_id' => customer3.id,
  'film_id' => film1.id,
  })
ticket8.save()


binding.pry()

nil
