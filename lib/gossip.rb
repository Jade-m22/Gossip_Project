require 'csv'
require 'pry'

class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    id = id.to_i - 1
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      return Gossip.new(csv_line[0], csv_line[1]) if index == id.to_i
    end
    return nil
  end

  def self.update(id, new_author, new_content)
    all_gossips = self.all
    id = id.to_i - 1
    all_gossips[id.to_i] = Gossip.new(new_author, new_content)

    CSV.open("./db/gossip.csv", "w") do |csv|
      all_gossips.each { |gossip| csv << [gossip.author, gossip.content] }
    end
  end
end
