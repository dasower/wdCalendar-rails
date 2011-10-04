class JqcalendarsController < ApplicationController
  # GET /jqcalendars
  # GET /jqcalendars.json

	def temp
		puts "Got to temp."
		respond_to do |format|
			format.json
		end
	end

  def index
    @jqcalendars = Jqcalendar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jqcalendars }
    end
  end

  # GET /jqcalendars/1
  # GET /jqcalendars/1.json
  def show
    @jqcalendar = Jqcalendar.find(params[:id])
		render :layout => false
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @jqcalendar }
    #end
  end

  # GET /jqcalendars/new
  # GET /jqcalendars/new.json
  def new
    @jqcalendar = Jqcalendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jqcalendar }
    end
  end

  # GET /jqcalendars/1/edit
  def edit
    @jqcalendar = Jqcalendar.find(params[:id])
  end

  # POST /jqcalendars
  # POST /jqcalendars.json
  def create
		stdatearray = params[:stpartdate].split('/')
		sttimearray = params[:stparttime].split(':')
		etdatearray = params[:etpartdate].split('/')
		ettimearray = params[:etparttime].split(':')
		params[:jqcalendar][:StartTime] = 2.days.ago
		params[:jqcalendar][:EndTime] = Time.now
    @jqcalendar = Jqcalendar.new(params[:jqcalendar])

    respond_to do |format|
      if @jqcalendar.save
        format.html { redirect_to @jqcalendar, notice: 'Jqcalendar was successfully created.' }
        format.json { render json: @jqcalendar, status: :created, location: @jqcalendar }
      else
        format.html { render action: "new" }
        format.json { render json: @jqcalendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jqcalendars/1
  # PUT /jqcalendars/1.json
  def update
    @jqcalendar = Jqcalendar.find(params[:id])

    respond_to do |format|
      if @jqcalendar.update_attributes(params[:jqcalendar])
        format.html { redirect_to @jqcalendar, notice: 'Jqcalendar was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @jqcalendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jqcalendars/1
  # DELETE /jqcalendars/1.json
  def destroy
    @jqcalendar = Jqcalendar.find(params[:id])
    @jqcalendar.destroy

    respond_to do |format|
      format.html { redirect_to jqcalendars_url }
      format.json { head :ok }
    end
  end
end
