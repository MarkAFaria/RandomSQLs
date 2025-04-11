

   SELECT TOP (50) 
			'APPLICATION' SOURCE_TABLE,
            PRG.EMPLID,
            PRG.ACAD_CAREER,
            PRG.STDNT_CAR_NBR,
            PRG.ADM_APPL_NBR,
            PRG.APPL_PROG_NBR,
            PRG.EFFDT,
            PRG.EFFSEQ,
            PRG.INSTITUTION,
            PRG.ACAD_PROG,
            PRG.PROG_STATUS,
            PRG.PROG_ACTION,
            PRG.PROG_REASON,
   --         DST.DECISION_STATUS_CD,
   --         RST.RESPONSE_STATUS_CD,
            PRG.ADMIT_TERM,
            PRG.ACTION_DT,
            PLN.ACAD_PLAN,
            PLT.ACAD_PLAN_TYPE,
            PLT.DEGREE,
            PLN.PLAN_SEQUENCE,
            SPL.ACAD_SUB_PLAN,
            PGT.ACAD_GROUP
            --CASE WHEN PGT.ACAD_GROUP IN ('QST', 'SHA') THEN TRIM(SPT.DESCR) || ' ' ELSE '' END || TRIM(PLT.DESCR) PLAN
    FROM    cs_views.v_PS_ADM_APPL_PROG PRG
	 LEFT
    JOIN    cs_views.v_PS_ADM_APPL_PLAN PLN
    ON      PRG.EMPLID = PLN.EMPLID
    AND     PRG.ACAD_CAREER = PLN.ACAD_CAREER
    AND     PRG.STDNT_CAR_NBR = PLN.STDNT_CAR_NBR
    AND     PRG.APPL_PROG_NBR = PLN.APPL_PROG_NBR
    AND     PRG.EFFDT = PLN.EFFDT
    AND     PRG.EFFSEQ = PLN.EFFSEQ
    AND     PLN.PLAN_SEQUENCE = 1
    LEFT
    JOIN    cs_views.v_PS_ADM_APPL_SBPLAN SPL
    ON      PLN.EMPLID = SPL.EMPLID
    AND     PLN.ACAD_CAREER = SPL.ACAD_CAREER
    AND     PLN.STDNT_CAR_NBR = SPL.STDNT_CAR_NBR
    AND     PLN.ADM_APPL_NBR = SPL.ADM_APPL_NBR
    AND     PLN.APPL_PROG_NBR = SPL.APPL_PROG_NBR
    AND     PLN.ACAD_PLAN = SPL.ACAD_PLAN
    AND     PLN.EFFDT = SPL.EFFDT
    AND     PLN.EFFSEQ = SPL.EFFSEQ
    /****** LOOKUPS *******/
    LEFT
    JOIN    cs_views.v_PS_ACAD_PROG_TBL PGT
    ON      PRG.INSTITUTION = PGT.INSTITUTION
    AND     PRG.ACAD_PROG = PGT.ACAD_PROG
    AND     PRG.ACAD_CAREER = PGT.ACAD_CAREER
    AND     PGT.EFFDT = (   
            SELECT  MAX(PGB.EFFDT) 
            FROM    cs_views.v_PS_ACAD_PROG_TBL PGB
            WHERE   PGT.INSTITUTION = PGB.INSTITUTION
            AND     PGT.ACAD_PROG = PGB.ACAD_PROG
            AND     PGT.EFFDT <= PRG.EFFDT)
    LEFT
    JOIN    cs_views.v_PS_ACAD_PLAN_TBL PLT
    ON      PRG.INSTITUTION = PLT.INSTITUTION
    AND     PLN.ACAD_PLAN = PLT.ACAD_PLAN
    AND     PLT.EFFDT = (   
            SELECT  MAX(PLB.EFFDT) 
            FROM    cs_views.v_PS_ACAD_PLAN_TBL PLB
            WHERE   PLT.INSTITUTION = PLB.INSTITUTION
            AND     PLT.ACAD_PLAN = PLB.ACAD_PLAN
            AND     PLT.EFFDT <= PRG.EFFDT)

/*


    LEFT
    JOIN    PS_ACAD_SUBPLN_TBL SPT
    ON      PRG.INSTITUTION = SPT.INSTITUTION
    AND     SPL.ACAD_PLAN = SPT.ACAD_PLAN
    AND     SPL.ACAD_SUB_PLAN = SPT.ACAD_SUB_PLAN
    AND     SPT.EFFDT = (   
            SELECT  MAX(SPB.EFFDT) 
            FROM    PS_ACAD_SUBPLN_TBL SPB
            WHERE   SPT.INSTITUTION = SPB.INSTITUTION
            AND     SPT.ACAD_PLAN = SPB.ACAD_PLAN
            AND     SPT.ACAD_SUB_PLAN = SPB.ACAD_SUB_PLAN
            AND     SPT.EFFDT <= PRG.EFFDT)
			
			*/

			/*
    LEFT
    JOIN    cs_views.v_TBL_DECISION_STATUS DST
    ON      PRG.PROG_STATUS = DST.PROG_STATUS
    AND     PRG.PROG_ACTION = DST.PROG_ACTION
    AND     PRG.PROG_REASON = DST.PROG_REASON
    LEFT
    JOIN    TBL_RESPONSE_STATUS RST
    ON      PRG.PROG_ACTION = RST.PROG_ACTION
    AND     PRG.PROG_REASON = RST.PROG_REASON


	*/