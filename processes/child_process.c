#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        return 1;
    } 
    else if (pid == 0) {
        printf("Child process (PID: %d) is running.\n", getpid());
        char *args[] = {"/bin/ls", "-l", NULL};
        if (execv(args[0], args) == -1) {
            perror("Exec failed");
            exit(1);
        }
    } 
    else {
        printf("Parent process (PID: %d) waiting for Child (PID: %d).\n", getpid(), pid);
        int status;
        waitpid(pid, &status, 0);
        printf("Child process finished. Parent exiting.\n");
    }

    return 0;
}
