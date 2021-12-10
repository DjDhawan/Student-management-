     H
     FSTMG01D   CF   E             WORKSTN
     FUSERPF    IF   E           K DISK
     D
      *
      /free
         DOW *IN03 = *OFF;
            EXFMT S01FMT;
            clear emsg01;
            clear emsg02;
            clear emsg03;
            EXSR $VALIDATE;
         ENDDO;
         *inlr = *on;
      /end-free
      *
      /free
         begsr $validate;
          If *in05 = *on;
            clear inpopt;
          else;
            Select;

            when inpopt = 0;
               EMSG01 = 'option value cannot be blank';
            when inpopt = 1;
               Dow *in03 = *off;
                  exfmt s02fmt;
                  clear emsg02;
                  if *in12 = *on;
                     leave;
                  else;
                     exsr $ADMINSR;
                  endif;
               enddo;
               *in12 = *off;

            when  inpopt = 2;
               Dow *in03 = *off;
                  exfmt s03fmt;
                  clear emsg03;
                  if *in12 = *on;
                     leave;
                  else;
                     exsr $STUDSR;
                  endif;
               enddo;
               *in12 = *off;
            other;
               EMSG01 = 'Invalid option';
            endsl;
          endif;
         endsr;
      /end-free
      *
      /Free
         begsr $ADMINSR;
          if *in05 = *on;
            clear emsg02;
            clear usrid;
            clear psw;
          else;
            if (USRID = 0 OR PSW = ' ');
               EMSG02 = 'Userid or PSW cannot be blank';
            else;
               CHAIN USRID USERPF;
               IF %FOUND(USERPF);
                  IF (UROLE = 'Admin' and UPSW = PSW);
                       EMSG02 = 'Valid entry';
                  elseif UROLE <> 'Admin';
                       EMSG02 = 'User is not Admin';
                  elseif psw <> UPSW;
                       EMSG02 = 'Password is incorrect';
                  endif;
               else;
                  EMSG02 = 'User not found';
               endif;
            endif;
          endif;
         endsr;
      /end-free
      *
      /free
         begsr $STUDSR;
          if *in05 = *on;
            clear emsg03;
            clear usrid;
            clear psw;
          else;
            if (USRID = 0 OR PSW = ' ');
               EMSG03 = 'Userid or PSW cannot be blank';
            elseif (USRID = 2222 OR PSW = 'pass');
               EMSG03 = 'Valid entry';
            else;
               EMSG03 = 'Userid or Psw is wrong';
            endif;
          endif;
         endsr;
      /end-free
