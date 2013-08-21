class Country
  include Mongoid::Document
  
  field :name, type: String
  field :code, type: String
  
  has_many :clients, foreign_key: "country", primary_key: "code", dependent: :destroy
  has_many :departaments, foreign_key: "country_id", primary_key: "code", dependent: :destroy
  
  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code
end