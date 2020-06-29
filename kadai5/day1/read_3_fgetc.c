//read_3_fgetc.c　辰川力駆
#include <stdio.h>
#include <stdlib.h>

void die(const char *s)
{
    perror(s);
    exit(1);
}

void cat(const char *path)
{
    FILE *f = fopen(path, "r");
    if (!f)
        die(path);

    int c;
    while ((c = fgetc(f)) != EOF)
    {
        if (putchar(c) < 0)
            die(path);
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