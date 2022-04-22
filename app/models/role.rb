class Role < ActiveRecord::Base
    has_many :auditions
    
    def actors
        #returns an array of names from the actors associated with this role
        self.auditions.map {|a| a.actor}
        
    end

    def locations
        self.auditions.map {|a| a.location}
        #returns an array of locations from the auditions associated with this role
    end

    def lead 
        #returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
        self.auditions.where(hired: true).first
    end

    def understudy 
        #returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'
        self.auditions.where(hired: true).second
    end
end