
                   Prefix Verb   URI Pattern                                                                              Controller#Action
#   pages home                   root GET    /                                                                                        pages#home
# exists         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
            user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
# exists        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
# existsedit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
          user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 # exists cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    # exists    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   # exists   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
             pet_bookings POST   /pets/:pet_id/bookings(.:format)                                                         bookings#create
          new_pet_booking GET    /pets/:pet_id/bookings/new(.:format)                                                     bookings#new
              pet_booking GET    /pets/:pet_id/bookings/:id(.:format)                                                     bookings#show
                          DELETE /pets/:pet_id/bookings/:id(.:format)                                                     bookings#destroy
                     pets GET    /pets(.:format)                                                                          pets#index
                          POST   /pets(.:format)                                                                          pets#create
                  new_pet GET    /pets/new(.:format)                                                                      pets#new
                 edit_pet GET    /pets/:id/edit(.:format)                                                                 pets#edit
                      pet GET    /pets/:id(.:format)                                                                      pets#show
                          PATCH  /pets/:id(.:format)                                                                      pets#update
                          PUT    /pets/:id(.:format)                                                                      pets#update
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
