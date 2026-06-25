programa
{
inclua biblioteca Util --> u
funcao inicio()
{
// --- VARIÁVEIS DE STATUS (Requisito Técnico 1) ---
inteiro vidaJogador = 100
inteiro energiaJogador = 60
inteiro vidaMonstro = 120
// --- SISTEMA DE ITENS (Requisito: Pelo menos 4 itens diferentes) ---
inteiro pocaoCura = 2      // Item 1: Recupera Vida
inteiro elixirEnergia = 2   // Item 2: Recupera Energia
inteiro bombaFumaca = 1     // Item 3: Diminui a vida do monstro (Dano fixo)
inteiro amuletoForca = 1    // Item 4: Ataque devastador que consome o item
inteiro opcaoMenu, opcaoItem
inteiro rodada = 1
logico jogoAtivo = verdadeiro
escreva("====================================================\n")
escreva("      DESAFIO NA CAVERNA DO MONSTRO LENDÁRIO       \n")
escreva("====================================================\n")
escreva("Entraste na caverna escura e um terrível Dragão acordou!\n")
escreva("Prepara-te para a batalha pela sobrevivência...\n\n")
u.aguarde(2000)
// --- LAÇO DE REPETIÇÃO DO JOGO (Requisito Técnico 2) ---
enquanto(jogoAtivo)
{
escreva("\n----------------------------------------------------\n")
escreva("RODADA ", rodada, "\n")
escreva("----------------------------------------------------\n")
// 1. Mostrar a situação atual (Requisito Mecânica 1)
escreva("[Sua Vida: ", vidaJogador, " / 100]  |  [Sua Energia: ", energiaJogador, " / 60]\n")
escreva("[Vida do Monstro: ", vidaMonstro, " / 120]\n\n")
// 2. Oferecer menu com pelo menos 3 opções de ação (Requisito Mecânica 2)
escreva("Escolha a sua ação:\n")
escreva("1) Ação Agressiva (Ataque Espada) - Custo: 10 Energia. Alto impacto.\n")
escreva("2) Ação Defensiva (Meditar/Defender) - Recupera 20 de Energia.\n")
escreva("3) Abrir a Mochila de Itens\n")
escreva("Sua escolha: ")
leia(opcaoMenu)
escreva("\n")
// --- PROCESSAR AS ESCOLHAS (Requisito Técnico 3) ---
se (opcaoMenu == 1)
{
// Ação Agressiva
se (energiaJogador >= 10)
{
energiaJogador = energiaJogador - 10
inteiro danoCausado = u.sorteia(15, 25)
vidaMonstro = vidaMonstro - danoCausado
escreva("Brandiste a tua espada e desferiste um golpe crítico!\n")
escreva("Causaste ", danoCausado, " de dano ao Monstro.\n")
}
senao
{
escreva("Não tens energia suficiente para atacar! Perdeste a oportunidade.\n")
}
}
senao se (opcaoMenu == 2)
{
// Ação Defensiva
energiaJogador = energiaJogador + 20
se (energiaJogador > 60)
{
energiaJogador = 60
}
vidaJogador = vidaJogador + 5 // Pequena cura por se defender
se (vidaJogador > 100)
{
vidaJogador = 100
}
escreva("Entraste em postura defensiva e concentraste a tua energia.\n")
escreva("Recuperaste energia e preparaste-te para o impacto.\n")
}
senao se (opcaoMenu == 3)
{
// Submenu de Itens
escreva("=== MOCHILA DE ITENS ===\n")
escreva("1) Poção de Cura (Qtd: ", pocaoCura, ") -> Recupera 40 de Vida\n")
escreva("2) Elixir de Energia (Qtd: ", elixirEnergia, ") -> Recupera 30 de Energia\n")
escreva("3) Bomba de Fumaça (Qtd: ", bombaFumaca, ") -> Atordoa e causa 20 de dano fixo\n")
escreva("4) Amuleto de Força (Qtd: ", amuletoForca, ") -> Liberta magia antiga (35 de dano)\n")
escreva("Escolha o item para usar (ou 0 para voltar): ")
leia(opcaoItem)
escreva("\n")
se (opcaoItem == 1)
{
se (pocaoCura > 0)
{
pocaoCura = pocaoCura - 1
vidaJogador = vidaJogador + 40
se (vidaJogador > 100) { vidaJogador = 100 }
escreva("Bebeste a Poção de Cura! Recuperaste 40 de vida.\n")
}
senao
{
escreva("Aviso: Esse item esgotou! Escolhe outra ação na próxima.\n")
}
}
senao se (opcaoItem == 2)
{
se (elixirEnergia > 0)
{
elixirEnergia = elixirEnergia - 1
energiaJogador = energiaJogador + 30
se (energiaJogador > 60) { energiaJogador = 60 }
escreva("Bebeste o Elixir! Recuperaste 30 de energia.\n")
}
senao
{
escreva("Aviso: Esse item esgotou! Escolhe outra ação na próxima.\n")
}
}
senao se (opcaoItem == 3)
{
se (bombaFumaca > 0)
{
bombaFumaca = bombaFumaca - 1
vidaMonstro = vidaMonstro - 20
escreva("Atiraste a Bomba de Fumaça! O monstro ficou confuso e perdeu 20 de vida.\n")
}
senao
{
escreva("Aviso: Esse item esgotou! Escolhe outra ação na próxima.\n")
}
}
senao se (opcaoItem == 4)
{
se (amuletoForca > 0)
{
amuletoForca = amuletoForca - 1
vidaMonstro = vidaMonstro - 35
escreva("O Amuleto brilhou intensamente! Um raio atingiu o monstro causando 35 de dano.\n")
}
senao
{
escreva("Aviso: Esse item esgotou! Escolhe outra ação na próxima.\n")
}
}
senao
{
escreva("Decidiste não usar nenhum item nesta rodada.\n")
}
}
senao
{
escreva("Opção inválida! Atrapalhaste-te nos controlos e perdeste a vez.\n")
}
// --- TURNO DO MONSTRO (Se ele ainda estiver vivo) ---
se (vidaMonstro > 0)
{
u.aguarde(1500)
inteiro danoMonstro = u.sorteia(10, 22)
// Se o jogador defendeu, reduz o dano do monstro pela metade
se (opcaoMenu == 2)
{
danoMonstro = danoMonstro / 2
escreva("\nO Monstro atacou com as suas garras, mas a tua defesa mitigou o impacto!\n")
}
senao
{
escreva("\nO Monstro contra-atacou violentamente!\n")
}
vidaJogador = vidaJogador - danoMonstro
escreva("Sofreste ", danoMonstro, " de dano.\n")
}
// --- VERIFICAÇÃO DAS CONDIÇÕES DE VITÓRIA/DERROTA ---
se (vidaMonstro <= 0 ou vidaJogador <= 0)
{
jogoAtivo = falso
}
rodada = rodada + 1
u.aguarde(2000)
}
// --- TELA FINAL: VITÓRIA OU GAME OVER (Requisito Condicional pós-laço) ---
escreva("\n====================================================\n")
escreva("                  FIM DE JOGO                       \n")
escreva("====================================================\n")
se (vidaMonstro <= 0 e vidaJogador > 0)
{
escreva("MENSAGEM ÉPICA DE VITÓRIA:\n")
escreva("Com um último golpe certeiro, o Monstro Lendário ruiu ao chão, fazendo a terra tremer.\n")
escreva("A caverna agora está segura e o tesouro ancestral pertence-te! Parabéns, Herói!\n")
}
senao
{
escreva("TELA DE GAME OVER:\n")
escreva("As tuas forças esgotaram-se e caíste perante o poder devastador do monstro.\n")
escreva("Explicação: A tua vida chegou a 0. A caverna tornou-se o teu túmulo eterno...\n")
}
escreva("====================================================\n")
}
}
