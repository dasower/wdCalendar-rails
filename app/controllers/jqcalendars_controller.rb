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

	def date_me(date,time)
		date = date.split('/')    
		time = time.split(':')
		DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i,time[0].to_i,time[1].to_i)
	end
	
	def date_me_two(datetime)
    date,time = datetime.split(' ')
    date_me(date,time)
  end

  def cleanup_calendar
    params[:jqcalendar][:StartTime] = date_me(params[:stpartdate],params[:stparttime]) if params[:stpartdate]
		params[:jqcalendar][:EndTime] = date_me(params[:etpartdate],params[:etparttime]) if params[:etpartdate]
		params[:jqcalendar] = {} unless params[:jqcalendar]
	  params[:jqcalendar][:StartTime] = date_me_two(params[:CalendarStartTime]) if params[:CalendarStartTime]
	  params[:jqcalendar][:EndTime] = date_me_two(params[:CalendarEndTime]) if params[:CalendarEndTime]
  end
  
  # POST /jqcalendars
  # POST /jqcalendars.json
  def create
     cleanup_calendar
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
