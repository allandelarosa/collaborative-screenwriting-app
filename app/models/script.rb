class Script < ApplicationRecord

    # attr_reader

    def self.for_user(email)
        Script.where(email: email)
    end

    def self.add_new(script_params,email)
        Script.create!(script_params.merge({email:email}))
    end

    def getTime
        secs = Time.now() - self.updated_at
        ans = ""
        time = ""
        case secs
        when 1..3599
            ans = (secs/60).round()
            time = "#{ans} minutes"
        when 3600..86400
            ans = (secs/60/60).round()
            time = "#{ans} hours"
        else
            ans = self.last_edited

        end
        time
    end
end
