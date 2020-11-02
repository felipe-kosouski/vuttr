class Tool < ApplicationRecord
  def self.search(search)
    Tool.where("'#{search}' = ANY (tags)")
  end

  validates_presence_of :title, :link
end
