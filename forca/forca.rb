require_relative("ui")

def testa_acerto(acertou,pontos,erros)
  if acertou
    acertou_chute
    pontos += 100
  else
    errou_chute
    pontos -= 30
    erros += 1
  end
  return erros,pontos
end

def encontrou_letra(total_encontrado,erros)
  puts total_encontrado
  if total_encontrado == 0
    palavra_n_encontrada
    erros += 1
  else
    palavra_encontrada(total_encontrado)
  end
  erros
end

def testa_chute_valido(erros,chutes,mascara)
  loop do
    chute = chutar(erros,chutes,mascara)
      if chutes.include? chute
        chute_efetuado(chute)
      else
        return chute
      end
  end
end

def palavra_mascarada(chutes,palavra_secreta)
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include? letra
      mascara << letra
    else
      mascara << '_'
    end
  end
  mascara
end

def jogar
  palavra = escolher_palavra_secreta
  erros = 0
  chutes = []
  pontos = 0

  while erros < 5
    mascara = palavra_mascarada(chutes,palavra)
    chute = testa_chute_valido(erros,chutes,mascara)
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      total_encontrado = palavra.count(chute)
      erros = encontrou_letra(total_encontrado,erros)
    else
      acertou = chute == palavra
      resultado = testa_acerto(acertou,pontos,erros)[0]
      erros = resultado[0]
      pontos = resultado[1]

    end

  end
  quantidade_pontos(pontos)
end

def iniciar_game
  bem_vindo
  loop do
    jogar
    if !continuar_jogo
      break
    end
  end
end
