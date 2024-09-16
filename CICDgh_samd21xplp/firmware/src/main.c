/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
 //-------------------------M24_24014DEV4 (START)------------------------------//
 //----------- items to change in 24014DEV4-class -------------------------//
#define LEDINCR   1                             	    //-TODO 1: M24-24014DEV4 LEDblink @ LEDINCR*250ms (=sysTmr wraps @250ms)
char startString[] = "\n\r START w M24_2414DEV4 ...";	//-TODO 2: M24-24014DEV4 string printed at startup
 //-------------------------M24_24014DEV4 (END)------------------------------//

volatile uint32_t myCnt;
volatile uint32_t finalLedCnt;
volatile uint32_t m24_LedFreqIncrCnt;
#define cEchoCnt 10
#define PRESSED   0
#define RELEASED  1
volatile bool sysTickTmrExFlag;

char charArray[3] = {'b','c','d'};
volatile uint32_t char2prntIdx; //- index for 'charArray'
void testEnd(void);


void sysTickTimeout_handler(uintptr_t context)
{
    m24_LedFreqIncrCnt++;
    if ( LEDINCR == m24_LedFreqIncrCnt )
    {
        sysTickTmrExFlag=true;
        m24_LedFreqIncrCnt=0;
    }
}

int main ( void )
{
    /* Initialize all modules, variables,...*/
    SYS_Initialize ( NULL );

    myCnt=0;
	//syntax-error //-SL: intentionally added syntax-error
    finalLedCnt=0;
    sysTickTmrExFlag=false; //-SL: SysTickWrap-event flag
    m24_LedFreqIncrCnt=0;    
     
     //- SW0 defined as GPIOin but still need to call this fct to enable In
    SW0_InputEnable();
    char2prntIdx=0; //- default 2.char-to-print = 'b'

    SYSTICK_TimerStart();
    SYSTICK_TimerCallbackSet(&sysTickTimeout_handler, (uintptr_t) NULL);

    
     //------ start MAIN ------//
    printf("\n\r");
    printf(startString);  //-printf("\n\r START M24_2414DEV ...");
    
    while ( true )
    {
        if(sysTickTmrExFlag)
        {
            sysTickTmrExFlag=false;
            LED_Toggle();
            finalLedCnt++;
        
            myCnt++;
            if(cEchoCnt/2>=myCnt)
            {
                printf("a");
            } else if ((cEchoCnt/2<myCnt) & (cEchoCnt>=myCnt))
            {
                printf("%c",charArray[char2prntIdx]);
                if (cEchoCnt==myCnt)
                    myCnt=0;
            } else
                printf("ERROR1");
        }
        
        if(SW0_Get() == PRESSED)
        {
            testEnd();
        }
    }

    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}

void testEnd(void)
{
    char stopString[] = "\n\r   STOP M24_2414DEV with finalLedCnt=%d\n\r";
    
     //printf("\n\r testEnd with finalLedCnt=%d\n\r",(int)finalLedCnt);
    printf(stopString,(int)finalLedCnt);
    printf("\n\r");
    while(1){}
}
