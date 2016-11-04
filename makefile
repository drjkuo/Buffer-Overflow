all: exploit.c stack.c
	gcc -o stack -z execstack -fno-stack-protector stack.c
	chmod 4755 stack
	gcc -o exploit exploit.c
	./exploit
	./stack

ex: exploit.c
	gcc -o exploit exploit.c
	./exploit
	./stack

st: stack.c
	gcc -o stack -z execstack -fno-stack-protector stack.c
	chmod 4755 stack

stg: stack.c
	gcc -o stack -z execstack stack.c
	chmod 4755 stack


stgdb: stack.c
	gcc -o stack -z execstack -fno-stack-protector stack.c -g
	chmod 4755 stack

stgg: stack.c
	gcc -o stack -z execstack stack.c -g
	chmod 4755 stack

att2:
	sh -c "while [ 1 ]; do ./stack; done;"

2ndp:
	/sbin/sysctl -w kernel.randomize_va_space=2

nop:
	/sbin/sysctl -w kernel.randomize_va_space=0

