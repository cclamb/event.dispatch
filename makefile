.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<
	
.yrl.erl:
	erlc -W $<
	
ERL = erl -boot start_clean
	
MODS = client_node_engine \
	client_node_supervisor \
	local_handler \
	remote_handler \
	communication_server \
	command_server \
	command_handler \
  command_node_engine \
  command_node_communication_server \
  event_reception_server \
  command_node_supervisor \
  event_dispatch_server
	
all: compile

compile: ${MODS:%=%.beam}

start_sasl:
	${ERL} -boot start_sasl

clean:
	rm -rf *.beam erl_crash.dump
