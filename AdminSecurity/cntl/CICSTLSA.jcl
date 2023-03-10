//CICSRCF1 JOB (0),'CICS RACF',CLASS=A,REGION=0M,
//             MSGCLASS=H,NOTIFY=&SYSUID
//*---------------------------------------------------------*/
//*   IMPORT CICS CA and personal certificate               */
//*---------------------------------------------------------*/
//RACF     EXEC PGM=IKJEFT01,REGION=0M
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
racdcert CERTAUTH withlabel('CICS CA') -
  add('USER1.CICSCA.PEM')

racdcert id(cicsstc) withlabel('CICS Client Cert') -
  add('USER1.CICS.P12') password('secret')

setropts raclist(digtcert,digtnmap) refresh

racdcert certauth list(label('CICS CA')

racdcert id(cicsstc) list(label('CICS Client Cert')
/*
