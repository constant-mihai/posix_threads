/***************************************** 

* File Name : lifecycle.c

* Creation Date : 26-09-2018

* Last Modified :

* Created By : Mihai Constantin constant.mihai@googlemail.com

* License :

******************************************/

/**
 *  Purpose:
 *
 */


#include <pthread.h>
#include "errors.h"

/*
 * Thread start routine.
 */
void *thread_routine (void *arg)
{
    return arg;
}

/**
 * ******************************************************
 * The life of a thread:
 *  - ready
 *    able to run but waiting for a proc.
 *    it may have just started, or just been unblocked,
 *    or preempted by another thread
 *
 *  - running
 *    Pretty much says it all.
 *    
 *  - blocked
 *    Not able to run because it is waiting for something.
 *     - for a condition var,
 *     - to lock a mutex
 *     - for an I/O operation to complete 
 *
 *  - terminated
 *    The thread has terminated by returning from its start
 *    function, calling pthread_exit, or having been cancelled
 *    and completing all cleanup handlers. It was not detached,
 *    and has not yet been joined. Once it is detached or 
 *    joined, it will be recycled.
 * ******************************************************
**/
main (int argc, char *argv[])
{
    pthread_t thread_id;
    void *thread_result;
    int status;

    status = pthread_create ( &thread_id, NULL, thread_routine, NULL);

    if (status != 0) err_abort (status, "Create thread");

    status = pthread_join (thread_id, &thread_result);

    if (status != 0) err_abort (status, "Join thread");
    if (thread_result == NULL) return 0;
    else return 1;
}
