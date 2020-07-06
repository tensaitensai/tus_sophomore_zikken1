//pipe.c 辰川力駆
#include <unistd.h>

#define NARGV 100

int main()
{
	int fd[2];
	char *argv[NARGV];

	pipe(fd);

	if (fork() == 0)
	{
		close(fd[0]);
		close(STDOUT_FILENO);
		dup(fd[1]);
		close(fd[1]);

		argv[0] = "ls";
		argv[1] = "-l";
		argv[2] = NULL;
		execvp(argv[0], argv);
	}
	else
	{
		close(fd[1]);
		close(STDIN_FILENO);
		dup(fd[0]);
		close(fd[0]);

		argv[0] = "grep";
		argv[1] = "c$";
		argv[2] = NULL;
		execvp(argv[0], argv);
	}

	return 0;
}