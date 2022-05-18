class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.present?
    
        if user.Admin?
          scope.status_with_reviews(0)
        else
          scope.status_with_reviews(1)
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
  
  def create?
    if user.present?
      user.Moderator?
    end
  end

  # def show?
  #   if user.present?
  #   user.Member?
  #   end
  #   end

