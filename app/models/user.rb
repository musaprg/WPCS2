class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :contest_registrations
  has_many :contests, through: :contest_registrations
  has_many :submissions

  scope :registered_contest_id, ->(contest_id) {
    joins(:contests).merge(Contest.id_is(contest_id))
  }
end
