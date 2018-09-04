require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id,

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

def self.find_by_title(title)
  query = PlayDBConnection.instance.execute(<<-SQL, title)
  SELECT
    *
  FROM
    plays
  WHERE
   title = ?
  SQL
  Play.new(query.first)
end

def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    raise "No such playwright" if playwright == nil
    plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
end

end

class Playwright
attr_reader :id
attr_accessor :name, :birth_year

    def self.all
      playwrights = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
      playwrights.map { |playwright| Playwright.new(playwright) }
    end

    def initialize(options)
       @id =  options['id']
       @name = options['name']
       @birth_year = options['birth_year']
    end

    def self.find_by_name(name)
      #create local variable from the SQL query, then return it
      playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
         *
      FROM
        playwrights
      WHERE
        name = ?
      SQL
      Playwright.new(playwright.first)
      #testing output on pry revealed tht i was getting an array
    end


    def create
      raise "Playwright entry already exists" if @id != nil
      PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
        INSERT INTO
          playwrights (name, birth_year)
        VALUES
          (?, ?)
      SQL
      @id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
      raise "#{self} not in database" if @id == nil
      PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
        UPDATE
          playwrights
        SET
          name = ?, birth_year = ?
        WHERE
          id = ?
      SQL
    end

    def get_plays #(returns all plays written by playwright)
      works = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
      SQL
      works.map{|play| Play.new(play)}
    end

end
