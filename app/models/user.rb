class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  # Ajout photo a l'utilisateur
  has_one_attached :photo
  has_many :articles
  has_many :comments
  # Partie J'aime
  has_many :likes, dependent: :destroy # Quand on supprime un user, likes seront supprimés
  has_many :liked_articles, through: :likes, source: :article
end
