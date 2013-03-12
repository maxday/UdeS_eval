class StudentsetsController < ApplicationController
  # GET /studentsets
  # GET /studentsets.json
  def index
    @studentsets = Studentset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studentsets }
    end
  end

  # GET /studentsets/1
  # GET /studentsets/1.json
  def show
    @studentset = Studentset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @studentset }
    end
  end

  # GET /studentsets/new
  # GET /studentsets/new.json
  def new
    @studentset = Studentset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @studentset }
    end
  end

  # GET /studentsets/1/edit
  def edit
    @studentset = Studentset.find(params[:id])
  end

  # POST /studentsets
  # POST /studentsets.json
  def create
    @studentset = Studentset.new(params[:studentset])

    respond_to do |format|
      if @studentset.save
        format.html { redirect_to @studentset, notice: 'Studentset was successfully created.' }
        format.json { render json: @studentset, status: :created, location: @studentset }
      else
        format.html { render action: "new" }
        format.json { render json: @studentset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /studentsets/1
  # PUT /studentsets/1.json
  def update
    @studentset = Studentset.find(params[:id])

    respond_to do |format|
      if @studentset.update_attributes(params[:studentset])
        format.html { redirect_to @studentset, notice: 'Studentset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @studentset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studentsets/1
  # DELETE /studentsets/1.json
  def destroy
    @studentset = Studentset.find(params[:id])
    @studentset.destroy

    respond_to do |format|
      format.html { redirect_to studentsets_url }
      format.json { head :no_content }
    end
  end
end
