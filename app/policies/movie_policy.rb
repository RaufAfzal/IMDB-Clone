class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.present?
    
        if user.Admin?
          scope.where(status:"Draft").includes(:reviews).where("rating != ?",'')
        else
          scope.where(status:"Published").includes(:reviews).where("rating != ?",'')
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

