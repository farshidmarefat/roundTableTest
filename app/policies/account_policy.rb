class AccountPolicy < ApplicationPolicy
  attr_reader :current_user, :account

  def initialize(current_user, account)
    @current_user = current_user
    @account = account
  end

  def create?
    current_user.admin?
  end

  def index?
    current_user.admin?
  end

  def show?
    current_user.admin? || current_user.accounts.exists?(id: account.id)
  end

  def update?
    current_user.admin?
  end

  def destroy?
    current_user.admin?
  end
end