class User < ApplicationRecord

    ## Validações
    validates :name, :email, :birthdate, :gender, :contact_phone, :nickname, presence: true
    validates :nickname, :email, uniqueness: true
    validates :contact_phone, length: {is: 11}, numericality: {only_integer: true}
    validate :under_age?
    enum gender:{
        "Mulher":0,
        "Homem":1
    }

    # funções
    def age
        ((Date.today-birthdate).to_i/365.25).to_i
    end
    def under_age?
        if age < 18
            errors.add(:under_age, "Você é menor de idade")
        end
    end


end
