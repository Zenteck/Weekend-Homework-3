require('pry')

require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()



binding.pry

nil
