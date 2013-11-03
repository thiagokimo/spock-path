# Desafio Toystalk

## Problema
O Cão Spock (encontrado no arquivo "spock_walk.png") pode andar em uma sala dividida em áreas como um grid (encontrado no arquivo "grid.jpg"). Ele pode andar em uma direção da cada vez (frente, para trás, direita ou esquerda, ou (x+1, y), (x-1, y), (x, y+1), e (x, y-1) se você preferir). Mas, tem um probleminha.

Ele só pode ir nas áreas onde a soma dos algarismos das coordenadas X e Y são menores ou iguais a 19. O ponto 77,49, por exemplo, não é acessível porque 7+7+4+9=27 é > que 19.

Queremos saber quantos pontos o Cão Spock pode caminhar, se ele começar do 0,0.

##Tecnologias e abordagens utilizadas
O desafio foi solucionado em Ruby, com uma abordagem orientada a testes utilizando a biblioteca **MiniTest**.

##Solução
A heurística utilizada pra resolver o problema é bastante simples. O primeiro passo foi encontrar o maior número que obedece a equação (soma dos algarismos das coordenadas ser menor ou igual a 19) com uma das coordenadas iguais a zero. Fazendo isso, descobri o número 298. Então considerei ele o maior valor de coordenada acessível a partir do ponto (0,0).

Para obter todos os pontos, variei os pontos x e y, colocando um deles como 0 e o outro como 298. A variação foi feita subtraindo o valor da coordenada 298 de 1, e acrescentando 1 na coordenada que iniciou com 0. A variação terminou quando a coordenada que iniciou com 298 ficou com 0 e a coordenada que iniciou com o valor 0 chegou em 298.

Para a contagem dos pontos, retirei 1 ponto ( o ponto (0,0) ), e multipliquei o resultado encontrado por 4, já que calculei apenas os pontos do 1º quadrante. Essa multiplicação seria o mesmo de fazer um espelhamento e rotacionamento da área encontrada no 1º quadrante em torno dos eixos X e Y do plano cartesiano.

##Projeto
Para executar o script que tem a solução do problema, basta executar o comando:

  > `ruby solution.rb`

Para executar os testes do projeto, basta digitar na raiz do projeto o comando:

  > `rake`
