//辰川力駆
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
    fork();
    fork();
    printf("process id = %d\n", getpid());

    return 0;
}
