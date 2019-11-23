require_relative("../db/sql_runner")

class Film

#InitialiSe
  attr_reader :id
  attr_accessor :title, :price

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @price = info['price'].to_i
  end

#Class level basics
  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map{ |film| Film.new(film) }
    return result
  end

#Instance level CRUD
  def save()
    sql = "INSERT INTO films
    (title, price) VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET
    (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result
  end

#Others
  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON
    tickets.customer_id = customers.id
    WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

#below is a cut paste of the above
#I don't understand why these are seperate questions
  def count_customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON
    tickets.customer_id = customers.id
    WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customer| Customer.new(customer)}
    return result.count
  end


end
