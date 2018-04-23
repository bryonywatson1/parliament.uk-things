class QuestionsController < ApplicationController
  before_action :data_check, :build_request

  ROUTE_MAP = {
    show: proc { |params| Parliament::Utils::Helpers::ParliamentHelper.parliament_request.question_by_id.set_url_params({ question_id: params[:question_id] }) }
  }.freeze

  def show
    @question, @answer, @answering_body, @answering_person_government_incumbency, @asking_person_seat_incumbency, @constituency, @government_position = Parliament::Utils::Helpers::FilterHelper.filter(@request, 'Question', 'Answer', 'Group', 'GovernmentIncumbency', 'SeatIncumbency', 'ConstituencyGroup', 'GovernmentPosition')
    @question = @question.first
    @answer = @answer.first
    @constituency = @constituency.first
    @asking_person_seat_incumbency = @asking_person_seat_incumbency.first
    @answering_person_government_incumbency = @answering_person_government_incumbency.first
    @government_position = @government_position.first
    @answering_body = @answering_body.first
    @asking_person = @question.asking_person
    @answering_person = @answer.answering_person
  end
end
