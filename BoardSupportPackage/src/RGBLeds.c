/*
 * RGBLeds.c
 *
 *  Created on: Jan 16, 2020
 *      Author: natha
 */

#include <msp.h>
#include "RGBLeds.h"

void init_RGBLEDS()
{
    uint16_t UNIT_OFF = 0x0000;

    UCB2CTLW0 |= UCSWRST;

    UCB2CTLW0 |= (UCMST + UCMODE_3 + UCSYNC + UCSSEL__SMCLK + UCTR); /* master, I2c, sync, SMCLK, tx */

    UCB2BRW = 30;

    /* 3.6 UCB2_SDA, 3.7 UCB2_SCL */
    P3SEL0 |= (BIT6 + BIT7);
    P3SEL1 &= (BIT6 + BIT7);

    UCB2CTLW0 &= ~UCSWRST;

    LP3943_LedModeSet(RED, UNIT_OFF);
    LP3943_LedModeSet(GREEN, UNIT_OFF);
    LP3943_LedModeSet(BLUE, UNIT_OFF);
}

void LP3943_LedModeSet(uint32_t unit, uint16_t LED_DATA)
{
    uint32_t data_buf = 0;
    uint16_t tmp;

    int i;
    for (i = 0; i < 16; i++)
    {
        tmp = (LED_DATA >> i) & 0x01;
        data_buf >>= 2;
        data_buf &= 0x3FFFFFFF;
        if (tmp == 1)
        {
            data_buf |= 0x40000000;
        }
    }

    uint8_t *ptr = (uint8_t*)&data_buf;

    UCB2IFG = 0;

    UCB2I2CSA = (0x60 + unit);

    while (UCB2STATW & UCBBUSY);

    UCB2CTLW0 |= UCTXSTT;

    while ((UCB2IFG & UCTXIFG0) == 0);

    if (UCB2IFG & UCNACKIFG)
    {
        while(1);
    }

    UCB2TXBUF = 0x16;

    for (i = 0; i<4; i++)
    {
        while ((UCB2IFG & UCTXIFG0) == 0);
        UCB2TXBUF = ptr[i];
    }

    while ((UCB2IFG & UCTXIFG0) == 0);
    UCB2CTLW0 |= UCTXSTP;

    // wait til stop bit clears before leaving
    while ((UCB2CTLW0 & UCTXSTP) != 0);
}
