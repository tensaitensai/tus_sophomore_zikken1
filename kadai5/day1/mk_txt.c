#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  if(argc != 2){
    printf("Usage: ./mk_txt #[byte]");
    exit(1);
  }

  FILE *fp;
  char fname[256];
  int nbyte = atoi(argv[1]);

  sprintf(fname, "sample_%d.txt",nbyte);
  fp = fopen(fname,"w");
  if(fp == NULL){
    printf("File open error\n");
    return -1;
  }

  for(int i=1; i < (nbyte+1); i++){
    if(i%10 == 0) fputs("\n", fp);
    else fputs("a", fp);
  }

  fclose( fp );
}
