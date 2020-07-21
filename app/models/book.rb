class Book < ApplicationRecord
    #Validates validadores de entrada
    validates :title, presence: true
    validates :author, presence: true
    validates :status, presence: true
    #Enum listador de tipos
    enum status: [:PRESTADO, :"EN ESTANTE"]
end