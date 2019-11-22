require('pry')

require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

#Customers
customer1 = Customer.new({
  'name' => 'Jeb'
  'funds' => 20
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Bob'
  'funds' => 40
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Bill'
  'funds' => 30
  })
customer3.save()

customer4 = Customer.new({
  'name' => 'Val'
  'funds' => 25
  })
customer4.save()

#Films
film1 = Film.new({
  'title' => 'Apollo 13'
  'price' => 12
})
film1.save()

film2 = Film.new({
  'title' => 'Interstellar'
  'price' => 20
})
film2.save()

film3 = Film.new({
  'title' => 'The Martian'
  'price' => 10
})
film3.save()

film14 = Film.new({
  'title' => 'Contact'
  'price' => 9
})
film4.save()




binding.pry

nil
