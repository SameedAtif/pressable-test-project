class UserPolicy < ApplicationPolicy
  POLICY_ACTIONS = %i[show edit update].freeze

  private

  def record?
    user == record
  end
end
