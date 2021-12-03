Dir[File.join(File.dirname(__FILE__),
  '../class/*.rb')].sort.each { |file| require file }

module Classes
  def players
    Players.new
  end
end