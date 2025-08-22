import 'dart:io';
import 'dart:math';

// 0 - pedra
// 1 - papel
// 2 - tesoura
// 3 - sair

enum OPCAO {pedra, papel, tesoura, sair}

// Função para exibir os resultados
void exibe(String texto) {
  print(texto);
}

// Entrada de Dados
int pegaOpcaoUsuario(){
  // String? ou uma String ou um valor nulo
  return int.parse(stdin.readLineSync()!);
}

// Verificar se a opção digitada pelo usuário é válida
bool opcaoEhValida(int opcao){
  return opcao >= 1 && opcao <= 4;
}

// Mapeamento da escolha do usuario/computador
OPCAO mapeiaOpcao(int opcao) {
  return OPCAO.values[opcao-1];
}

// Decidir o Resultado
String decideResultado(OPCAO opcaoUsuario, OPCAO opcaoComputador) {
  // Empate
  if(opcaoUsuario == OPCAO.papel && opcaoComputador == OPCAO.pedra ||
    opcaoUsuario == OPCAO.pedra && opcaoComputador == OPCAO.tesoura ||
    opcaoUsuario == OPCAO.tesoura && opcaoComputador == OPCAO.papel ){
      return "Você Venceu!!";
    }
    return "Computador Venceu!!";
}


void jogo() {
  int opUsuario;
  do {

    // exibir o menu
    // capturar a opção do usuario
      do{
          exibe("1-Pedra\n2-Papel\n3-Tesoura\n4-Sair");
          opUsuario = pegaOpcaoUsuario();
      }while(!opcaoEhValida(opUsuario)); // enquanto opcaoEhValida != verdadeiro

      if(opUsuario != 4){ // se ele escolheu jogar

        // sortear a escolha do computador
        // nextInt(3), gera um valor random entre 0 e 2
        int opComputador = Random().nextInt(3) + 1;

        // mapear as opções do usuario e do computador
        OPCAO opcaoUsuario = mapeiaOpcao(opUsuario);
        OPCAO opcaoComputador = mapeiaOpcao(opComputador);
      

    // se o usuario digitar 4, sair do jogo
    // senão
    // sortear a escolha do computador
   
    // exibir as opções de cada um
    exibe('Você (${opcaoUsuario.name}) vs (${opcaoComputador.name}) Computador');

    // decidir quem venceu, ou se houve empate
    String vencedor = decideResultado(opcaoUsuario, opcaoComputador);

    // exibir o resultado
    exibe(vencedor);
    exibe("*************************************");
    sleep(Duration(seconds:3));
    }
  }while(opUsuario != 4);
}