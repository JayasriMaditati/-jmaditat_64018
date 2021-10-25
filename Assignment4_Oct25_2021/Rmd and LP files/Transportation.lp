Min: 622 XA1 + 614 XA2 + 630 XA3 + 641 XB1 + 645 XB2 + 649 XB3;

/* Constraints */

/* Supply */
Plant_A : XA1 + XA2 + XA3 <= 100;
Plant_B : XB1 + XB2 + XB3 <= 120;


/* Demand */
WareHouse_1: XA1 + XB1 = 80;
WareHouse_2: XA2 + XB2 = 60;
WareHouse_3: XA3 + XB3 = 70;