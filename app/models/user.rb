
class User < ApplicationRecord

    has_secure_password

    # def self.add_new(user_params)
    #     username = user_params[:username]
    #     hashed_password = BCrypt::Password.create user_params[:password]
    #     User.create!({username:username, password:password})
    # end

    # def self.verify(user_params)
    #     if @user = User.where(username: user_params[:username])
    #         # user found
    #         if BCrypt::Password.new(@user.password) == user_params[:password]
    #             # correct user and password
    #             return true
    #         else
    #             # invalid password
    #             return false
    #         end
    #     else
    #         # user not found
    #         return false
    #     end
    # end
end
