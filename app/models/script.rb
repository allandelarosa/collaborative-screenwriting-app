class Script < ApplicationRecord
    def self.for_user(email)
        Script.where(email: email)
    end

    def self.add_new(script_params,email)
        Script.create!(script_params.merge({email:email}))
    end
end
