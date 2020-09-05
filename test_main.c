/*
 * test_main.c
 *
 *  Created on: Mar 17, 2020
 *      Author: natha
 */

#include "msp.h"
#include "G8RTOS.h"
//#include "Threads.h"
#include "BSP.h"
#include "spi.h"
#include "cc3100_usage.h"

uint8_t send_buf[4] = {0xAA,0xAA,0xAA,0xAA};
uint8_t recv_buf[4];
int32_t ret = -1;
uint32_t count = 0;

void main(void)
{
    G8RTOS_Init();

    initCC3100(Host);

    uint32_t ip = getLocalIP();

    //SendData(send, 0x0A000124, 4);

    while(1) {
        SendData(send, 0xC0A801B1, 4);
//        ret = ReceiveData(recv_buf, 4);
//        if (ret == 0) {
//            count++;
//        }
    }
}
