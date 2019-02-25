#課題1：player = Player.newの記述の意味
#        「player」という白紙の枠が【「Player」クラスを元に作られたインスタンスである】と取り決め、
# =>     「Player」クラスの持つ変数やメソッドを使用できるようにしている。

#課題2：上記のコードに書かれた大文字のPlayerと小文字のplayerの違い
# =>    大文字は特定の何かを表さない設計図であるクラスだが、小文字はそれを元に作られたインスタンスとして実在する。
# =>    よって後者からのみ、「それが持つ変数やメソッド」を取得,利用することができる。

def hand_word(x)
    
    case x
    when "0" then
        return "グー"  
        
    when "1" 
        return "チョキ"
        
        
    when "2" then
        return "パー"
    
    else
        return "グー,チョキ,パー以外"
        
    end
    
end

class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    
    #入力された手を取得……エラーが出ないよう、文字型で受け取る
    player_hand = gets.chomp.to_s
    #出された手の確認用
    #puts "#{player_hand}:#{hand_word(player_hand)}を出しました。"
    
    return player_hand
    
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理
    #playerの手と同じにするため、文字型で受け取る
    #return "0"#試験用
    return rand(0..2).to_s
    
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    
    if not (player_hand=="0" || player_hand=="1" || player_hand=="2")
        #playerの手が不正な場合は先に抜ける
        puts "0〜2の数字を入力してください。"
        return 0
        
    end
        
    #相手の手を示すようの文字を取得
    player_hand_word = "相手の手は#{hand_word(enemy_hand)}です。"
    
    resule = (player_hand.to_i - enemy_hand.to_i + 3) %3
    case resule
    when 0
        puts player_hand_word + "あいこのため再戦です。"
        return resule
        
    when 1
        puts player_hand_word + "あなたの負けです。"
        return resule
        
        
    when 2
        puts player_hand_word + "あなたの勝ちです。"
        return resule
        
    end
        
    
  end
  
end


player = Player.new
enemy = Enemy.new
janken = Janken.new
    
#じゃんけんをするかしないか判別する変数……初回、及びあいこだったらT
do_janken = true
    
#じゃんけんの決着がつくまでくり返す
while do_janken == true

    do_janken=false
    
    # 下記の記述で、ジャンケンメソッドが起動される
    if janken.pon(player.hand, enemy.hand)==0
        do_janken = true
    end

end
