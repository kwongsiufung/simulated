********************************************************************************
*CONFOUNDING PRACTICAL FOR THE MSC**********************************************
********************************************************************************

*Now we will explore some associations between some EXPOSURES (X) and OUTCOMES (Y)

*We will use depressive symptoms (as measured by the short and mood feelings ///
*questionnaire) assessed at age 18 as the OUTCOME (Y)

*We will use maternal education status assessed at birth as the EXPOSURE (X)

*The CONFOUNDER (C) in this case will be maternal age at birth

*It is also possible to stratify the CONFOUNDER (C) into different groups (see lecture)

*As maternal age of depression is continuous, we have to create some groups of /// 
*maternal age. We will split the mothers into 3 groups or low, middle and high ///
*maternal age

recode epds_pre_age (13/25=0) (26/35=1) (35/50=2), gen (mat_age_group)

*Check that this looks right
tab mat_age_group

*We can first explore this analysis from a cross tabulation and a chi2 test between:
 
*1) EXPOSURE (X) and OUTCOME (Y)
bysort mat_edu: sum smfq_age17

*2) CONFOUNDER (C) and OUTCOME (Y)
bysort mat_age_group: sum smfq_age17

*3) EXPOSURE (X) and CONFOUNDER (C)
tab mat_edu mat_age_group, chi2 col

*We will use the regress command to explore the linear regression

*Maternal education on continous smfq aka EXPOSURE (X) on OUTCOME (Y)
*(Remember in stata, the outcome (Y) always follows the statistical command (e.g., regress)
*(the 'i.' is used to indicate factor variables (i.e., groups)

regress smfq_age17 i.mat_edu

*We will now add in the CONFOUNDER (C) into the model

*Maternal education and maternal age at pregnancy (continuous confounder [C]) on continuous smfq

regress smfq_age17 i.mat_edu epds_pre_age

*We can now examine the stratification by the new maternal age groups 
bysort mat_age_group: regress smfq_age17 i.mat_edu

*Notice how this differs from a multivariable regression 
regress smfq_age17 i.mat_edu i.mat_age_group

********************************************************************************
*A DIFFERENT CONFOUNDER*********************************************************
********************************************************************************

*Let's now swap the CONFOUNDER (C) to be financial problems

*Try to replciate the analysis above using the financial problems variable instead
*of using the maternal age confounder
