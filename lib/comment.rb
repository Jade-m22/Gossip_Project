require 'csv'

class Comment
  attr_accessor :potin_id, :content

  def initialize(potin_id, content)
    @potin_id = potin_id
    @content = content
  end

  def save
    CSV.open("./db/comments.csv", "ab") do |csv|
      csv << [@potin_id, @content]
    end
  end

  def self.find_by_gossip_id(potin_id)
    comments = []
    CSV.read("./db/comments.csv").each do |row|
      comments << row[1] if row[0].to_i == potin_id.to_i
    end
    comments
  end
end
