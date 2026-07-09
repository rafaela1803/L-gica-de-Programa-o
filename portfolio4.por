programa

{

	// Importando as 4 bibliotecas exigidas

	inclua biblioteca Util

	inclua biblioteca Matematica --> mat

	inclua biblioteca Texto --> txt

	inclua biblioteca Calendario --> cal

	funcao inicio()

	{

		// Variáveis

		cadeia nome, nomeMaiusculo

		inteiro tamanhoNome, anoNascimento, idade, anoAtual, diaAtual

		inteiro numeroSorte, expoente, numeroMaior

		real raizDaIdade, raizArredondada

		// --- 1. Entrada de dados ---

		escreva("Digite o seu primeiro nome: ")

		leia(nome)

		escreva("Em que ano você nasceu (com 4 dígitos)? ")

		leia(anoNascimento)

		escreva("\n")

		// --- 2. Usando a Biblioteca CALENDÁRIO ---

		// Função 1: ano_atual()

		anoAtual = cal.ano_atual()

		// Função 2: dia_mes_atual()

		diaAtual = cal.dia_mes_atual()

		idade = anoAtual - anoNascimento

		// --- 3. Usando a Biblioteca TEXTO ---

		// Função 1: caixa_alta()

		nomeMaiusculo = txt.caixa_alta(nome)

		// Função 2: numero_caracteres()

		tamanhoNome = txt.numero_caracteres(nome)

		// --- 4. Usando a Biblioteca UTIL ---

		escreva("Processando seus dados no sistema...\n")

		// Função 1: aguarde() -> Pausa de 1,5 segundos para dar efeito

		Util.aguarde(1500) 

		// Função 2: sorteia() -> Gera um número da sorte de 1 a 100

		numeroSorte = Util.sorteia(1, 100)

		// --- 5. Usando a Biblioteca MATEMÁTICA ---

		// Função 1: raiz() -> Calcula a raiz quadrada da idade

		raizDaIdade = mat.raiz(idade, 2.0)

		// Função 2: arredondar() -> Deixa a raiz com apenas 2 casas decimais

		raizArredondada = mat.arredondar(raizDaIdade, 2)

		// --- 6. Exibição dos Resultados (Painel) ---

		escreva("=========================================\n")

		escreva("         PAINEL DE ANÁLISE DO USUÁRIO     \n")

		escreva("=========================================\n")

		escreva("Olá, ", nomeMaiusculo, "!\n")

		escreva("Seu nome tem exatamente ", tamanhoNome, " caracteres.\n")

		escreva("Hoje é dia ", diaAtual, " e você tem ou completará ", idade, " anos em ", anoAtual, ".\n")

		escreva("A raiz quadrada aproximada da sua idade é: ", raizArredondada, "\n")

		escreva("Seu número da sorte gerado para hoje é: ", numeroSorte, "\n")

		escreva("=========================================\n")

	}

}
 