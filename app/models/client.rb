class Client
  include Mongoid::Document
  field :avatar, type: String
  # CarrierWave
  mount_uploader :avatar, AvatarUploader
  field :typeID, type: String
  field :numID, type: Integer
  field :name, type: String
  field :birth, type: Date
  field :sex, type: String
  field :country, type: String
  field :departament, type: String
  field :city, type: String
end
