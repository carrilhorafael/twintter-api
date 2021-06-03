class User < ApplicationRecord
    has_secure_password
    mount_uploader :image, ImageUploader

    ## Relações
    has_many :posts, dependent: :destroy
    has_many :like_posts, dependent: :destroy
    has_many :like_comments, dependent: :destroy
    has_many :comments, dependent: :destroy
    # has_many :liked_posts, class_name:"Post", through: :like_posts
    has_and_belongs_to_many :followers, join_table: "follows", foreign_key: "followed_id", class_name: "User", association_foreign_key: "follower_id"
    has_and_belongs_to_many :followeds, join_table: "follows", foreign_key: "follower_id", class_name: "User", association_foreign_key: "followed_id"


    ## Validações
    validates :name, :email, :birthdate, :gender, :contact_phone, :nickname, presence: true
    validates :nickname, :email, uniqueness: true
    validates :password, :password_confirmation, length: {minimum: 6}, if: :password
    validates :contact_phone, length: {is: 11}, numericality: {only_integer: true}
    validate :under_age?
    enum gender:{
        "Mulher":0,
        "Homem":1
    }
    enum role:{
        "not_valid":0,
        "standard":1,
        "admin":2

    }

    # funções
    def age
        ((Date.today-birthdate).to_i/365.25).to_i
    end
    def under_age?
        if birthdate.nil? || age < 18
            errors.add(:under_age, "Você é menor de idade")
        end
    end
    def destroy_follows
        followeds = Follow.where(follower_id: id)
        followeds.each do |t|
            t.destroy
        end
        followers = Follow.where(followed_id: id)
        followers.each do |t|
            t.destroy
        end
    end

    def generate_validation_token
        self.validate_token = generate_random_token
        self.validate_token_expiry_at = Time.now + 2.minutes
        self.save
    end

    
    def validate_user?(token)
        if validate_token_expiry_at > Time.now
            self.role = 1
            self.validate_token = nil
            return true if self.save
        else
            return false
        end
    end
    def reset_password_complete?(password, password_confirmation)
        self.password = password
        self.password_confirmation = password_confirmation
        self.validate_token = nil
        return true if self.save
    end


    private
        def generate_random_token
            SecureRandom.alphanumeric(15)
        end


end
