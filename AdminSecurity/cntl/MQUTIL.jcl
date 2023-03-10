//MQUTIL  JOB (0),'MQ UTIL',CLASS=A,REGION=0M,
//             MSGCLASS=H,NOTIFY=&SYSUID
//CSQUTIL  EXEC PGM=CSQUTIL,PARM='ZMQ1',REGION=0M
//STEPLIB  DD DISP=SHR,DSN=MQ92#.SCSQANLE
//         DD DISP=SHR,DSN=MQ92#.SCSQAUTH
//         DD DISP=SHR,DSN=MQ92#.SCSQLOAD
//MDOUT    DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSIN    DD  *
  COMMAND DDNAME(CMDINP) MAKEDEF(MDOUT)
//CMDINP  DD  *
ALTER QMGR SSLKEYR(MQ.KEYRING) SSLTASKS(5) CERTLABL('MQ CHIN')
DEFINE CHANNEL ('LIBERTY.SSL.SVRCONN') REPLACE +
       CHLTYPE(SVRCONN) TRPTYPE(TCP)             +
       SSLCIPH('TLS_RSA_WITH_AES_256_CBC_SHA256')
SET CHLAUTH('LIBERTY.SSL.SVRCONN') ACTION(REPLACE) +
    TYPE(SSLPEERMAP) ADDRESS('*')  CHCKCLNT(ASQMGR) +
    SSLCERTI('CN=MQ CA,OU=ATS,O=IBM') SSLPEER('OU=ATS') USERSRC(CHANNEL)
