class Answers::VoteController < ApplicationController

  # POST /answers/1/vote
  def create
    @answer = Answer.find (params[:answer])
    @vote = current_user.vote(:votee => @answer, :value => params[:vote].to_sym)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1/vote
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

end
