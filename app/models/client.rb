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
  field :country_id, type: String
  field :depart_id, type: String
  field :city_id, type: String
  
  validates_presence_of :name, :message => "EL nombre no puede ser vacio."
  validates_numericality_of :numID, :greater_than => 0, :only_integer => true
  validates_length_of :numID, :minimum => 5
  validates_uniqueness_of :numID
	
  belongs_to :country, foreign_key: "country_id", primary_key: "code"
  belongs_to :departament, foreign_key: "depart_id", primary_key: "code"
  belongs_to :city, foreign_key: "city_id", primary_key: "code"
  
  before_create :send_message

  protected
  def send_message
    puts "Hey se va a crear....!"
  end

  #============================================
  # all_filtered_by_params
  #============================================
  def self.all_filtered_by_params( params )
    if(params[:filter])
      @clients = self.where(name: Regexp.new( params[ :filter ], "i")).order_by(["name", 1]).paginate(:page => params[:page], :per_page => 12)#.page( params[ :page ] ).per(12)
    elsif(params[:country_id])
      @clients = self.where(country_id: Regexp.new(params[:country_id], "i")).order_by(["cap", 1], ["name", 1]).paginate(:page => params[:page], :per_page => 12)#.page( params[ :page ] ).per(12)
    elsif(params[:depart_id])
      @clients = self.where(depart_id: Regexp.new(params[:depart_id], "i")).order_by(["cap", 1], ["name", 1]).paginate(:page => params[:page], :per_page => 12)#.page( params[ :page ] ).per(12)
    elsif(params[:city_id])
      @clients = self.where(city_id: Regexp.new(params[:city_id], "i")).order_by(["cap", 1], ["name", 1]).paginate(:page => params[:page], :per_page => 12)#.page( params[ :page ] ).per(12)
    else
      @clients = self.all.order_by(["name", 1]).paginate(:page => params[:page], :per_page => 12)#.page(params[:page]).per(12)
    end
    
    return( @clients )
  end
  
end
