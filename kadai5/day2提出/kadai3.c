//kadai3.c 辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define NBUF 2048 //buf size

void die(const char *s)
{
    perror(s);
    exit(1);
}

int totalcnt = 0; //totalの行数を数える変数
void wc_l(const char *path)
{
    int cnt = 0; //行数を数える変数
    unsigned char buf[NBUF];

    FILE *f = fopen(path, "r");
    if (!f)
        die(path);
    int c;
    while (fgets(buf, NBUF, f) != NULL)
    {
        cnt++; //一行読み込むごとにカウントする
    }
    if (fclose(f))
        die(path);

    printf("%8d %s\n", cnt, path); //ファイル名と行数を出力する
    totalcnt += cnt;               //行数をtotalに足す
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "usage:%s file\n", argv[0]);
        exit(1);
    }
    int i;
    if (argc == 2) //一つのtxtしか読み込まない場合は行数のtotalがいらない
    {
        for (i = 1; i < argc; ++i)
        {
            wc_l(argv[i]);
        }
    }
    else //複数の行数を読み込んだ場合は最後にtotalの行数を出力する。
    {
        for (i = 1; i < argc; ++i)
        {
            wc_l(argv[i]);
        }
        printf("%8d %s\n", totalcnt, "total"); //totalの行数を表示
    }

    return 0;
}