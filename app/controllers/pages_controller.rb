class PagesController < ApplicationController
  def home
    @pets = policy_scope(Pet)
    @markers = []
    @pets.each do |pet|
      @markers << {lat: pet.latitude, lng: pet.longitude}
    end
    @markers
  end
end
