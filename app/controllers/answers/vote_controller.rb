class Answers::VoteController < ApplicationController

  # POST /answers/1/vote.json
  def create
    @answer = Answer.find (params[:answer_id])
    @vote = current_user.vote(:votee => @answer, :value => params[:vote].to_sym)

    respond_to do |format|
      if @vote.save
        format.json { render json: @vote, status: :created }
      else
        format.json { render json: @vote.errors, status: :unprocessable_entity }
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
