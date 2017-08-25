class Ability
  include CanCan::Ability

  def initialize(user)
    ## User can update itself
    can [:read], [User, Sector, Project, EvaluationModel, Evaluation]
    can [:update], User, :id => user.id
    ## Evaluation Authorization
    can :manage, Evaluation, :evaluation_model => {:sector_id => user.sector_id}

    ## Position based authorization
    if user.has_admin_privileges?
      can :manage, [Sector, Position, User, EvaluationModel, Question, Evaluation, Project]
    elsif user.has_position?(Position.institutional_context.find_by(name: 'Gerente'))
      can :manage, [ProjectAllocation, Evaluation]
    elsif user.has_position?(Position.institutional_context.find_by(name: 'Diretor')) || user.has_position?(Position.institutional_context.find_by(name: 'Presidente'))
      can :manage, Sector
      can :create, User
      can :create, Evaluation
    end
  end

end
