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
	communication_server
	
all: compile

compile: ${MODS:%=%.beam}

start_sasl:
	${ERL} -boot start_sasl

clean:
	rm -rf *.beam erl_crash.dump