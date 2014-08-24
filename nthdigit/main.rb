# encordig: utf-8

# ファイルから各行を読みとって配列にする
def get_lines(path)
  lines = []
  f = open(path)
  f.each do |line|
    lines << line
  end
  f.close
  return lines
end

# i桁の整数から生成される新しい数列の項のグループをi群として、新しい数列を群数列として捉える
# i群の項数は、{(10のi乗) - (10の(i - 1)乗)} * i である
# 新しい数列のn項目は、第何群の何項目にあたるかを計算する
def compute_position(n)
  if n <= 5
    return 1, n
  else
    s = 5
    i = 2
    loop do
      numbers_of_group_items = 9 * 10 ** (i - 1) * i
      if numbers_of_group_items + s > n
        return i, (n - s)
      else
        s = numbers_of_group_items + s
        i += 1
      end
    end
  end
end

# i群のposition番目はi桁目のt番目の数から生成される
# i群のposition番目、すなわち新しい数列のn番目は、i桁のt番目の数(= number)のどの位の数にあたるかを調べ、その値を返す
def compute_item_of_n(i, position)
  if i == 1
    return 5 + position - 1
  else
    t = (position - 1) / i
    number = 10 ** (i - 1) + t
    r = (position - 1) % i
    return number.to_s[r]
  end
end

get_lines("testdata.in.txt").each do |n|
  i, position = compute_position(n.to_i)
  puts compute_item_of_n(i, position)
end







