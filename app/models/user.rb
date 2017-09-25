class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_save {self.email = email.downcase if email.present? }
  before_save {self.role ||= :member}
  before_save :caps

  validates :name, length: {minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  enum role: [:member, :admin, :moderator]

  # def caps
  #   # Split the user's name on a space (e.g. between a first name and a last name).
  #   # Google: ruby split full name
  #   # Reveals: String#split method
  #   # Identify data: user's name => self.name
  #
  #   names = self.name.split(" ")
  #
  #   # **Loop** over **each** NAME...
  #   # Google: ruby loop over SOMETHING
  #   # Reveals: Array#each method, blocks, and more
  #
  #   namePieces = []
  #
  #   names.each do |currentName|
  #
  #     # ...and uppercase the first letter.
  #     # Reveals: currentName.capitalize
  #
  #     # Google: ruby build new array
  #     namePieces << currentName.capitalize
  #
  #   end
  #
  #   # Re-combine the first and
  #   # last names with a space in-between and save it to the name attribute.
  #   # Your solution does not have to check for an existing name that is properly
  #   # formatted. For example, "Steve Jobs" is properly formatted, but your
  #   # solution should work on it anyways.
  # end



  def caps
    if name
      arr = []
      name.split(" ").each do |names|
        arr << names.capitalize
      end
    self.name = arr.join(" ")
    end
  end

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end
end
