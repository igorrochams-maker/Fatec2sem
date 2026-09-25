
public class ListaDuplamenteLigada {
    //Atributos
    private NoDuplo primeiroNo;
    private NoDuplo ultimoNo;
    private int qtdNo;
    
    public void adicionar(Object info){
        //Adiciona um novo nó no final da lista
    }
    public void adicionar (Object info, int indice){
        //Adiciona um novo nó na posição definida por índice
    }
    public void remover(int indice){
        //remove o nó correspondente ao índice
    }
    private NoDuplo getNo(int indice){
        //Retorna o nó corresponte ao índice
        return new NoDuplo("a");
    }
    public Object getInfo(int indice){
        //Retorna a informação do nó corresponte ao índice
        return "";
    }
    public void setInfo(int indice, Object info){
        //Altera o valor de info do nó correspondente
    }
    private NoDuplo percorrerLista(int indice){
        /*Percorrer a lista do inicio para o fim,
          até atingir a posição definida por ínidce,
          retornando o Nó correspondente.*/
        return null;
    }
    public int tamanho(){
        return qtdNo;
    }
}
