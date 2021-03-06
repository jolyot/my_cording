# encoding: utf-8

# 豆がどのように減って行くかをシュミレーションする
 
puts("黒豆の個数を入力してください")
n = gets.to_i
puts("白豆の個数を入力してください")
m = gets.to_i

# 問題より、1回の試行で必ず差し引き一つの豆が缶から減る
# 白豆が、缶から外に出されるときは、必ず2個一緒であるから、白豆の偶奇で結論が分かれる
# 取り出されるのが白豆二つかどうかで場合分けする
while n + m > 1 do
  p = (m * (m - 1)) / ((n + m) * (n + m - 1)).to_f # 取り出した豆が二つとも白豆だった場合の確率
  if rand < p
    n = n + 1
    m = m - 2
  else
    n = n - 1
  end
end

if n == 1
  puts("最後の一つは黒豆です")
else
  puts("最後の一つは白豆です")
end
