module Ubw
  class Util
    # "costCode" => "cost_code"
    def self.snakify(str)
      str.to_s.each_char.with_index.reduce('') do |new_str, args|
        char, index = args
        if /[[:upper:]]/.match(char)
          new_str << '_' unless index.zero?
          new_str << char.downcase
        else
          new_str << char
        end
      end
    end

    # "cost_code" => "costCode"
    def self.camelify(str)
      new_str = ''
      chars = str.to_s.each_char
      loop do
        char = chars.next
        if char == '_'
          new_str << chars.next.upcase
        else
          new_str << char
        end
      end
      new_str
    end
  end
end
