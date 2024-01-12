class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :article_keywords
  has_many :keywords, through: :article_keywords
  # un article doit toujours être associé à un utilisateur lors de sa création ou de sa mise à jour:
  validates :user, presence: true
  # Un article doit avoir un titre
  validates :title, presence: true, length: { minimum: 5 }
  # Ajout activeStorage aux articles pour pouvoir faciliter
  # has_many_attached :images, service: :local, dependent: :purge
  has_many_attached :images, dependent: :purge
  # Ajout de pièces jointes aux article
  has_many_attached :documents, dependent: :purge_later
  has_many :comments, dependent: :destroy
  has_many :article_tags
  has_many :tags, through: :article_tags
  # Association 'likes' fusionnée avec les options nécessaires
  has_many :likes, dependent: :destroy, counter_cache: true
  has_many :liking_users, through: :likes, source: :user
end
