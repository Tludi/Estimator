class Dashboard < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user

  def check_project_limit(user)
    @projects_allowed = check_account_type(user)
    # user_project_limit = user.projects.count
    unless user.projects.count == @projects_allowed
      false
    else
      true
    end
  end

  def check_account_type(user)
    if user.account.account_type == "free"
      1
    elsif user.account.account_type == "basic"
      15
    elsif user.account.account_type == "plus"
      35
    elsif user.account.account_type == "premium"
      100
    elsif
      100000
    end
  end
end
