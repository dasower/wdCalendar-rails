class ApptCalendarsController < ApplicationController
  # GET /appt_calendars
  # GET /appt_calendars.json
  def index
    @appt_calendars = ApptCalendar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appt_calendars }
    end
  end

  # GET /appt_calendars/1
  # GET /appt_calendars/1.json
  def show
    @appt_calendar = ApptCalendar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appt_calendar }
    end
  end

  # GET /appt_calendars/new
  # GET /appt_calendars/new.json
  def new
    @appt_calendar = ApptCalendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appt_calendar }
    end
  end

  # GET /appt_calendars/1/edit
  def edit
    @appt_calendar = ApptCalendar.find(params[:id])
  end

  # POST /appt_calendars
  # POST /appt_calendars.json
  def create
    @appt_calendar = ApptCalendar.new(params[:appt_calendar])

    respond_to do |format|
      if @appt_calendar.save
        format.html { redirect_to @appt_calendar, notice: 'Appt calendar was successfully created.' }
        format.json { render json: @appt_calendar, status: :created, location: @appt_calendar }
      else
        format.html { render action: "new" }
        format.json { render json: @appt_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appt_calendars/1
  # PUT /appt_calendars/1.json
  def update
    @appt_calendar = ApptCalendar.find(params[:id])

    respond_to do |format|
      if @appt_calendar.update_attributes(params[:appt_calendar])
        format.html { redirect_to @appt_calendar, notice: 'Appt calendar was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @appt_calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appt_calendars/1
  # DELETE /appt_calendars/1.json
  def destroy
    @appt_calendar = ApptCalendar.find(params[:id])
    @appt_calendar.destroy

    respond_to do |format|
      format.html { redirect_to appt_calendars_url }
      format.json { head :ok }
    end
  end
end
