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
    end

    if user.monitor?
      can :read, AnswerGroup, evaluation_target_id: User.where(monitor: user).pluck(:id)
      can :manage, Evaluation, members: User.where(monitor: user).pluck(:id)
    end

    if user.director?
      can :manage, [Sector, Position, User, EvaluationModel, Question]
      can :read, AnswerGroup, user_id: user.sector.users.pluck(:id)
      can :read, Evaluation, evaluation_model: { sector_id: user.sector }

    elsif user.manager?
      can :manage, [ProjectAllocation, Evaluation, Project]

    elsif user.director? || user.president?
      can :manage, Sector
      can :manage, User
      can :manage, Evaluation

    elsif (user.sector == Sector.people_management || user.sector == Sector.organizational_presidency) && user.advisor?
      can :have, :monitors
    end
  end
end
