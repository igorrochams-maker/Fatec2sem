/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package listaduplamenteencadeada;

/**
 *
 * @author Alunos
 */
public class ListaDuplamenteEncadeada {

    //Atributos
    private NoDuplo primeiroNo;
    private NoDuplo ultimoNo;
    private int qtdNo;
    
    public void adicionar(Object info){
        //Adiciona um novo nó no final da lista
        NoDuplo novoNo = new NoDuplo(info);
       
        if (qtdNo == 00) {
            primeiroNo = novoNo;
            ultimoNo = novoNo;
        } else {
            ultimoNo.proximo = novoNo; // tail atual aponta para o novo Nó
            novoNo.anterior = ultimoNo; // o novo Nó aponta para o antigo Tail  
            ultimoNo = novoNo; // novo nó oficialmente se torna o tail
        }
        qtdNo++;
    }
    public void adicionar (Object info, int indice){
        //Adiciona um novo nó na posição definida por índice
        
        // Validando índice
        if (indice < 0 || indice > qtdNo) {
            System.out.println("Índice inválido!");
            return;
        }

        // Adicionando no final
        if (indice == qtdNo) {
            adicionar(info);
            return;
        }
        
        NoDuplo novoNo = new NoDuplo(info);
        
        if (indice == 0) {
            novoNo.proximo = primeiroNo;
            primeiroNo.anterior = novoNo;
            primeiroNo = novoNo;
        } else {
            NoDuplo noAtual = getNo(indice);
            NoDuplo noAnterior = noAtual.anterior;
            
            novoNo.proximo = noAtual;
            novoNo.anterior = noAnterior;
            
            noAnterior.proximo = novoNo;
            noAtual.anterior = novoNo;
        }
        
        qtdNo++;
    }   
    
    public void remover(int indice){
        //remove o nó correspondente ao índice
        // Validando índice
        if (indice < 0 || indice > qtdNo){
            System.out.println("Índice inválido!");
            return;
        }
        
        NoDuplo noRemover = getNo(indice);
        
        if(indice == 0){
            primeiroNo = noRemover.proximo;
            if (primeiroNo != null){
                primeiroNo.anterior = null;
            } else {
                ultimoNo = null;
            }
        } else if (indice == qtdNo -1){
            ultimoNo = noRemover.anterior;
            ultimoNo.proximo = null;
        } else {
            NoDuplo noAnterior = noRemover.anterior;
            NoDuplo noProximo = noRemover.proximo;
            
            noProximo.anterior = noAnterior;
            noAnterior.proximo = noProximo;
        }
        
        noRemover.proximo = null;
        noRemover.anterior = null;
        
        qtdNo--;
    }
    private NoDuplo getNo(int indice){
        return percorrerLista(indice);
    }
    public Object getInfo(int indice){
        //Retorna a informação do nó corresponte ao índice
        NoDuplo noEncontrado = getNo(indice);
        
        return noEncontrado.info;
    }
    public void setInfo(int indice, Object info){
        //Altera o valor de info do nó correspondente
        NoDuplo noAtual = getNo(indice);
        noAtual.info = info;
    }
    private NoDuplo percorrerLista(int indice){
        /*Percorrer a lista do inicio para o fim,
          até atingir a posição definida por ínidce,
          retornando o Nó correspondente.*/
        if (indice < 0 || indice > qtdNo){
            System.out.println("Índice inválido!");
        }
        
        NoDuplo noAtual = primeiroNo;
        // Pula de nó em nó até chegar no índice desejado
        for (int i = 0; i < indice; i++) {
            noAtual = noAtual.proximo;
        }
        return noAtual;
    }
    public int tamanho(){
        return qtdNo;
    }
    public static void main(String[] args) {
        ListaDuplamenteEncadeada lista = new ListaDuplamenteEncadeada();

        // Adicionando elementos no final da lista
        lista.adicionar("João");
        lista.adicionar("Maria");
        lista.adicionar("Pedro");

        System.out.println("Tamanho da lista: " + lista.tamanho());

        // Mostrando os elementos
        System.out.println("Elemento índice 0: " + lista.getInfo(0));
        System.out.println("Elemento índice 1: " + lista.getInfo(1));
        System.out.println("Elemento índice 2: " + lista.getInfo(2));

        // Adicionando elemento em uma posição específica
        lista.adicionar("Carlos", 1);

        System.out.println("\nDepois de adicionar Carlos no índice 1:");

        for (int i = 0; i < lista.tamanho(); i++) {
            System.out.println("Índice " + i + ": " + lista.getInfo(i));
        }

        // Alterando um elemento
        lista.setInfo(2, "José");

        System.out.println("\nDepois de alterar o índice 2:");

        for (int i = 0; i < lista.tamanho(); i++) {
            System.out.println("Índice " + i + ": " + lista.getInfo(i));
        }

        // Removendo um elemento
        lista.remover(1);

        System.out.println("\nDepois de remover o índice 1:");

        for (int i = 0; i < lista.tamanho(); i++) {
            System.out.println("Índice " + i + ": " + lista.getInfo(i));
        }

        System.out.println("\nTamanho final: " + lista.tamanho());
       
    }
    
}
