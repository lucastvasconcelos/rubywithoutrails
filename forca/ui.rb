def bem_vindo
  puts 'Bem vindo ao jogo da forca'
  puts "Qual seu nome?"
  nome = gets.strip
  puts "\n\n\n\n"
  puts"Vamos começar o jogo para você, #{nome}"
end

def escolher_palavra_secreta
  puts "Escolhendo uma palavra secreta..."
  dicionario = (File.read("dic.txt")).split "\n"
  palavra_secreta = dicionario[rand(9)]
  puts "Palavra secreta com #{palavra_secreta.size} letras ... boa sorte!"
  palavra_secreta
end

def continuar_jogo
  puts "Continuar jogando? (S/N)"
  continuar = gets.strip
  continuar.upcase == 'S'
end

def quantidade_pontos(pontos)
  "Você conseguiu um total de #{pontos}"  
end

def palavra_n_encontrada
  puts "Palavra não encontrada"
end

def acertou_chute
  puts "Você acertou o chutão!!!"
end

def errou_chute
  puts "Você errou o chutão!!!"  
end

def palavra_encontrada(total_encontrado)
  puts "Letra encontrada #{total_encontrado} vez(es)!"  
end

def chutar(erros,chutes,mascara)
  puts "\n\n\n\n"
  puts "A palavra secreta é #{mascara}"
  puts "Você já errou #{erros}"
  puts "Esses são seus chutes #{chutes}"
  puts "Entre com uma letra ou uma palavra"
  chute = gets.strip
  puts "Será que você acertou?"
  chute
end

def chute_efetuado(chute)
  puts "Você já chutou #{chute}"
end
