//辰川力駆
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
    printf("process id = %d\n", getpid());
    fork();

    return 0;
}
