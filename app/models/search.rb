class Search

  def self.nearest(lat, lon, limit = 10)
    kdtree = generate_or_retrieve_tree
    return kdtree.nearestk lat.to_f, lon.to_f, limit
  end

  def self.generate_or_retrieve_tree
    filename = "db/kdtreefile_" + Rails.env
    if not File.exist? filename
      points = []
      Location.find_each do |key|
        points << [ key.latitude, key.longitude, key.location_id]
      end
      tree = Kdtree.new(points)
      File.open(filename, "w") { |f| tree.persist(f) }
      return File.open(filename) { |f| Kdtree.new(f) }
    else 
      return File.open(filename) { |f| Kdtree.new(f) }
    end
  end

end