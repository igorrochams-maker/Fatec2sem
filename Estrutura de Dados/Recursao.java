/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package recursao;

/**
 *
 * @author Alunos
 */
public class Recursao {    
    
    public static int Potencia(int base ,int exp){
        int aux = base;
        if (exp == 0){
            return aux * aux;
        } else {
            return aux * Potencia(base, exp-1);
        }
    }
    
    public static int DecimalBin (double d ){
        if (d <= 1){
            return d;
        } else {
            double aux = d / 2;
            return DecimalBin(aux);
        }
    }
    
    
    public static void main(String[] args) {
        // TODO code application logic here
        int base = 2;
        int exp = 3;

        
        System.out.println("Potencia de "+ base + " elevado a " + exp + " é igual a: " + Potencia(base,exp));
        
        
    }
    
}
