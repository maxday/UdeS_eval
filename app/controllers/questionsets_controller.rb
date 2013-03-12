class QuestionsetsController < ApplicationController
  # GET /questionsets
  # GET /questionsets.json
  def index
    @questionsets = Questionset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionsets }
    end
  end

  # GET /questionsets/1
  # GET /questionsets/1.json
  def show
    @questionset = Questionset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionset }
    end
  end

  # GET /questionsets/new
  # GET /questionsets/new.json
  def new
    @questionset = Questionset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionset }
    end
  end

  # GET /questionsets/1/edit
  def edit
    @questionset = Questionset.find(params[:id])
  end

  # POST /questionsets
  # POST /questionsets.json
  def create
    require 'spreadsheet'
    require 'fileutils'

    time = Time.now
    file_name = time.to_formatted_s(:number)

    uploaded_io = params[:file_upload][:eval].tempfile
    File.open(Rails.root.join('public', 'uploads', "QuestionSet - #{file_name}.xlsx"), 'wb') do |file|
      file.write(uploaded_io.read)
      file.close
    end

    excel = RubyXL::Parser.parse(Rails.root.to_s + "/public/uploads/QuestionSet - #{file_name}.xlsx")
    title_sheet = excel.worksheets[0]
    questions_sheet = excel.worksheets[1]
    answers_sheet = excel.worksheets[2]
    legend_sheet = excel.worksheets[3]

    set_name = title_sheet[0][0].value
    set_legend = legend_sheet[0][0].value

    question_tab = Array.new

    i = 1
    while questions_sheet[i] != nil && questions_sheet[i][0] != nil && questions_sheet[i][1] != nil
      question_tab << [questions_sheet[i][0].value, questions_sheet[i][1].value]
      i = i + 1
    end

    answer_tab = Array.new

    i = 1
    while answers_sheet[i] != nil && answers_sheet[i][0] != nil && answers_sheet[i][1] != nil
      answer_tab << [answers_sheet[i][0].value, answers_sheet[i][1].value]
      i = i + 1
    end

    set = Questionset.new(:name => set_name)
    set.save


    question_tab.each do |single_question|
      cat = Category.new(:name => single_question[0], :questionset_id => set.id)
      cat.save

      id = Category.where(:questionset_id => set.id, :name =>single_question[0]).first.id

      question = Question.new(:name => single_question[1], :category_id => id)
      question.save
    end


    answer_tab.each do |single_answer|
      entry = Entry.new(:visible_value => single_answer[0], :real_value => single_answer[1], :questionset_id => set.id)
      entry.save
    end


  end


  # PUT /questionsets/1
  # PUT /questionsets/1.json
  def update
    @questionset = Questionset.find(params[:id])

    respond_to do |format|
      if @questionset.update_attributes(params[:questionset])
        format.html { redirect_to @questionset, notice: 'Questionset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionsets/1
  # DELETE /questionsets/1.json
  def destroy
    @questionset = Questionset.find(params[:id])
    @questionset.destroy

    respond_to do |format|
      format.html { redirect_to questionsets_url }
      format.json { head :no_content }
    end
  end
end
