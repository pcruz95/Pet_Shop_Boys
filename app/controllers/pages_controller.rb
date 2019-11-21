class PagesController < ApplicationController
  def home
    @pets = policy_scope(Pet)
  end
end
