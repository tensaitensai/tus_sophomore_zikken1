//redirect.c 辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

#define MAX_LINE_IN 1000

int main(int argc, char *argv[])
{
    int fd;

    fd = open("out.txt", O_WRONLY | O_CREAT, 0664);
    close(STDOUT_FILENO);
    dup(fd);

    execlp("cat", "cat", (char *)0);
    return 0;
}