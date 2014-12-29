countdown
=========

Read the article `countdown - A Lasso type that stores the number of days, hours,
minutes, and seconds remaining from now until a date in the future
<http://www.stevepiercy.com/articles/countdown-a-lasso-type-that-stores-the-number-of-days-hours-minutes-and-seconds-remaining-from-now-until-a-date-in-the-future/>`_.

Description
===========

``[countdown]`` is a Lasso type that stores the number of days, hours,
minutes, and seconds remaining from now until a date in the future (t0). It
is useful for a countdown situation, like on New Year's Eve or when launching
vehicles into space.

Demo
====

`Demo <http://www.stevepiercy.com/lasso/countdown_demo/>`_.

Usage
=====

``countdown`` accepts three parameters.

``-t0`` is required and must be a date type. Its value is the time to which we
will count down.

``-tztarget`` is optional but must be a string type. Its value is the time
zone in which the count down will occur.

``-tzserver`` is optional but must be a string type. Its value is the server's
time zone.

``countdown`` has the following methods.

``->days`` returns the number of days remaining.

``->hours`` returns the number of hours remaining.

``->minutes`` returns the number of minutes remaining.

``->seconds`` returns the number of seconds remaining.

Example
=======

.. code-block:: html+lasso

    [
    local(
        't0' = '2015-01-01 00:00:00',
        'tztarget' = 'America/New_York',
        'tzserver' = 'America/Los_Angeles');
    local('c') = countdown(-t0=#t0, -tztarget=#tztarget, -tzserver=#tzserver);
    ]
    <h3>Current time in T-0's time zone</h3>
    <p>[tz_convert(-dt=date, -tzin=#tzserver, -tzout=#tztarget)]</p>
    <h3>Countdown to T-0, time remaining</h3>
    <p>Days: [#c->days]</p>
    <p>Hours: [#c->hours]</p>
    <p>Minutes: [#c->minutes]</p>
    <p>Seconds: [#c->seconds]</p>

Output:

.. code-block:: html

    <h3>Current time in T-0's time zone</h3>
    <p>2014-12-28 08:52:37</p>
    <h3>Countdown to T-0, time remaining</h3>
    <p>Days: 3</p>
    <p>Hours: 15</p>
    <p>Minutes: 7</p>
    <p>Seconds: 23</p>

Installation and Requirements
=============================

``[countdown]`` only
--------------------
``[countdown]`` requires ``[tz_convert]`` in order to convert countdowns
between time zones. For more information on ``[tz_convert]``, read the article
`tz_convert - Convert datetime types between time zones in Lasso 8
<http://www.stevepiercy.com/articles/tz_convert-convert-datetime-types-between-time-zones-in-lasso-8/>`_.

The repository contains the tag ``[countdown]`` in a file named
``countdown.lasso``.

For ``[countdown]``, install and configure the following requirements and
their requirements as well.

* `tz_convert <https://github.com/stevepiercy/tz_convert>`_
* Place the file ``countdown.lasso`` in the appropriate location on your
  server, and restart the appropriate scope of Lasso if needed.

Optional demo
-------------
The repository also contains a directory ``countdown_demo`` containing the
demo. In this directory there is a web page named ``index.lasso``. The demo
includes a jQuery plugin and jQuery itself. Copy the directory
``countdown_demo`` to your web server.

The demo uses ``[tz_select]`` in order to render an HTML select menu of time
zones, but is not required by ``[countdown]``. For more information on
``[tz_select]``, read the article `tz_select - Display an HTML select menu of
time zones with Lasso
<http://www.stevepiercy.com/articles/tz_select-display-an-html-select-menu-of-time-zones-with-lasso/>`_.

For the demo, install and configure the additional requirements.

* `tz_select <https://github.com/stevepiercy/tz_select>`_

References
----------
* `jQuery Date/Time Entry <http://keith-wood.name/datetimeEntry.html>`_
* `jQuery <http://jquery.com/>`_

