class Hash
  def extract(*keys)
    keys.inject({}) {|hash, key| hash[key] = self[key]; hash}
  end
end
