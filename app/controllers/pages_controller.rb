class PagesController < ApplicationController
  def home
    @pets = policy_scope(Pet)
  end

  # def search
  #   Pet.where('address ILIKE ?', params[:query])
  # end
end
