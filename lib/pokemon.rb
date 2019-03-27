class Pokemon
  attr_accessor :name, :type, :db, :id
  
  @@all = []
  
  def initialize(name:, type:, db:, id:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp || 60
    @@all << self
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2], db: db)
  end
  
  def alter_hp(new_hp, id, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end
  
end
