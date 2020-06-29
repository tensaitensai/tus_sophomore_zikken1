//辰川力駆
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
    pid_t pid;
    pid = fork();

    if (pid)
        printf("Hello!!\n");

    return 0;
}
