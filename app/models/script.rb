class Script < ApplicationRecord
    def self.for_user(user_id)
        Script.where(user_id: user_id)
    end

    def self.add_new(script_params,user_id)
        Script.create!(script_params.merge({user_id:user_id}))
    end

    def self.getTime
        "0"
    end
end
