class City
  include Mongoid::Document
  field :code, type: Integer
  field :name, type: String
  field :depart_id, type: Integer
  field :cap, type: Integer
  
  has_many :clients, foreign_key: "city_id", primary_key: "code", dependent: :destroy
  belongs_to :departament, foreign_key: "depart_id", primary_key: "code"
  
  validates_presence_of :name
  validates_numericality_of :code, :greater_than => 0, :only_integer => true
  validates_numericality_of :depart_id, :greater_than => 0, :only_integer => true
  validates_uniqueness_of :code
  
  #============================================
  # all_filter_by
  #============================================
  def self.all_filter_by( filter, page )
    return( self.where(name: Regexp.new( filter, "i")).order_by(["name", 1]).page( page ).per(12) )
  end
  
  #============================================
  # all_filtered_by_params
  #============================================
  def self.all_filtered_by_params( params )
    if(params[:filter])
      @cities = self.all_filter_by( params[ :filter ], params[ :page ] )
    elsif(params[:depart_id])
      @cities = self.where(depart_id: Regexp.new(params[:depart_id], "i")).order_by(["cap", 1], ["name", 1])
      @cities = @cities.page( params[ :page ] ).per(12) if ( !params[ :type ] || params[ :type ] != 'select' )
    else
      @cities = self.all.order_by(["name", 1]).page(params[:page]).per(12)
    end
    
    return( @cities )
  end
end
