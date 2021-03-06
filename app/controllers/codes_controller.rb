class CodesController < ApplicationController
  require 'builder'

  # GET /codes
  # GET /codes.xml
  def index
    @codes = Code.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @codes }
    end
  end

  # GET /codes/1
  # GET /codes/1.xml
  def show
    @code = Code.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @code }
    end
  end


  # GET /codes/lookup/[:code].xml #  uses the custom builder markup below
  # GET /codes/lookup/[:code]     # using the custom builder markup below (since excluding ".xml" in the URL renders ALL fields)
  def lookup
    @code = Code.find_by_code(params[:code])

    # Make a custom xml builder (since excluding ".xml" in the URL renders ALL fields)
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct!
    xml.code do
      xml.description @code.description
      xml.amount @code.amount
      xml.currency @code.currency
      xml.organization @code.organization
      xml.email @code.email
      xml.support_contact @code.support_contact
      xml.support_phone @code.support_phone
      xml.updated_at @code.updated_at
    end

    respond_to do |format|
      format.any  { render :xml => xml.target! }
#      format.html { render :xml => xml.target! }
    end
  end

  # GET /codes/new
  # GET /codes/new.xml
  def new
    @code = Code.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @code }
    end
  end

  # GET /codes/1/edit
  def edit
    @code = Code.find(params[:id])
  end

  # POST /codes
  # POST /codes.xml
  def create
    @code = Code.new(params[:code])

    respond_to do |format|
      if @code.save
        format.html { redirect_to(@code, :notice => 'Code was successfully created.') }
        format.xml  { render :xml => @code, :status => :created, :location => @code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /codes/1
  # PUT /codes/1.xml
  def update
    @code = Code.find(params[:id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to(@code, :notice => 'Code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.xml
  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to(codes_url) }
      format.xml  { head :ok }
    end
  end
end

