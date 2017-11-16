class Ability
  include CanCan::Ability

  def initialize(user)
    ## User can update itself
    can :read, [User, Sector, Project]
    can :update, User, id: user.id

    ## EvaluationAnswers Authorization
    can [:update], AnswerGroup, user_id: user.id
    can %i[read update edit unanswered], AnswerGroup, user_id: user.id

    ## Position based authorization
    if user.has_admin_privileges?
      can :manage, :all
      can :set, :monitors
      can :read, AnswerGroup
    end

    if user.is_monitor?
      can %i[read individual_report], AnswerGroup, evaluation_target_id: User.where(monitor: user).pluck(:id)
      can :read, Evaluation
    end

    if user.is_director?
      can :manage, [Sector, Position, User, EvaluationModel, Question, Project, EvaluationCycle]
      can :read, AnswerGroup, user_id: user.sector.users.pluck(:id)
      can :read, Evaluation, evaluation_model: { sector_id: user.sector }

    elsif user.is_manager?
      can :manage, [ProjectAllocation, Evaluation]

    elsif user.is_director? || user.is_president?
      can :manage, Sector
      can :manage, User
      can :manage, Evaluation

    elsif (user.sector == Sector.people_management || user.sector == Sector.organizational_presidency) && user.is_advisor?
      can :have, :monitors
    end
  end
end
