require_relative("../db/sql_runner")
require_relative('./customers')
require_relative('./films')

class Ticket

#InitialiSe
attr_reader :id
attr_accessor :customer_id, :film_id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @customer_id = info['customer_id'].to_i()
    @film_id = info['film_id'].to_i()
  end

  #Class level basics
    def self.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM tickets"
      tickets = SqlRunner.run(sql)
      result = tickets.map{ |ticket| Ticket.new(ticket) }
      return result
    end

  #Instance level CRUD
    def save()
      sql = "INSERT INTO tickets
      (customer_id, film_id) VALUES ($1, $2)
      RETURNING id"
      values = [@customer_id, @film_id]
      ticket = SqlRunner.run(sql, values).first()
      @id = ticket['id'].to_i()
    end

    def update()
      sql = "UPDATE tickets SET
      (name, funds) = ($1, $2)
      WHERE id = $3"
      values = [@customer_id, @film_id, @id]
      result = SqlRunner.run(sql, values)
      return result
    end

    def delete()
      sql = "DELETE FROM tickets WHERE id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result
    end




end
