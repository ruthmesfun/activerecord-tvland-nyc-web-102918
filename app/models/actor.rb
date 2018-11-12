class Actor < ActiveRecord::Base
  attr_accessor :characters, :shows, :networks

  has_many :characters
  has_many :shows, through: :characters
  has_many :networks, through: :shows

  def characters
    Character.select{|character| character.actor == self}
  end

  def list_roles
    characters.map{|character| "#{character.name} - #{character.show.name}"}
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
