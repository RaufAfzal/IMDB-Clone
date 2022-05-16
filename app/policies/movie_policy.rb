class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
    
      if user.present?
    
        if user.Admin?
          scope.where(status:0)
        else
          scope.where(status: 1)
        end
    end
   end
  end

    
    end
   
  def index?
    if user.present?
      user.Member?
    end
  end

  def update?
    if user.present?
      user.Moderator? || user.Admin?
    end


  end
  # def show?
  #   if user.present?
  #   user.Member?
  #   end
  #   end

