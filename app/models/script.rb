class Script < ApplicationRecord
    def self.for_user(email)
        Script.where(email: email)
    end
end
