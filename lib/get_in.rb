require "get_in/version"

class Object
  def get_in(keys, default = nil)
    default unless is_a? Hash
    keys.reduce(self) do |acc, key|
      raise unless acc.key?(key)
      acc[key]
    end
  rescue
    default
  end
end
