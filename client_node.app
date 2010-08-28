{application, client_node,
  [{description, ""},
   {vsn, "0.5"},
   {modules, [client_node_engine, remote_handler, local_handler, client_node_supervisor, communication_server]},
   {registered, [communication_server]},
   {applications, [kernel, stdlib]},
   {mod, {client_node_engine, []}},
   {start_phases, []}
]}.