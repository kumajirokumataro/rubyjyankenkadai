# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
    
    def hand
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets 
      while true
        if input_hand.include?("0")|| input_hand.include?("1") || input_hand.include?("2") 
            return input_hand.to_i
        else
            puts "数字を入力してください。"
            puts "0:グー, 1:チョキ, 2:パー"
            input_hand = gets
        end
      end
    end
end

# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
    def hand
       rand(3) 
      # グー、チョキ、パーの値をランダムに取得する。
    end
end

  # プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
  class Janken
    def pon(player_hand, enemy_hand)
      janken = ["グー", "チョキ", "パー"]
      puts "相手の手は#{janken[enemy_hand]}です。"
      if player_hand == enemy_hand # Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
        puts "あいこ"
        true
        #「true」を返してじゃんけんを繰り返し実行させます。
        # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
      elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        puts "あなたの勝ちです"
        false
        #もしも下記の組み合わせだった場合
        # (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        #「あなたの勝ちです」を出力します。
        #「false」を返してじゃんけんを終了させます。
      else
        puts "あなたの負けです"
        false 
        #「あなたの負けです」を出力します。
        #「false」を返してじゃんけんを終了させます。
      end
    end
  end
  # じゃんけんゲームを実行するロジックを書きます。
  class GameStart
    # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
    def self.jankenpon
      # 変数「player」にPlayerをインスタンス化したものを代入します。
      player = Player.new
      # 変数「enemy」にEnemyをインスタンス化したものを代入します。
      enemy = Enemy.new
      # 変数「janken」にJankenをインスタンス化したものを代入します。
      janken = Janken.new
      # 変数「next_game」に「true」を代入しましょう。
      # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
      next_game = true
      while next_game
        # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
        #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        next_game = janken.pon(player.hand, enemy.hand)
      end
    end
  end
  # クラス名を使ってjankenponメソッドを呼び出します。
  GameStart.jankenpon
