//fork_2.c　辰川力駆
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
    fork();
    printf("process id = %d\n", getpid());

    return 0;
}
