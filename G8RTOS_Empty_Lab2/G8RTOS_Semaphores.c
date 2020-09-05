/*
 * G8RTOS_Semaphores.c
 */

/*********************************************** Dependencies and Externs *************************************************************/

#include <stdint.h>
#include "msp.h"
#include "G8RTOS_Structures.h"
#include "G8RTOS_CriticalSection.h"

extern tcb_t * CurrentlyRunningThread;

/*********************************************** Dependencies and Externs *************************************************************/


/*********************************************** Public Functions *********************************************************************/

/*
 * Initializes a semaphore to a given value
 * Param "s": Pointer to semaphore
 * Param "value": Value to initialize semaphore to
 * THIS IS A CRITICAL SECTION
 */
void G8RTOS_InitSemaphore(semaphore_t *s, int32_t value)
{
	/* Implement this */
    uint32_t IBit = StartCriticalSection();

    *s = value;

    EndCriticalSection(IBit);
}

/*
 * Waits for a semaphore to be available (value greater than 0)
 * 	- Decrements semaphore when available
 * 	- Spinlocks to wait for semaphore
 * Param "s": Pointer to semaphore to wait on
 * THIS IS A CRITICAL SECTION
 */
void G8RTOS_WaitSemaphore(semaphore_t *s)
{
	/* Implement this */
    uint32_t IBit = StartCriticalSection();

    (*s)--;

    if ((*s) < 0)
    {
        CurrentlyRunningThread->blocked = s;

        EndCriticalSection(IBit);

        yield();
    }
    else
    {
        EndCriticalSection(IBit);
    }
}

/*
 * Signals the completion of the usage of a semaphore
 * 	- Increments the semaphore value by 1
 * Param "s": Pointer to semaphore to be signalled
 * THIS IS A CRITICAL SECTION
 */
void G8RTOS_SignalSemaphore(semaphore_t *s)
{
	/* Implement this */
    uint32_t IBit = StartCriticalSection();

    (*s)++;

    if ((*s) <= 0)
    {
        tcb_t *pt = CurrentlyRunningThread->next;
        while (pt->blocked != s)
        {
            pt = pt->next;
        }

        pt->blocked = 0;
    }

    EndCriticalSection(IBit);
}

/*********************************************** Public Functions *********************************************************************/


