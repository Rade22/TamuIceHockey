# frozen_string_literal: true

# admin model
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@google.com || @tamu.edu\z/

    # puts email
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_by(email: email)
  end
end
