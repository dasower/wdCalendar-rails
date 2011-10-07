class JqcalendarsController < ApplicationController
  # GET /jqcalendars
  # GET /jqcalendars.json
  def index
    get_events
    start_time, end_time = get_start_and_end_times(get_date(params[:showdate])) if params[:showdate]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => { :events => @events, :start => start_time, :end => end_time } }
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
     interpret_calendar_event
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
		interpret_calendar_event
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
		unless params[:cancel]
    	@jqcalendar = Jqcalendar.find(params[:id])
    	@jqcalendar.destroy
		end

    respond_to do |format|
      format.html { redirect_to jqcalendars_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def get_start_and_end_times(datetime)
    start_time, end_time = case params[:viewtype]
      when "month"
        [datetime.beginning_of_month, datetime.end_of_month]
      when "week"
        [datetime.beginning_of_week, datetime.end_of_week]
      when "day"
        [datetime.beginning_of_day, datetime.end_of_day]
      else
        [nil,nil]
    end
  end
  
  def get_events
    show_date = params[:showdate]
    start_time, end_time = get_start_and_end_times(get_date(show_date)) if show_date
    conditions = show_date.blank? ? {} : {:StartTime => start_time..end_time}
    @jqcalendars = Jqcalendar.where(conditions)
    @events = []
    @jqcalendars.each do |j|
			st = ruby_datetime_to_JS_time(j.StartTime)
			et = ruby_datetime_to_JS_time(j.EndTime)
      @events << [j.id,j.Subject,st,et,0,j.IsAllDayEvent,j.RecurringRule,1,1,j.Location,""]
    end
  end

	def ruby_datetime_to_JS_time(time)
		time -= params[:timezone].to_i.hours if params[:timezone]
		time
	end
  
  def get_date(date)
    date = date.split('/')
    DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i+1)
  end

	def date_me(date,time)
		date = date.split('/') if date
		time = time.split(':') if time
		DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i,time[0].to_i,time[1].to_i) if(date || time)
	end
	
	def date_me_two(datetime)
    date,time = datetime.split(' ')
    date_me(date,time)
  end

  def interpret_calendar_event
    params[:jqcalendar][:StartTime] = date_me(params[:stpartdate],params[:stparttime]) if params[:stpartdate]
		params[:jqcalendar][:EndTime] = date_me(params[:etpartdate],params[:etparttime]) if params[:etpartdate]
		params[:jqcalendar] = {} unless params[:jqcalendar]
	  params[:jqcalendar][:StartTime] = date_me_two(params[:CalendarStartTime]) if params[:CalendarStartTime]
	  params[:jqcalendar][:EndTime] = date_me_two(params[:CalendarEndTime]) if params[:CalendarEndTime]
	  params[:jqcalendar][:Description] = params[:CalendarTitle] if params[:CalendarTitle]
	  params[:jqcalendar][:IsAllDayEvent] = params[:IsAllDayEvent]
  end
  
end
