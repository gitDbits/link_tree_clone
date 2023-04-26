# frozen_string_literal: true

# User
class User < ApplicationRecord
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_one_attached :avatar
  has_many :links, dependent: :destroy

  friendly_id :username, use: %i[slugged history]

  after_create :create_default_links
  after_update :create_default_links

  validates :full_name, length: { maximum: 50 }
  validates :body, length: { maximum: 80 }
  validate :valid_username

  def valid_username
    errors.add(:username, 'is already taken') if User.exists?(username:)

    restricted_username_list = %(admin root dashboard analytics appearance settings preferences calendar)

    errors.add(:username, 'is restricted') if restricted_username_list.include?(username)
  end

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

  private

  def create_default_links
    Link.create(user: self, title: '', url: '') while links.count < 5
  end
end
