class Clinic < ApplicationPolicy
    attr_reader :user, :clinic

    def initialize(user, clinic)
        @user = user
        @clinic = clinic
    end

    def index?
        user.admin? || user.manager?
    end

    def show?
        user.admin? || user.manager?
    end

    def create?
        user.admin? || user.manager?
    end

    def new?
        create?
    end

    def update?
        user.admin? || user.manager?
    end

    def edit?
        update?
    end

    def destroy?
        user.admin? || user.manager?
    end

    class Scope < Scope
        def resolve
            if user.admin? || user.manager?
                scope.all
            else
                scope.where(user_id: user.id)
            end
        end
    end
end
