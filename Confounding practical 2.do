********************************************************************************
*A DIFFERENT CONFOUNDER*********************************************************
********************************************************************************

*Let's now swap the CONFOUNDER (C) to be financial problems

*Try to replciate the analysis above using the financial problems variable instead
*of using the maternal age confounder

*The EXPOSURE (X) is still maternal education at birth
*The OUTCOME (Y) is still depressive sympotms at age 18
*The CONFOUNDER (C) is financial problems at birth

*We can first explore this analysis from a cross tabulation and a chi2 test between:
 
*1) EXPOSURE (X) and OUTCOME (Y)
bysort mat_edu: sum smfq_age17

*2) CONFOUNDER (C) and OUTCOME (Y)
bysort fin_b: sum smfq_age17

*3) EXPOSURE (X) and CONFOUNDER (C)
tab mat_edu fin_b, chi2 col

*Maternal education on continous smfq aka EXPOSURE (X) on OUTCOME (Y)

regress smfq_age17 i.mat_edu

*We will now add in the CONFOUNDER (C) into the model

*Maternal education and financial problems (confounder [C]) on continuous smfq

regress smfq_age17 i.mat_edu fin_b

*We can now examine the stratification by financial problems 
bysort fin_b: regress smfq_age17 i.mat_edu

*Notice how this differs from a multivariable regression 
regress smfq_age17 i.mat_edu fin_b
