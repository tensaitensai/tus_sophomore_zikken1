//read_3_fgets.c　辰川力駆
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

void cat(const char *path)
{
    unsigned char buf[NBUF];
    FILE *f = fopen(path, "r");
    if (!f)
        die(path);
    int c;
    while (fgets(buf, NBUF, f) != NULL)
    {
        printf("%s\n", buf);
    }
    if (fclose(f))
        die(path);
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "usage:%s file\n", argv[0]);
        exit(1);
    }
    int i;
    for (i = 1; i < argc; ++i)
    {
        cat(argv[i]);
    }

    return 0;
}