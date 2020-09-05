/*
 * G8RTOS_IPC.c
 *
 *  Created on: Jan 10, 2017
 *      Author: Daniel Gonzalez
 */
#include <stdint.h>
#include "msp.h"
#include "G8RTOS_IPC.h"
#include "G8RTOS_Semaphores.h"

/*********************************************** Defines ******************************************************************************/

#define FIFOSIZE 16
#define MAX_NUMBER_OF_FIFOS 4

/*********************************************** Defines ******************************************************************************/


/*********************************************** Data Structures Used *****************************************************************/

/*
 * FIFO struct will hold
 *  - buffer
 *  - head
 *  - tail
 *  - lost data
 *  - current size
 *  - mutex
 */

/* Create FIFO struct here */
typedef struct FIFO_t {
    int32_t Buffer[FIFOSIZE];
    int32_t *head;
    int32_t *tail;
    uint32_t lostData;
    semaphore_t CurrentSize;
    semaphore_t Mutex;
} FIFO_t;

/* Array of FIFOS */
static FIFO_t FIFOs[4];

static void advance_head_pointer(FIFO_t * pt)
{
    if (pt->head == &(pt->Buffer[FIFOSIZE-1]))
    {
        pt->head = &(pt->Buffer[0]);
    }
    else
    {
        pt->head++;
    }
}

static void advance_tail_pointer(FIFO_t * pt)
{
    if (pt->tail == &(pt->Buffer[FIFOSIZE-1]))
    {
        pt->tail = &(pt->Buffer[0]);
    }
    else
    {
        pt->tail++;
    }
}

/*********************************************** Data Structures Used *****************************************************************/

/*
 * Initializes FIFO Struct
 */
int G8RTOS_InitFIFO(uint32_t FIFOIndex)
{
    /* Implement this */
    if (FIFOIndex > 3)
    {
        return -1;
    }
    else /* (FIFOIndex <= 3) */
    {
        FIFO_t *pt = &FIFOs[FIFOIndex];
        pt->head = &(pt->Buffer[0]);
        pt->tail = &(pt->Buffer[0]);
        pt->lostData = 0;

        G8RTOS_InitSemaphore(&(pt->CurrentSize), 0);
        G8RTOS_InitSemaphore(&(pt->Mutex), 1);

        return 0;
    }
}

/*
 * Reads FIFO
 *  - Waits until CurrentSize semaphore is greater than zero
 *  - Gets data and increments the head ptr (wraps if necessary)
 * Param: "FIFOChoice": chooses which buffer we want to read from
 * Returns: uint32_t Data from FIFO
 */
uint32_t readFIFO(uint32_t FIFOChoice)
{
    FIFO_t * pt = &FIFOs[FIFOChoice];

    /* wait for CurrentSize > 0 */
    G8RTOS_WaitSemaphore(&(pt->CurrentSize));

    /* acquire Mutex */
    G8RTOS_WaitSemaphore(&(pt->Mutex));

    uint32_t data = *(pt->head);

    advance_head_pointer(pt);

    /* release Mutex */
    G8RTOS_SignalSemaphore(&(pt->Mutex));

    return data;
}

/*
 * Writes to FIFO
 *  Writes data to Tail of the buffer if the buffer is not full
 *  Increments tail (wraps if ncessary)
 *  Param "FIFOChoice": chooses which buffer we want to read from
 *        "Data': Data being put into FIFO
 *  Returns: error code for full buffer if unable to write
 */
int writeFIFO(uint32_t FIFOChoice, uint32_t Data)
{
    int err = 0;
    FIFO_t * pt = &FIFOs[FIFOChoice];

    /* acquire Mutex */
    G8RTOS_WaitSemaphore(&(pt->Mutex));

    /* store data */
    *(pt->tail) = Data;

    if (pt->CurrentSize > FIFOSIZE-1)
    {
        pt->lostData++;
        err = -1;
    }
    else
    {
        G8RTOS_SignalSemaphore(&(pt->CurrentSize));
    }

    advance_tail_pointer(pt);

    /* release Mutex */
    G8RTOS_SignalSemaphore(&(pt->Mutex));

    return err;
}

