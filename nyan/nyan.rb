CAT = [ ",------,   ", "|   /\\_/\\", "|__( ^ .^) ", "  \"\"  \"\"    "]

COLORS = (0...(6 * 7)).map do |n|
  pi_3 = Math::PI / 3
  n *= 1.0 / 6
  r  = (3 * Math.sin(n           ) + 3).to_i
  g  = (3 * Math.sin(n + 2 * pi_3) + 3).to_i
  b  = (3 * Math.sin(n + 4 * pi_3) + 3).to_i
  36 * r + 6 * g + b + 16
end

def rainbowify(string)
  string.chars.each_with_index.map{ |c, i| "\e[38;5;#{COLORS[i % COLORS.size]}m#{c}\e[0m" }.join
end

def full_nyan length
  rainbowify(CAT.map{|line| trail(length) + line}.join("\n"))
end

def trail length
  length.times.collect{|i| ['-', '_'][i % 2]}.join
end

i = 0
while(1==1)
  system ("clear")
  puts rainbowify("=" * 10 + "  NON-STOP NYAN CAT  " + "=" * 10)
  puts "\n#{full_nyan i}\n\n      You've Nyaned for: #{(i * 1.0 / 6.0).round(1)} s"
  sleep 1.0 / 6.0
  i += 1
end
