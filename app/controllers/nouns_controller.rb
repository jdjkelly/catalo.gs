class NounsController < ApplicationController
  # GET /nouns
  # GET /nouns.json
  def index
    @nouns = Noun.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nouns }
    end
  end

  # GET /nouns/1
  # GET /nouns/1.json
  def show
    @noun = Noun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @noun }
    end
  end

  # GET /nouns/new
  # GET /nouns/new.json
  def new
    @noun = Noun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @noun }
    end
  end

  # GET /nouns/1/edit
  def edit
    @noun = Noun.find(params[:id])
  end

  # POST /nouns
  # POST /nouns.json
  def create
    @noun = Noun.new(params[:noun])

    respond_to do |format|
      if @noun.save
        format.html { redirect_to @noun, notice: 'Noun was successfully created.' }
        format.json { render json: @noun, status: :created, location: @noun }
      else
        format.html { render action: "new" }
        format.json { render json: @noun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nouns/1
  # PUT /nouns/1.json
  def update
    @noun = Noun.find(params[:id])

    respond_to do |format|
      if @noun.update(params[:noun])
        format.html { redirect_to @noun, notice: 'Noun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @noun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nouns/1
  # DELETE /nouns/1.json
  def destroy
    @noun = Noun.find(params[:id])
    @noun.destroy

    respond_to do |format|
      format.html { redirect_to nouns_url }
      format.json { head :no_content }
    end
  end
end
