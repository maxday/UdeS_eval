class AffectationsController < ApplicationController


  #load roles logic
  load_and_authorize_resource

  # GET /affectations
  # GET /affectations.json
  def index
    @affectations = Affectation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affectations }
    end
  end

  # GET /affectations/1
  # GET /affectations/1.json
  def show
    @affectation = Affectation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affectation }
    end
  end

  # GET /affectations/new
  # GET /affectations/new.json
  def new
    @affectation = Affectation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affectation }
    end
  end

  # GET /affectations/1/edit
  def edit
    @affectation = Affectation.find(params[:id])
  end

  # POST /affectations
  # POST /affectations.json
  def create
    @affectation = Affectation.new(params[:affectation])

    respond_to do |format|
      if @affectation.save
        format.html { redirect_to @affectation, notice: 'Affectation was successfully created.' }
        format.json { render json: @affectation, status: :created, location: @affectation }
      else
        format.html { render action: "new" }
        format.json { render json: @affectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affectations/1
  # PUT /affectations/1.json
  def update
    @affectation = Affectation.find(params[:id])

    respond_to do |format|
      if @affectation.update_attributes(params[:affectation])
        format.html { redirect_to @affectation, notice: 'Affectation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affectations/1
  # DELETE /affectations/1.json
  def destroy
    @affectation = Affectation.find(params[:id])
    @affectation.destroy

    respond_to do |format|
      format.html { redirect_to affectations_url }
      format.json { head :no_content }
    end
  end
end
