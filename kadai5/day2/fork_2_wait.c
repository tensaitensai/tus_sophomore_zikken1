//fork_2_wait.c 辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    pid = fork();
    printf("%d", pid);
    if (pid)
    {
        printf("parent process id = %d: Hello\n", getpid());
        int status;
        wait(&status);
        printf("parent finish\n");
    }
    else
    {
        printf("child process id = %d:parent pid = %d\n", getpid(), getppid());
        sleep(10);
        printf("child finish\n");
    }
}