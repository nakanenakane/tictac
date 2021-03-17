class TrialController < ApplicationController

  def index
    @questions = Question.select("questions")
    @choise = Choise.select("content")
    gon.questions = @questions
    gon.choise = @choise
  end

end