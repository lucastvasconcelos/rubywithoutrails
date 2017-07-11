def boas_vindas
  puts "Seja bem-vindo(a) ao jogo da adivinhação"
  puts "Qual seu nome?: "
  name = gets
  for i in 1..3
    puts "\n"
  end
  name
end

def sorteia_numero_secreto
  puts "Escolhendo numero secreto..."
  numero = 175
  puts "Escolhido... que tal tentar adivinhar agora?"
  numero
end

def pede_um_numero(tentativa,limite_tentativa)
    puts 'tentativa ' + tentativa.to_s + " de " + limite_tentativa.to_s
    puts "Adivinhe o número: "
    chute = gets
    chute = chute.to_i
end

def verifica_se_acertou(numero,chute)
  if numero == chute
    puts "você acertou!"
    return true
  else
    puts "você errou!"
    return false
  end
end
name = boas_vindas
numero = sorteia_numero_secreto

limite_tentativa = 3
for tentativa in 1..3
  chute = pede_um_numero(tentativa,limite_tentativa)
  if verifica_se_acertou(numero,chute)
    break
  end
end
