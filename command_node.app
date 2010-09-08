{application, command_node,
  [{description, ""},
   {vsn, "0.5"},
   {modules, [command_node_engine, event_reception_server, command_node_communication_server, command_node_supervisor]},
   {registered, [command_node_communication_server, event_reception_server]},
   {applications, [kernel, stdlib]},
   {mod, {command_node_engine, [foo@fawkes, event_manager]}},
   {start_phases, []}
]}.
