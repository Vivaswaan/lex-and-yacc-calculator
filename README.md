To build and run this calculator run the following commands in your Linux terminal:

yacc -d calculator.y

lex calculator.l

gcc lex.yy.c y.tab.c -o calculatorObj -ll

./calculatorObj
