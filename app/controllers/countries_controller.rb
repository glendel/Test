class CountriesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
    # or, use an explicit "per page" limit:
    #@countries = Country.all.order_by(["name", 1]).paginate(:page => params[:page], :per_page => 12)

    respond_to do |format|
      format.html {# index.html.erb
        #raise (params[:filter].to_s + params.inspect.to_s)
        if ( request.xhr? ) 
          @countries = Country.where(name: Regexp.new(params[:filter], "i")).order_by(["name", 1]).page(params[:page]).per(12)
          render( { :partial => 'countries'} )
          #render( { :text => @departaments.size} )
          return
        elsif
          @countries = @countries.order_by(["name", 1]).page(params[:page]).per(12)
        end
      }
      #format.html # index.html.erb
      format.json { render json: @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country }
    end
  end

  # GET /countries/new
  # GET /countries/new.json
  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render json: @country, status: :created, location: @country }
      else
        format.html { render action: "new" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.json
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country = Country.find(params[:id])
    if(@country.destroy)
      script = "$('#" + params[:id] + "').remove();"
    else
      script = "alert('Error on Delete');"
    end

    respond_to do |format|
      format.html { redirect_to countries_url }
      format.js { render js: script }
      format.json { head :no_content }
    end
  end
end