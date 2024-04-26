class User < ApplicationRecord
    has_many :posts
    validates :name, presence: { message: "Name can't be blank." }
    validates :email, presence: { message: "Email can't be blank." },
                      uniqueness: { message: "Email has already been taken." },
                      format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format." }
    validates :password, presence: { message: "Password can't be blank." },
                          length: { minimum: 6, message: "Password must be at least 6 characters long." }
    before_save :normalize_email

    private

    def normalize_email
        self.email = email.downcase.strip
    end
end