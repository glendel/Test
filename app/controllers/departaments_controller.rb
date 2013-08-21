class DepartamentsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /departaments
  # GET /departaments.json
  def index
    @departaments = Departament.all
    #@departaments = Departament.all.order_by(["name", 1]).page(params[:page]).per(12)
    #@departaments = Departament.all.order_by(["name", 1]).paginate(:page => params[:page], :per_page => 12)

    respond_to do |format|
      format.html {# index.html.erb
        #raise (params[:filter].to_s + params.inspect.to_s)
        if ( request.xhr? ) 
          @departaments = Departament.where(name: Regexp.new(params[:filter], "i")).order_by(["name", 1]).page(params[:page]).per(12)
          render( { :partial => 'departaments'} )
          #render( { :text => @departaments.size} )
          return
        else
          @departaments = @departaments.order_by(["name", 1]).page(params[:page]).per(12)
          return
        end
      }
      #format.html # index.html.erb
      format.json { render json: @departaments }
    end
  end

  # GET /departaments/1
  # GET /departaments/1.json
  def show
    @departament = Departament.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departament }
    end
  end

  # GET /departaments/new
  # GET /departaments/new.json
  def new
    @departament = Departament.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departament }
    end
  end

  # GET /departaments/1/edit
  def edit
    @departament = Departament.find(params[:id])
  end

  # POST /departaments
  # POST /departaments.json
  def create
    @departament = Departament.new(params[:departament])

    respond_to do |format|
      if @departament.save
        format.html { redirect_to @departament, notice: 'Departament was successfully created.' }
        format.json { render json: @departament, status: :created, location: @departament }
      else
        format.html { render action: "new" }
        format.json { render json: @departament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departaments/1
  # PUT /departaments/1.json
  def update
    @departament = Departament.find(params[:id])

    respond_to do |format|
      if @departament.update_attributes(params[:departament])
        format.html { redirect_to @departament, notice: 'Departament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @departament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departaments/1
  # DELETE /departaments/1.json
  def destroy
    @departament = Departament.find(params[:id])
    if(@departament.destroy)
      script = "$('#" + params[:id] + "').remove();"
    else
      script = "alert('Error on Delete');"
    end

    respond_to do |format|
      format.html { redirect_to departaments_url }
      format.js { render js: script }
      format.json { head :no_content }
    end
  end
end
