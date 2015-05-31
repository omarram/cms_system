class AdminUser < ActiveRecord::Base
    has_secure_password

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    FORBIDDEN_USERNAMES = ["fucker", "motherfucker", "fadafaka"]

#sexy validations ;)

	validates :first_name, :presence => true, 
	                       :length => {:maximum => 25}

	validates :last_name, :presence => true, 
	                      :length => {:maximum => 50}

	validates :username, :length => {:within => 8..25},
                         :uniqueness => true

    validates :email, :presence => true, 
    				  :length => {:maximum => 100}, 
    				  :format => EMAIL_REGEX, 
    				  :confirmation => true,
    				  :uniqueness => true
  
    validate :username_is_allowed
    validate :no_new_users_on_sat, :on => :create

    def username_is_allowed
    	if FORBIDDEN_USERNAMES.include?(username)
    		errors.add(:username, "has been restricted from use.")
    	end
    end

    def no_new_users_on_sat
        if Time.now.wday == 6
            errors[:base] << "No new users on Saturdays are allowed, sorry :("
        end
    end

end
