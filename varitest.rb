begin
  # 例外が発生する可能性のあるコード
result = 10 / 0  # 例: ゼロ除算エラー

#rescue SomeException => e
rescue ZeroDivisionError => e
  # エラー発生時の処理
  puts "エラー: #{e.message}"
end