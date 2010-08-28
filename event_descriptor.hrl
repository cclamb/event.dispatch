-record(event_descriptor,
	{originating_host, 			% The Host the event orinated from
	id,							% A sequence number for the message
    date_time_stamp = now(), 	% The time of the originally submitted event
    priority  = low, 			% Valid atoms are low, medium, and high
    severity  = low,			% Valid atoms are low, mendium, and high
    type = informational,		% Valid atoms are informational, trace, and error
    message}).					% Supporting information, generally a string
