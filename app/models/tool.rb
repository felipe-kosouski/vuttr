class Tool < ApplicationRecord
  def self.search(search)
    Tool.where("'#{search}' = ANY (tags)")
  end
end
