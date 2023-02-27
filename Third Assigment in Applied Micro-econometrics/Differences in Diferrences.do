clear all
cd "C:\metaptyxiako\mikrooikonomikh\ergasia9"
import delimited "public1.txt", clear

/*
Code Book for New Jersey-Pennsylvania Data Set

Note: there are 410 observations in the data set

Column Location
Name: Start End Format Explanation
---------------------------------------------------------------------------
SHEET 1 3 3.0 sheet number (unique store id)
CHAIN 5 5 1.0 chain 1=bk; 2=kfc; 3=roys; 4=wendys
CO_OWNED 7 7 1.0 1 if company owned
STATE 9 9 1.0 1 if NJ; 0 if Pa

Dummies for location:
SOUTHJ 11 11 1.0 1 if in southern NJ
CENTRALJ 13 13 1.0 1 if in central NJ
NORTHJ 15 15 1.0 1 if in northern NJ
PA1 17 17 1.0 1 if in PA, northeast suburbs of Phila **
PA2 19 19 1.0 1 if in PA, Easton etc **
SHORE 21 21 1.0 1 if on NJ shore **

First Interview
NCALLS 23 24 2.0 number of call-backs*
EMPFT 26 30 5.2 # full-time employees
EMPPT 32 36 5.2 # part-time employees
NMGRS 38 42 5.2 # managers/ass't managers
WAGE_ST 44 48 5.2 starting wage ($/hr)
INCTIME 50 54 5.1 months to usual first raise
FIRSTINC 56 60 5.2 usual amount of first raise ($/hr)
BONUS 62 62 1.0 1 if cash bounty for new workers
PCTAFF 64 68 5.1 % employees affected by new minimum
MEALS 70 70 1.0 free/reduced price code (See below)
OPEN 72 76 5.2 hour of opening
HRSOPEN 78 82 5.2 number hrs open per day
PSODA 84 88 5.2 price of medium soda, including tax
PFRY 90 94 5.2 price of small fries, including tax
PENTREE 96 100 5.2 price of entree, including tax
NREGS 102 103 2.0 number of cash registers in store
NREGS11 105 106 2.0 number of registers open at 11:00 am

Second Interview
TYPE2 108 108 1.0 type 2nd interview 1=phone; 2=personal
STATUS2 110 110 1.0 status of second interview: see below
DATE2 112 117 6.0 date of second interview MMDDYY format
NCALLS2 119 120 2.0 number of call-backs*
EMPFT2 122 126 5.2 # full-time employees
EMPPT2 128 132 5.2 # part-time employees
NMGRS2 134 138 5.2 # managers/ass't managers
WAGE_ST2 140 144 5.2 starting wage ($/hr)
INCTIME2 146 150 5.1 months to usual first raise
FIRSTIN2 152 156 5.2 usual amount of first raise ($/hr)
SPECIAL2 158 158 1.0 1 if special program for new workers
MEALS2 160 160 1.0 free/reduced price code (See below)
OPEN2R 162 166 5.2 hour of opening
HRSOPEN2 168 172 5.2 number hrs open per day
PSODA2 174 178 5.2 price of medium soda, including tax
PFRY2 180 184 5.2 price of small fries, including tax
PENTREE2 186 190 5.2 price of entree, including tax
NREGS2 192 193 2.0 number of cash registers in store
NREGS112 195 196 2.0 number of registers open at 11:00 am

Codes:

Free/reduced Meal Variable:
0 = none
1 = free meals
2 = reduced price meals
3 = both free and reduced price meals


Second Interview Status
0 = refused second interview (count = 1)
1 = answered 2nd interview (count = 399)
2 = closed for renovations (count = 2)
3 = closed "permanently" (count = 6)
4 = closed for highway construction (count = 1)
5 = closed due to Mall fire (count = 1)


*Note: number of call-backs = 0 if contacted on first call
*/

gen SHEET = substr(v1,1,3.0)
gen CHAIN = substr(v1,5,1.0)
gen CO_OWNED = substr(v1,7,1.0)
gen STATE = substr(v1,9,1.0)

gen SOUTHJ = substr(v1,11,1.0)
gen CENTRALJ = substr(v1,13,1.0)
gen NORTHJ = substr(v1,15,1.0)
gen PA1 = substr(v1,17,1.0)
gen PA2 = substr(v1,19,1.0)
gen SHORE = substr(v1,21,1.0)

gen NCALLS = substr(v1,23,2.0)
gen EMPFT = substr(v1,26,5.2)
gen EMPPT = substr(v1,32,5.2)
gen NMGRS = substr(v1,38,5.2)
gen WAGE_ST = substr(v1,44,5.2)
gen INCTIME = substr(v1,50,5.1)
gen FIRSTINC = substr(v1,56,5.2)
gen BONUS = substr(v1,62,1.0)
gen PCTAFF = substr(v1,64,5.1)
gen MEALS = substr(v1,70,1.0)
gen OPEN = substr(v1,72,5.2)
gen HRSOPEN = substr(v1,78,5.2)
gen PSODA = substr(v1,84,5.2)
gen PFRY = substr(v1,90,5.2)
gen PENTREE = substr(v1,96,5.2)
gen NREGS = substr(v1,102,2.0)
gen NREGS11 = substr(v1,105,2.0)

gen TYPE2 = substr(v1,108,1.0)
gen STATUS2 = substr(v1,110,1.0)
gen DATE2 = substr(v1,112,6.0)
gen NCALLS2 = substr(v1,119,2.0)
gen EMPFT2 = substr(v1,122,5.2)
gen EMPPT2 = substr(v1,128,5.2)
gen NMGRS2 = substr(v1,134,5.2)
gen WAGE_ST2 = substr(v1,140,5.2)
gen INCTIME2 = substr(v1,146,5.2)
gen FIRSTIN2 = substr(v1,152,5.2)
gen SPECIAL2 = substr(v1,158,1.0)
gen MEALS2 = substr(v1,160,1.0)
gen OPEN2R = substr(v1,162,5.2)
gen HRSOPEN2 = substr(v1,168,5.2)
gen PSODA2 = substr(v1,174,5.2)
gen PFRY2 = substr(v1,180,5.2)
gen PENTREE2 = substr(v1,186,5.2)
gen NREGS2 = substr(v1,192,2.0)
gen NREGS112 = substr(v1,195,2.0)

*destring vars
destring SHEET CHAIN CO_OWNED STATE EMPFT NMGRS EMPPT WAGE_ST PCTAFF PSODA PFRY PENTREE HRSOPEN BONUS, replace

*Table 1
tab NCALLS STATE
tab STATUS2 STATE

*Table 2
*1. Distribution of Store Types (percentages):
tab CHAIN, gen(CHAIN_)
ttest CHAIN_1, by(STATE)
ttest CHAIN_2, by(STATE)
ttest CHAIN_3, by(STATE)
ttest CHAIN_4, by(STATE)

ttest CO_OWNED, by(STATE)

*2. Means in Wave 1:
gen fte1 = (EMPFT + NMGRS) + (0.5)*(EMPPT)
ttest fte1, by(STATE)

gen s_ft1 = (EMPFT) / (fte1)
ttest s_ft1, by(STATE)

rename WAGE_ST WAGE_ST1
ttest WAGE_ST1, by(STATE)

gen w_min1 = .
replace w_min1=1 if WAGE_ST1<=4.25
replace w_min1=0 if WAGE_ST1>4.25
ttest w_min1, by(STATE)

egen pricefull1 = rowtotal(PSODA PFRY PENTREE)
replace pricefull1=. if PSODA==.
replace pricefull1=. if PFRY==.
replace pricefull1=. if PENTREE==.
ttest pricefull1, by(STATE)

ttest HRSOPEN, by(STATE)

ttest BONUS, by(STATE)

*3. Means in Wave 2:
destring EMPFT2 NMGRS2 EMPPT2 WAGE_ST2 PSODA2 PFRY2 PENTREE2 HRSOPEN2 SPECIAL2, replace

gen fte2 = (EMPFT2 + NMGRS2) + (0.5)*(EMPPT2)
ttest fte2, by(STATE)

gen s_ft2 = (EMPFT2) / (fte2)
ttest s_ft2, by(STATE)

ttest WAGE_ST2, by(STATE)

gen w_min2 = .
replace w_min2=1 if WAGE_ST2<=4.25
replace w_min2=0 if WAGE_ST2>4.25
ttest w_min2, by(STATE)

gen w_minnew2 = .
replace w_minnew2=(WAGE_ST2==5.05) if WAGE_ST2!=.
ttest w_minnew2 , by(STATE)

egen pricefull2 = rowtotal(PSODA2 PFRY2 PENTREE2)
replace pricefull2=. if PSODA2==.
replace pricefull2=. if PFRY2==.
replace pricefull2=. if PENTREE2==.
ttest pricefull2, by(STATE)

ttest HRSOPEN2, by(STATE)

gen BONUS2 = SPECIAL2
ttest BONUS2, by(STATE)

 

*Figure 1
ssc install byhist
* February 1992
byhist WAGE_ST1, by(STATE) frac ///
tw1(color(gray)) ///
tw2(color(black)) ///
tw(xlab(4(.10)6, labsize(small)) ylab(0(.10)1, labsize(small) angle(0) format(%4.2f)) ti("February 1992") yti("Share of Stores") xti("Wage Range") scheme(s1color) legend(order(1 "Pennsylvania" 2 "New Jersey")))


* November 1992
byhist WAGE_ST2, by(STATE) frac ///
tw1(color(gray)) ///
tw2(color(black)) ///
tw(xlab(4(.10)6, labsize(small)) ylab(0(.10)1, labsize(small) angle(0) format(%4.2f)) ti("November 1992") yti("Share of Stores") xti("Wage Range") scheme(s1color) legend(order(1 "Pennsylvania" 2 "New Jersey")))


*Regression estimates
keep SHEET CHAIN CO_OWNED STATE fte1 fte2 WAGE_ST1 WAGE_ST2
bysort SHEET: gen uniqueid=_N
tab uniqueid
drop if uniqueid!=1
reshape long fte WAGE_ST, i(SHEET) j(t)
drop if fte==.
drop if WAGE_ST==.
drop uniqueid
bysort SHEET: gen uniqueid=_N
tab uniqueid
tab t
gen post = .
replace post = 0 if t==1
replace post = 1 if t==2

gen treated = .
replace treated = 0 if STATE == 0
replace treated = 1 if STATE == 1

*panel dimension
xtset SHEET post

*change in employment
gen dfte = fte - L1.fte

*some figures from Table 3
ttest fte if post==0, by(treated)
ttest fte if post==1, by(treated)

ttest dfte if post==1, by(treated)

*some figures from Table 4
reg fte i.treated##i.post if uniqueid==2
reg dfte i.treated if post==1 & uniqueid==2