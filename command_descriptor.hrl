-record(command_descriptor,
	{originating_host, 			% The Host the event orinated from
	destination_host,			% The destination for the message
	id, 						% A sequence number for the message
    date_time_stamp = now(), 	% The time of the originally submitted event
    type = registration}).		% Valid atoms are registration