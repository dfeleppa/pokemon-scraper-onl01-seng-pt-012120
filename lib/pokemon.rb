class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db 
  
  def initialize(name:, type:, id:, db:, hp: nil)
    @name = name
    @type = type
    @id = id
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
      def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO students (name, grade)
        VALUES (?,?)
        SQL
    
      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end
  end
  end

  def self.find(id_number, db)
    pokemon_find = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).first
    Pokemon.new(id: pokemon_find[0], name: pokemon_find[1], type: pokemon_find[2], hp: pokemon_find[3], db: db )
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

  
end
