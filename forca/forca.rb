require_relative("ui")
require_relative("rank")
def testa_acerto(acertou,pontos,erros,acertos,palavra)
  if acertou
    acertou_chute
    pontos += 100
    acertos = palavra.size
  else
    errou_chute
    pontos -= 30
    erros += 1
  end
  return erros,pontos,acertos
end

def encontrou_letra(total_encontrado,erros,pontos,acertos)
  puts total_encontrado
  if total_encontrado == 0
    palavra_n_encontrada
    erros += 1
    pontos -= 25
  else
    palavra_encontrada(total_encontrado)
    acertos += 1 * total_encontrado
    pontos += 25 
  end
  return erros,pontos,acertos
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

def jogar nome
  palavra = escolher_palavra_secreta
  erros = 0
  chutes = []
  pontos = 0   
  acertos = 0
  
  while erros < 5 and acertos < palavra.size
    mascara = palavra_mascarada(chutes,palavra)
    chute = testa_chute_valido(erros,chutes,mascara)
    chutes << chute
    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      total_encontrado = palavra.count(chute)
      resultado1 = encontrou_letra(total_encontrado,erros,pontos,acertos)
      erros = resultado1[0]
      pontos = resultado1[1] 
      acertos = resultado1[2]
    else
      acertou = chute == palavra
      resultado2 = testa_acerto(acertou,pontos,erros,acertos,palavra)
      erros = resultado2[0]
      pontos = resultado2[1]
      acertos = resultado2[2]
    end
  end
  quantidade_pontos(pontos)
  pontos
end


def iniciar_game
  nome =bem_vindo
  pontos_totais = 0
  avisa_campeao_atual(le_rank)
  loop do
  pontos_totais += jogar nome  
    avisa_pontos(nome,pontos_totais)
    if pontos_totais > le_rank[1].to_i
      salva_rank(nome,pontos_totais)
    end
    if !continuar_jogo
      break
    end
  end
end
