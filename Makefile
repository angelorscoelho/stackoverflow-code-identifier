compile: parser.l final.l 
	flex parser.l
	gcc -o parser lex.yy.c
	flex final.l
	gcc -o final lex.yy.c

parsing: input.txt parser final 
	./parser < input.txt
	./final < tagged.out
