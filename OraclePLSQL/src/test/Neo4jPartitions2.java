package test;

import java.util.Arrays;

public class Neo4jPartitions2 {
    public static void main(String[] args) {
        int alen = 9;
        int blen = alen;
        int iteration = 0;
        String[][] arr = new String[alen][blen];
        String list[] = new String[300];
        for (String[] row : arr)
            Arrays.fill(row, "No");
        for (int i = 0, j = 0; i < alen && j < blen; i++, j++) {
            arr[i][j] = i + "x" + j;
        }
        int list1 = 0;
        int outer_itr_dia = 0;
        int outer_itr_dia_j = 1;
        for(int inc_i = 0, inc_j = outer_itr_dia_j; inc_i < alen && inc_j < blen; ) {
            int itr_dia = 0, itr_dia1 = 0;
//            System.out.println("inc_i " + inc_i+ "inc_j " + inc_j);
            System.out.println("Iteration: " + iteration++);
            for (int i = inc_i, j = inc_j; i < alen && j < blen; ) {
                if (arr[i][j].equals("No")) {
                    System.out.println("I: " + i + "x" + j);
                    arr[i][j] = i + "x" + j;
                    list[list1++] = "x";
//                    System.out.println(list[list1++] + "list[list1++]" + list1);
                }
                itr_dia++;
                itr_dia1 = j-i;
//                System.out.println("itr_dia " + itr_dia);
//                System.out.println("j-i " + (j-i));
                if((j-i) == itr_dia) {
//                    System.out.println("qwerty");
                    i = i+itr_dia+1;
                    j = j+itr_dia+1;
                    itr_dia = 0;
                }
                else{
//                    System.out.println("There");
                    i++;
                    j++;
                }
            }
            outer_itr_dia++;
//            System.out.println("outer_itr_dia " + outer_itr_dia);
//            System.out.println("itr_dia1 " + itr_dia1);

            if(outer_itr_dia == 2) {
//                System.out.println("Hello");
                inc_i = 0;
                outer_itr_dia = 0;
                inc_j = ++outer_itr_dia_j;

            }
            else {
//                System.out.println("HI");
                inc_i = inc_i + itr_dia1;
                inc_j = inc_j + itr_dia1;

            }
            list[list1++] = "Delimiter";

        }

        for(int out_j = (blen/2)+1; out_j < blen; out_j++) {
            System.out.println("Iteration: " + iteration++);
            for (int i = 0, j = out_j; i < alen && j < blen; i++, j++) {
                if (arr[i][j].equals("No")) {
                    System.out.println( "I: " + i + "x" + j);
                    arr[i][j] = i + "x" + j;
                    list[list1++] = i + "x" + j;
                }
            }
            list[list1++] = "Delimiter";
        }

        //Printing Matrix
        for (int i = 0; i < alen ; i++) {
            for (int j = 0; j < blen ; j++) {
                System.out.print("    " + arr[i][j]);
            }
            System.out.println();
        }

//        for (int i = 0; i < alen ; i++) {
//            for (int j = i; j < blen ; j++) {
//                if (arr[i][j].equals("No")) {
//                    System.out.print("   " + i + "@" + j);
//                }
//                else
//                    System.out.print("    " + arr[i][j]);
//            }
//            System.out.println();
//        }

//        for (int i = 0; i < list.length; i++ ) {
//            if(list[i] == "Delimiter")
//                System.out.println();
//            else
//                System.out.print(list[i] + " ");
//        }
        //Printing Matrix
        for (int i = 0; i < alen ; i++) {
            for (int j = 0; j < blen ; j++) {
                System.out.print("    " + i+"x"+j);
            }
            System.out.println();
        }
    }
}
