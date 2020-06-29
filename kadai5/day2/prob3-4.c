//辰川力駆
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main()
{
	pid_t pid;
	pid = fork();

	if (pid)
	{
		printf("parent process id = %d \n", getpid());
	}
	else
	{
		printf("child process id = %d  | parent pid = %d\n", getpid(), getppid());
	}
	return 0;
}