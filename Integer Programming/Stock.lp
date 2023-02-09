/* Objective function */
max: 4000S1+ 6500S2+ 5900S3+5400H1+ 5150H2+ 10000H3+ 8400C1+ 6250C2;


/* Constraints */
Invest_Fund: 40S1+ 50S2+ 80S3+ 60H1+ 45H2+ 60H3+ 30C1+ 25C2 <= 2500;
Software_Firms: 40S1+ 50S2+ 80S3 <= 1000;
Hardware_Firms: 60H1+ 45H2+ 60H3 <= 1000;
Consultancy: 30C1+ 25C2 <= 1000;
S1: 40S1>=100;
S2: 50S2>=100;
S3: 80S3>=100;
H1: 60H1>=100;
H2: 45H2>=100;
H3: 60H3>=100;
C1: 30C1>=100;
C2: 25C2>=100;

