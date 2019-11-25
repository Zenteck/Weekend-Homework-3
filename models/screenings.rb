require_relative('../db/sql_runner')
require_relative('./films')

class Screening

  attr_reader :id
  attr_accessor :film_id, :film_time

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @film_id = info['film_id'].to_i()
    @film_time = info['film_time']
  end

  #Class level basics
    def self.delete_all()
      sql = "DELETE FROM screenings"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM screenings"
      screenings = SqlRunner.run(sql)
      result = screenings.map{|screening| Screening.new(screening)}
      return result
    end

  #Instance level CRUD
    def save()
      sql = "INSERT INTO screenings
      (film_id, film_time) VALUES ($1, $2)
      RETURNING id"
      values = [@film_id, @film_time]
      screening = SqlRunner.run(sql, values).first()
      @id = screening['id'].to_i()
    end

    def update()
      sql = "UPDATE screenings SET
      (film_id, film_time) = ($1, $2)
      WHERE id = $3"
      values = [@film_id, @film_time, @id]
      result = SqlRunner.run(sql, values)
      return result
    end

    def delete()
      sql = "DELETE FROM screenings WHERE id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result
    end


#Class Level
    def self.popular(film)
      sql = "SELECT * FROM tickets
      WHERE film_id = $1"
      values = [film]
      result = SqlRunner.run(sql, values)
      tickets_array = result.map{|ticket| Ticket.new(ticket)}
      #Stack overflow to the rescue

    end
      #I have the array of hashes

      #I need to splt it up by screenings

      #cout each and return the one wth most tickets

end
