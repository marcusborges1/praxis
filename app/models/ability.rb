class Ability
  include CanCan::Ability

  def initialize(user)
    ## User can update itself
    can [:read,:update], User, :id => user.id
    ## Evaluation Authorization
    can :manage, Evaluation, :evaluation_model => {:sector_id => user.sector_id}
    ## EvaluationAnswers Authorization
    can [:update], AnswerGroup, :user_id => user.id

    ## Position based authorization
    if user.has_admin_privileges?
      can :manage, [Sector, Position, User, EvaluationModel, Question, Evaluation, Project]
    elsif user.has_position?(Position.institutional_context.find_by(name: 'Gerente'))
      can :manage, ProjectAllocation
    end
  end

end
