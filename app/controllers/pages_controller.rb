class PagesController < ApplicationController
  def home
    @pets = policy_scope(Pet)
    @markers = []
    @pets.each do |pet|
      @markers << {lat: pet.latitude, lng: pet.longitude, infoWindow: render_to_string(partial: "pets/info_window", locals: { pet: pet })}
    end
    @markers
  end
end
