require_relative("../db/sql_runner")

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
    (name, funds) VALUES ($1, $2)
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


end
