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
        if (indice < 0 || indice > qtdNo){
            System.out.println("Índice inválido!");
        }
        
        // Reaproveitando função do tail
        if (indice == qtdNo){
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
        //Retorna o nó corresponte ao índice
        return new NoDuplo("a");
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
        
        
        /*int[] vetor = new int[1000];
        
        for(int i=0; i<vetor.length;i++){
            //Gera 1000 valores randomicos
            vetor[i] = (int) (Math.random() * 1000);
            System.out.println(vetor[i] + " ");
        }
        
        int [] vetorOrdenado = Ordenacao.OrdenacaoTrocaCrescente();
        
        for(int i=0;i<vetorOrdenado.length;i++){            
            System.out.print(vetor[i]+" ");
        }
        */
    }
    
}
