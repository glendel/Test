class Departament
  include Mongoid::Document
  field :name, type: String
  field :code, type: Integer  
  field :country_id, type: String
  
  has_many :cities, foreign_key: "depart_id", primary_key: "code", dependent: :destroy
  has_many :clients, foreign_key: "depart_id", primary_key: "code", dependent: :destroy
  belongs_to :country, foreign_key: "country_id", primary_key: "code"
  
  validates_presence_of :name
  validates_numericality_of :code, :greater_than => 0, :only_integer => true
  validates_uniqueness_of :code
  
  #============================================
  # all_filtered_by_params
  #============================================
  def self.all_filtered_by_params( params )
    if(params[:filter])
      @departaments = self.where(name: Regexp.new( params[ :filter ], "i")).order_by(["name", 1]).page( params[ :page ] ).per(12)
    elsif(params[:country_id])
      @departaments = self.where(country_id: Regexp.new(params[:country_id], "i")).order_by(["cap", 1], ["name", 1])
      @departaments = @departaments.page( params[ :page ] ).per(12) if ( !params[ :type ] || params[ :type ] != 'select' )
    else
      @departaments = self.all.order_by(["name", 1]).page(params[:page]).per(12)
    end
    
    return( @departaments )
  end
end
