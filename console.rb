require('pry')
require_relative('./models/screenings')
require_relative('./models/tickets')
require_relative('./models/customers')
require_relative('./models/films')

Screening.delete_all()
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
  'title' => 'Hidden Figures',
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

#Screenings
screening1 = Screening.new({
  'film_id' => film1.id,
  'film_time' => '18:00'
  })
screening1.save()

screening2 = Screening.new({
  'film_id' => film1.id,
  'film_time' => '20:00'
  })
screening2.save()

screening3 = Screening.new({
  'film_id' => film2.id,
  'film_time' => '21:00'
  })
screening3.save()

screening4 = Screening.new({
  'film_id' => film2.id,
  'film_time' => '13:00'
  })
screening4.save()

screening5 = Screening.new({
  'film_id' => film3.id,
  'film_time' => '12:15'
  })
screening5.save()

screening6 = Screening.new({
  'film_id' => film4.id,
  'film_time' => '18:00'
  })
screening6.save()


#Tickets
ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id,
  'screening_id' => screening3.id
  })
ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film3.id,
  'screening_id' => screening5.id
  })
ticket3.save()

ticket4 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket4.save()

ticket5 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film4.id,
  'screening_id' => screening6.id
  })
ticket5.save()

ticket6 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film2.id,
  'screening_id' => screening3.id
  })
ticket6.save()

ticket7 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film1.id,
  'screening_id' => screening2.id
  })
ticket7.save()

ticket8 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })
ticket8.save()


binding.pry()

nil
