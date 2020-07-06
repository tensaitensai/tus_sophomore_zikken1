//kadai4.c 辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

#define MAX_LINE_IN 1000
#define MAX_ARGS 30

void redirect(char *args[], int potnt); //リダイレクトする関数

int main(int argc, char *argv[])
{
    int pid, status;
    char line_in[MAX_LINE_IN];
    char *args[MAX_ARGS];
    int nargs;

    //tokenize
    for (;;)
    {
        printf("> ");
        if (fgets(line_in, MAX_LINE_IN, stdin) == NULL)
            exit(0);
        line_in[strlen(line_in) - 1] = '\0';

        char *token = strtok(line_in, " ");
        nargs = 0;
        args[nargs++] = token;
        while (token != NULL)
        {
            if (token != NULL)
            {
                token = strtok(NULL, " ");
                args[nargs++] = token;
            }
        }
        args[nargs] = '\0';

        if (strcmp(args[0], "exit") == 0)
        {
            return 0;
        }

        if (fork() == 0)
        {
            int i;
            for (i = 0; args[i] != NULL; i++)
            {
                if (strcmp(args[i], ">") == 0) //出力先を切り替えるリダイレクトが存在すればそこに出力
                {
                    redirect(args, i); //リダイレクトする関数
                }
            }
            execvp(args[0], args);
            printf("command not found\n");
            exit(1);
        }
        else
        {
            wait(&status);
        }
    }

    return 0;
}

void redirect(char *args[], int point) //リダイレクトする関数
{
    int fd;

    args[point] = '\0'; //">"があった場所を終端文字にする
    fd = open(args[point + 1], O_WRONLY | O_CREAT, 0664);
    close(STDOUT_FILENO);
    dup(fd);
    execvp(args[0], args);
}