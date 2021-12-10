     H
     FSTUD01D   CF   E             WORKSTN
     FUSERS     IF   E           K DISK
      /free
         Write HEADER;
         Write FOOTER;
         Dow *in03 = *off;
            Exfmt S01FMT;
            err = ' ' ;
            if *in05 = *on;
               clear studid;
            else;
               Exsr $Validate;
            endif;
         enddo;
         *inlr = *on;
      /end-free
      *
      /free
         Begsr $validate;
           If (studid <> 0);
              Userid = studid;
              Chain userid users;
              if %found(users);
                 id = userid;
                 Fname = firstname;
                 Lname = lastname;
                 Sage   = Age;
                 exfmt S02FMT;
              else;
                 err = 'Student ID not in database';
              endif;
           elseif (studid = 0) ;
              err = 'Student ID is blank';
           endif;
         Endsr;
      /end-free
