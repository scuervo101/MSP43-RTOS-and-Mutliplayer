/*
 * G8RTOS_Structure.h
 *
 *  Created on: Jan 12, 2017
 *      Author: Raz Aloni
 */

#ifndef G8RTOS_STRUCTURES_H_
#define G8RTOS_STRUCTURES_H_

#define MAX_NAME_LENGTH 16

#include "G8RTOS_Semaphores.h"
#include <stdbool.h>

/*********************************************** Data Structure Definitions ***********************************************************/

typedef enum {
    NO_ERROR = 0,
    THREAD_LIMIT_REACHED = -1,
    NO_THREADS_SCHEDULED = -2,
    THREADS_INCORRECTLY_ALIVE = -3,
    THREAD_DOES_NOT_EXIST = -4,
    CANNOT_KILL_LAST_THREAD = -5,
    IRQn_INVALID = -6,
    HWI_PRIORITY_INVALID = -7
} sched_ErrCode_t;

typedef uint32_t threadId_t;

/*
 *  Thread Control Block:
 *      - Every thread has a Thread Control Block
 *      - The Thread Control Block holds information about the Thread Such as the Stack Pointer, Priority Level, and Blocked Status
 *      - For Lab 2 the TCB will only hold the Stack Pointer, next TCB and the previous TCB (for Round Robin Scheduling)
 */

/* Create tcb struct here */
typedef struct tcb_t {
    int32_t * sp;
    struct tcb_t * next;
    struct tcb_t * prev;
    semaphore_t * blocked;
    uint32_t sleepCount;
    bool asleep;
    bool isAlive;
    uint8_t priority;
    char threadName[MAX_NAME_LENGTH];
    threadId_t threadId;
} tcb_t;

/*
 *  Periodic Thread Control Block:
 *      - Holds a function pointer that points to the periodic thread to be executed
 *      - Has a period in us
 *      - Holds Current time
 *      - Contains pointer to the next periodic event - linked list
 */

/* Create periodic thread struct here */
typedef struct ptcb_t {
    void (*handler)(void);
    uint32_t period;
    uint32_t execute_time;
    uint32_t current_time;
    struct ptcb_t * prev;
    struct ptcb_t * next;
} ptcb_t;

/*********************************************** Data Structure Definitions ***********************************************************/


/*********************************************** Public Variables *********************************************************************/

/*********************************************** Public Variables *********************************************************************/




#endif /* G8RTOS_STRUCTURES_H_ */
