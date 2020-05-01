class Script < ApplicationRecord
    def self.for_user(user_id)
        Script.where(user_id: user_id)
    end

    def self.add_new(script_params,user_id)
        Script.create!(script_params.merge({user_id:user_id}))
    end

    def getTime
        secs = Time.now() - self.updated_at
        ans = ""
        time = ""
        case secs
        when 1..3599
            ans = (secs/60).round()
            time = "#{ans} minutes ago"
        when 3600..86400
            ans = (secs/60/60).round()
            time = "#{ans} hours ago"
        else
            # print('in here')
            ans = self.last_edited
            time = ans
        end
        time
    end

    def getTimeInSecs
        Time.now() - self.updated_at
    end
end
