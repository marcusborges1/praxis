class Ability
  include CanCan::Ability

  def initialize(user)
    ## User can update itself
    can [:read], [User, Sector, Project, EvaluationModel, Evaluation]
    can [:update], User, :id => user.id
    ## Evaluation Authorization
    can :manage, Evaluation, :evaluation_model => {:sector_id => user.sector_id}
    ## EvaluationAnswers Authorization
    can [:update], AnswerGroup, :user_id => user.id

    can [:read, :update, :edit], AnswerGroup, :user_id => user.id
    ## Position based authorization
    if user.has_admin_privileges?
      can :manage, [Sector, Position, User, EvaluationModel, Question, Evaluation, Project]
      can :set, :monitors
    elsif user.has_position?(Position.institutional_context.find_by(name: 'Gerente'))
      can :manage, [ProjectAllocation, Evaluation]
    elsif user.has_position?(Position.institutional_context.find_by(name: 'Diretor')) || user.has_position?(Position.institutional_context.find_by(name: 'Presidente'))
      can :manage, Sector
      can :manage, User
      can :manage, Evaluation
    elsif (user.sector == Sector.people_management || user.sector == Sector.organizational_presidency) && user.has_position?(Position.advisors)
      can :have, :monitors
    end
  end

end
