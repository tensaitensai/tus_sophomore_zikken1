//read_2_1byte.c　辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define NBUF 1 //buf size

void die(const char *s)
{
    perror(s);
    exit(1);
}

void cat(const char *path)
{
    ssize_t n;
    unsigned char buf[NBUF];
    int fd = open(path, O_RDONLY);
    if (fd < 0)
        die(path);
    for (;;)
    {
        n = read(fd, buf, NBUF);
        if (n < 0)
            die(path);
        if (n == 0)
            break;
        if (write(STDOUT_FILENO, buf, n) < 0)
            die(path);
    }
    if (close(fd) < 0)
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