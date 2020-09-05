/*
 * G8RTOS_Scheduler.c
 */

/*********************************************** Dependencies and Externs *************************************************************/

#include <stdint.h>
#include "msp.h"
#include "BSP.h"
#include "G8RTOS_Scheduler.h"
#include "G8RTOS_CriticalSection.h"

/*
 * G8RTOS_Start exists in asm
 */
extern void G8RTOS_Start();

/* System Core Clock From system_msp432p401r.c */
extern uint32_t SystemCoreClock;

/*
 * Pointer to the currently running Thread Control Block
 */
tcb_t * CurrentlyRunningThread;

/*********************************************** Dependencies and Externs *************************************************************/


/*********************************************** Defines ******************************************************************************/

/* Status Register with the Thumb-bit Set */
#define THUMBBIT 0x01000000

/*********************************************** Defines ******************************************************************************/


/*********************************************** Data Structures Used *****************************************************************/

/* Thread Control Blocks
 *	- An array of thread control blocks to hold pertinent information for each thread
 */
static tcb_t threadControlBlocks[MAX_THREADS];

/* Thread Stacks
 *	- An array of arrays that will act as individual stacks for each thread
 */
static int32_t threadStacks[MAX_THREADS][STACKSIZE];

/* Periodic Event Threads
 * - An array of periodic events to hold pertinent information for each thread
 */
static ptcb_t Pthread[MAXPTHREADS];


/*********************************************** Data Structures Used *****************************************************************/


/*********************************************** Private Variables ********************************************************************/

/*
 * Current Number of Threads currently in the scheduler
 */
static uint32_t NumberOfThreads;

/*
 * Current Number of Periodic Threads currently in the scheduler
 */
static uint32_t NumberOfPthreads;

static uint16_t IDCounter;

/*********************************************** Private Variables ********************************************************************/


/*********************************************** Private Functions ********************************************************************/

/*
 * Initializes the Systick and Systick Interrupt
 * The Systick interrupt will be responsible for starting a context switch between threads
 * Param "numCycles": Number of cycles for each systick interrupt
 */
static void InitSysTick(uint32_t numCycles)
{
    uint32_t speed = ClockSys_GetSysFreq();
    SysTick_Config(speed/1000);   // 48MHz MCLK -> 48,000 cycles -> 1000 Hz
    SysTick_enableInterrupt();
}

/*
 * Chooses the next thread to run.
 * Lab 2 Scheduling Algorithm:
 * 	- Simple Round Robin: Choose the next running thread by selecting the currently running thread's next pointer
 */
void G8RTOS_Scheduler()
{
	/* Implement This */
    tcb_t *pt = CurrentlyRunningThread->next;
    int i = 0;
    uint16_t currentMaxPriority = 256;
    for (i = 0; i < NumberOfThreads; i++)
    {
        if (pt->blocked == 0 && pt->asleep == false)
        {
            if (pt->priority < currentMaxPriority)
            {
                CurrentlyRunningThread = pt;
                currentMaxPriority = pt->priority;
            }
        }
        pt = pt->next;
    }
}

/*
 * SysTick Handler
 * Currently the Systick Handler will only increment the system time
 * and set the PendSV flag to start the scheduler
 *
 * In the future, this function will also be responsible for sleeping threads and periodic threads
 */
void SysTick_Handler()
{
    SystemTime++;

    /* check for periodic events */
    uint16_t i = 0;
    ptcb_t * ppt = &Pthread[0];

    for (i = 0; i < NumberOfPthreads; i++)
    {
        if (ppt->execute_time == SystemTime)
        {
            ppt->handler();
            ppt->execute_time = SystemTime + ppt->period;
        }
        ppt = ppt->next;
    }

    /* wake sleeping threads */
    tcb_t * pt = &threadControlBlocks[0];

    for (i = 0; i < MAX_THREADS; i++)
    {
        if (pt->asleep)
        {
            if (pt->sleepCount <= SystemTime)
            {
                pt->asleep = false;
            }
        }
        pt = pt->next;
    }

    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

/*********************************************** Private Functions ********************************************************************/


/*********************************************** Public Variables *********************************************************************/

/* Holds the current time for the whole System */
uint32_t SystemTime;

/*********************************************** Public Variables *********************************************************************/


/*********************************************** Public Functions *********************************************************************/

/*
 * Sets variables to an initial state (system time and number of threads)
 * Enables board for highest speed clock and disables watchdog
 */
void G8RTOS_Init()
{
	/* Implement this */
    SystemTime = 0;
    NumberOfThreads = 0;
    WDT_A->CTL = WDT_A_CTL_PW | WDT_A_CTL_HOLD;     // stop watchdog timer
    BSP_InitBoard();

    // Relocate vector table to SRAM to use aperiodic events
    uint32_t newVTORTable = 0x20000000;
    memcpy((uint32_t *)newVTORTable, (uint32_t *)SCB->VTOR, 57*4);
    // 57 interrupt vectors to copy
    SCB->VTOR = newVTORTable;
}

/*
 * Starts G8RTOS Scheduler
 * 	- Initializes the Systick
 * 	- Sets Context to first thread
 * Returns: Error Code for starting scheduler. This will only return if the scheduler fails
 */
sched_ErrCode_t G8RTOS_Launch()
{
	/* Implement this */
    tcb_t * pt = &threadControlBlocks[0];
    CurrentlyRunningThread = pt;

    int i = 0;
    for (i = 0; i < NumberOfThreads; i++)
    {
        if (pt->priority < CurrentlyRunningThread->priority)
        {
            CurrentlyRunningThread = pt;
        }
        pt = pt->next;
    }

    InitSysTick(0);

    /* lowest priority */
    NVIC_SetPriority(PendSV_IRQn, OSINT_PRIORITY);
    NVIC_SetPriority(SysTick_IRQn, OSINT_PRIORITY);

    G8RTOS_Start();

    return NO_THREADS_SCHEDULED;
}


/*
 * Adds threads to G8RTOS Scheduler
 * 	- Checks if there are stil available threads to insert to scheduler
 * 	- Initializes the thread control block for the provided thread
 * 	- Initializes the stack for the provided thread to hold a "fake context"
 * 	- Sets stack tcb stack pointer to top of thread stack
 * 	- Sets up the next and previous tcb pointers in a round robin fashion
 * Param "threadToAdd": Void-Void Function to add as preemptable main thread
 * Returns: Error code for adding threads
 */
sched_ErrCode_t G8RTOS_AddThread(void (*threadToAdd)(void), uint8_t priority, char * name)
{
    int32_t IBit_State = StartCriticalSection();

    if (NumberOfThreads >= MAX_THREADS)
    {
        /* no room for the new thread */
        EndCriticalSection(IBit_State);
        return THREAD_LIMIT_REACHED;
    }

    /* find first dead thread */
    int i = 0;
    tcb_t * pt = &threadControlBlocks[i];
    while (pt->isAlive)
    {
        i++;
        if (i >= MAX_THREADS)
        {
            EndCriticalSection(IBit_State);
            return THREADS_INCORRECTLY_ALIVE;
        }
        pt = &threadControlBlocks[i];
    }

    /* reserve this tcb */
    NumberOfThreads++;
    pt->isAlive = 1;

    /* find previous alive thread */
    int j = i;
    tcb_t * prev;
    do
    {
        j--;
        if (j < 0)
        {
            j = MAX_THREADS-1;
        }
        prev = &threadControlBlocks[j];
    }
    while (!(prev->isAlive));

    /* find next alive thread */
    j = i;
    tcb_t * next;
    do
    {
        j++;
        if (j >= MAX_THREADS)
        {
            j = 0;
        }
        next = &threadControlBlocks[j];
    }
    while (!(next->isAlive));

    /* create connections */
    prev->next = pt;
    pt->prev = prev;
    next->prev = pt;
    pt->next = next;

    /* initialize stack */
    pt->sp = (&threadStacks[i][STACKSIZE]);  // plus one?
    *(--pt->sp) = THUMBBIT;                    // psr
    *(--pt->sp) = ((uint32_t)(threadToAdd));   // pc
    *(--pt->sp) = ((uint32_t)(threadToAdd));   // lr
    pt->sp -= 13;

    pt->priority = priority;
    for (i=0;i<sizeof(MAX_NAME_LENGTH);i++)
    {
        pt->threadName[i] = name[i];
    }
    pt->threadId = ((IDCounter++) << 16) | i;
    pt->blocked = 0;
    pt->asleep = 0;

    EndCriticalSection(IBit_State);

    return NO_ERROR;
}


/*
 * Adds periodic threads to G8RTOS Scheduler
 * Function will initialize a periodic event struct to represent event.
 * The struct will be added to a linked list of periodic events
 * Param Pthread To Add: void-void function for P thread handler
 * Param period: period of P thread to add
 * Returns: Error code for adding threads
 */
sched_ErrCode_t G8RTOS_AddPeriodicEvent(void (*PthreadToAdd)(void), uint32_t period)
{
    /* Implement this */
    if (NumberOfPthreads >= MAXPTHREADS)
    {
        /* no room for the pthread */
        return THREAD_LIMIT_REACHED;
    }
    else
    {
        ptcb_t * pt = &Pthread[NumberOfPthreads];
        pt->handler = PthreadToAdd;
        pt->period = period;
        pt->current_time = SystemTime;
        pt->execute_time = pt->current_time + pt->period;

        if (NumberOfPthreads == 0)
        {
            /* the first thread will point to itself */
            pt->prev = pt;
            pt->next = pt;
        }
        else
        {
            /* subsequent threads will readjust pointers */
            Pthread[NumberOfPthreads-1].next = pt;
            pt->prev = &Pthread[NumberOfPthreads-1];

            Pthread[0].prev = pt;
            pt->next = &Pthread[0];
        }

        NumberOfPthreads++;
        return NO_ERROR;
    }
}

sched_ErrCode_t G8RTOS_AddAperiodicEvent(void(*AthreadToAdd)(void), uint8_t priority, IRQn_Type IRQn)
{
    if (IRQn < PSS_IRQn || IRQn > PORT6_IRQn)
    {
        return IRQn_INVALID;
    }

    if (priority > 6)
    {
        return HWI_PRIORITY_INVALID;
    }

    __NVIC_SetVector(IRQn, AthreadToAdd);
    __NVIC_SetPriority(IRQn, priority);
    __NVIC_EnableIRQ(IRQn);

    return NO_ERROR;
}

threadId_t G8RTOS_GetThreadId()
{
    return CurrentlyRunningThread->threadId;
}

sched_ErrCode_t G8RTOS_KillThread(threadId_t threadId)
{
    uint32_t IBit = StartCriticalSection();

    if (NumberOfThreads == 1)
    {
        return CANNOT_KILL_LAST_THREAD;
    }

    int i = 0;
    tcb_t * pt = &threadControlBlocks[i];
    while (pt->threadId != threadId)
    {
        i++;
        if (i >= MAX_THREADS)
        {
            return THREAD_DOES_NOT_EXIST;
        }
        pt = &threadControlBlocks[i];
    }

    pt->isAlive = 0;
    pt->blocked = 0;
    pt->asleep = false;
    pt->sleepCount = 0;
    pt->prev->next = pt->next;
    pt->next->prev = pt->prev;

    if (CurrentlyRunningThread == pt)
    {
        SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }

    NumberOfThreads--;

    EndCriticalSection(IBit);

    return NO_ERROR;
}

sched_ErrCode_t G8RTOS_KillSelf()
{
    uint32_t IBit = StartCriticalSection();

    if (NumberOfThreads == 1)
    {
        return CANNOT_KILL_LAST_THREAD;
    }

    tcb_t * pt = CurrentlyRunningThread;

    pt->isAlive = 0;
    pt->prev->next = pt->next;
    pt->next->prev = pt->prev;

    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;

    NumberOfThreads--;

    EndCriticalSection(IBit);

    return NO_ERROR;
}

/*
 *  Kill all the other threads excluding the currently running thread
 *  - Doesn't do anything if only 1 thread running
 *  - Doesn't need a thread id
 */
sched_ErrCode_t G8RTOS_KillAll()
{
    //Enter critical section
    int32_t priMask = StartCriticalSection();

    //Make sure you have more then just 1 thread, RTOS cannot have no active threads
    if (NumberOfThreads == 1)
        return CANNOT_KILL_LAST_THREAD;

    //Temporary incrementing pointer
    tcb_t * ttcb = CurrentlyRunningThread->next;
    //Go through all threads and set the to not alive
    while(ttcb != CurrentlyRunningThread)
    {
        //Set the thread's alive boolean to false
        ttcb->isAlive = false;
        //Moved to next thread
        ttcb = ttcb->next;
    }

    //We must set our currently running thread next and previous to itself
    CurrentlyRunningThread->next = CurrentlyRunningThread;
    CurrentlyRunningThread->prev = CurrentlyRunningThread;

    //Set Number of threads to 1
    NumberOfThreads = 1;
    //Exit critical section
    EndCriticalSection(priMask);

    return NO_ERROR;
}

/*
 * Puts the current thread into a sleep state.
 *  param durationMS: Duration of sleep time in ms
 */
void sleep(uint32_t durationMS)
{
    /* Implement this */
    CurrentlyRunningThread->sleepCount = SystemTime + durationMS;
    CurrentlyRunningThread->asleep = true;
    yield();
}

void yield()
{
    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

/*********************************************** Public Functions *********************************************************************/
