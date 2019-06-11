class Article < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, presence: :true,
                    length: { minimum: 5 }
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tag_ids)
    tags = tag_ids.map do |tag_id|
      Tag.find(tag_id) unless tag_id.empty?
    end

    self.tags = tags.compact
  end
end
