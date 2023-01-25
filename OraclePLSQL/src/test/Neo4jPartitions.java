package test;

import java.util.Arrays;

public class Neo4jPartitions {

    public static void main(String[] args) {
        int alen = 15;
        int blen = alen;
        String[][] arr = new String[alen][blen];
        String[][] T_arr = new String[alen][blen];

        for (String[] row : arr)
            Arrays.fill(row, "No");

        for (int i = 0, j = 0; i < alen && j < blen; i++, j++) {
            arr[i][j] = i + "x" + j;
        }
        int dia_move = 0, dia_diff = 0;


        for (int B_i = 0, B_j = 1; B_i < alen && B_j < blen/2; B_j++) {
            for (int inc_i = B_i, inc_j = B_j; inc_j < blen; inc_i++, inc_j++) {
            //for (int inc_i = B_i, inc_j = B_j; inc_i < inc_j; inc_i++, inc_j++) {
                System.out.println("inc_i " + inc_i + " inc_j " + inc_j);
                for (int mRi = inc_i, mRj = inc_j; mRi < alen && mRj < blen; ) {
                    System.out.println("mRi " + mRi + "; mRj " + mRj);
                    if (arr[mRi][mRj].equals("No")) {
                        arr[mRi][mRj] = mRi + "x" + mRj;
                    }

                    dia_diff = mRj - mRi + 1;
                    mRi = mRi + dia_diff;
                    mRj = mRj + dia_diff;

                }
                dia_move++;
                if (dia_move == dia_diff) {
                    System.out.println("Dia Move: " + dia_move);
                    dia_move = 0; dia_diff = 0;
                    System.out.println("Break inc_i " + inc_i + " inc_j " + inc_j);
                    break;
                }
            }
        }

        //Printing Matrix
        for (int i = 0; i < alen ; i++) {
            for (int j = 0; j < blen ; j++) {
                System.out.print("    " + arr[i][j]);
            }
            System.out.println();
        }

        for (int i = 0; i < alen ; i++) {
            for (int j = i; j < blen ; j++) {
                if (arr[i][j].equals("No")) {
                    System.out.print("   " + i + "@" + j);
                }
                else
                    System.out.print("    " + arr[i][j]);
            }
            System.out.println();
        }

    }
}
