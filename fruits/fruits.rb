# encoding:utf-8

# ファイルから各行を読み取って配列にする
def get_lines(path)
  lines = []
  f = open(path)
  f.each do |line|
    lines << line
  end
  f.close
  return lines
end


# dataという文字列の中に含まれる果物(apple, strawberry, melon)の数を調べる
def compute_num_fruits(data)
  return data.scan(/apple|strawberry|melon/).size
end

# 区切り文字内にあるフルーツの個数の最大値を求める
def compute_max_num_fruits_in_separator(log)
  # 題意から、区切り文字の対応は、ある開き括弧から次に現れるとじ括弧であるから、[^\}]*という正規表現を使用した
  separator_expressions = [/(\{[^\}]*\})/, /(\[[^\]]*\])/, /(\([^\)]*\))/]
  max_num_fruits = 0
  separator_expressions.each do |expression|
    if expression =~ log
      num_fruits = compute_num_fruits($1)
      if num_fruits > max_num_fruits
        max_num_fruits = num_fruits
      end
    end
  end
  return max_num_fruits
end

logs = get_lines("fruits.log")
logs.each do |log|
  puts compute_max_num_fruits_in_separator(log)
end
