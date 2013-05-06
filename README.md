#Introdução

O trabalho se divide em duas partes, descritas a seguir:

1. Estudar e implementar o sistema de controle nebuloso (Mamdani) que foi projetado para o problema guiar o robô pelo mundo virtual
2. Realizar testes de desempenho do sistema
3. Propor e testar melhorias para o sistema. Este tópico é opcional.

As melhorias podem ser de qualquer tipo, por exemplo: 

- Modificação nas regras
- Novas formas de dividir o universo de discurso das variáveis etc.

*Importante:* Deve ser possível acompanhar o robô navegando pelo método original e o modificado.

O problema que surge naturalmente é como testar o sistema (e as possíveis melhorias). Uma sugestão é medir a taxa de acertos do sistema, onde taxa de acerto é o número de vezes que o sistema conseguiu fazer o robô chegar ao destino esperado.

#Todo
- Condição de parada
- Calcular a distância para o próximo obstáculo observando o campo de visão do robo
- Alterar o passo (diminuir o delta)
- Fazer output dos resultados num txt, xml, etc
