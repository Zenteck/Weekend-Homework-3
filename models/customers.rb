require_relative('../db/sql_runner')
require_relative('./tickets')

class Customer

#InitialiSe
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
    @funds = info['funds'].to_i
  end

#Class level basics
  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{ |customer| Customer.new(customer) }
    return result
  end

#Instance level CRUD
  def save()
    sql = "INSERT INTO customers
    (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET
    (name, funds) = ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result
  end

#Others
  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON
    tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map{|film| Film.new(film)}
    return result
  end

  #below is a cut paste of the above
  #I don't understand why these are seperate questions
  def count_tickets()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON
    tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map{|film| Film.new(film)}
    return result.count
  end

  def buy_ticket(film)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [film]
    viewing = SqlRunner.run(sql, values)
    result = viewing.map{|movie| Film.new(movie)}
    film_price = 0
    film_price = result[0].price
    @funds -= film_price
    Ticket.sell_ticket(@id, film)
  end
  #This works but doesn't accout for the film ID being invalid


end
