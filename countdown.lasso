[
define_type('countdown',
    -description = "A Lasso type that stores the number of days, hours, minutes, and seconds remaining from now until a date in the future (t0). Useful for a countdown situation, like on New Year's Eve or when launching vehicles into space.

->days
Returns the number of days remaining.

->hours
Returns the number of hours remaining.

->minutes
Returns the number of minutes remaining.

->seconds
Returns the number of seconds remaining.");

    local(
        'tnow' = date,
        'tdiff' = integer,
        'tdays' = integer,
        'thours' = integer,
        'tminutes' = integer,
        'tseconds' = integer,
        'tztarget' = string,
        'tzserver' = string);

    define_tag('oncreate',
        -description="Parameters:
            -t0 is required and must be a type date. The time to which we will count down.
            -tztarget is optional but must be of type string. The time zone in which the count down will occur.
            -tzserver is optional but must be of type string. The server's time zone.",
        -req='t0', -type='date',
        -optional='tztarget', -type='string',
        -optional='tzserver', -type='string'
        );
        local(
            // To set defaults, configure myserver for your local
            // and production environments respectively.
            'myserver' = (server_name == 'sp' ? 'America/Los_Angeles' | 'America/Chicago'),
            'tdiff' = integer,
            'tdays' = integer,
            'thours' = integer,
            'tminutes' = integer,
            'tseconds' = integer);
        !local_defined('tztarget') ? local('tztarget') = #myserver;
        !local_defined('tzserver') ? local('tzserver') = #myserver;

        local('t0') = date(tz_convert(-dt=#t0, -tzin=#tztarget, -tzout=#tzserver));
        local('tnow') = date(tz_convert(-dt=date, -tzin=#tztarget, -tzout=#tzserver));

        #tdiff = self->tnow->difference(#t0, -second);

        if(#tdiff > 0);
            #tseconds = #tdiff%60;
            #tdiff -= #tseconds;
            self->tseconds = #tseconds;
            #tdiff /= 60;

            #tminutes = #tdiff%60;
            #tdiff -= #tminutes;
            self->tminutes = #tminutes;
            #tdiff /= 60;

            #thours = #tdiff%24;
            #tdiff -= #thours;
            self->thours = #thours;
            #tdiff /= 24;

            #tdays = #tdiff;
            self->tdays = #tdays;
        /if;
    /define_tag;

    define_tag('days', -description='Returns the number of days remaining.');
        return(self->tdays);
    /define_tag;

    define_tag('hours', -description='Returns the number of hours remaining.');
        return(self->thours);
    /define_tag;

    define_tag('minutes', -description='Returns the number of minutes remaining.');
        return(self->tminutes);
    /define_tag;

    define_tag('seconds', -description='Returns the number of seconds remaining.');
        return(self->tseconds);
    /define_tag;

/define_type;
]
