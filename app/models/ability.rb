class Ability
  include CanCan::Ability

  def initialize(user)
    ## Position based authorization
    if user.is_position?(Position.institutional_context.find_by(name: 'Diretor'))
      can :manage, [Sector, Position, User, EvaluationModel, Question, Evaluation]
    elsif user.is_position?(Position.institutional_context.find_by(name: 'Gerente'))
      can :manage, ProjectAllocation
    end
    ## User can update itself
    can [:read,:update], User, :id => user.id
    ## Evaluation Authorization
    can :manage, Evaluation, :evaluation_model => {:sector_id => user.sector_id} 
  end

end
