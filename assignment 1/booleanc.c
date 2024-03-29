#include <stdio.h>

int main(){
    unsigned char F; //output
    unsigned char one = 0x01;//used for displaying the output in bit
    unsigned char  X=0x00,Y=0x01,Z=0x01,W=0x00; //inputs in hex

    //F = (Z & (~W))|(Y & (Z))|((X) & (~Y)) | (X & W);//SOP implementation using AND-OR logic

    F=~((~(Z&~(W)))&(~(Y&Z))&(~(X&~(Y)))&(~(X&(W))));//SOP implementation using NAND logic

    printf("%x%x%x%x",one&X,one&Y,one&Z,one&W);
    printf(" ");
    printf("%x\n" ,one&F);
    return 0;
}
