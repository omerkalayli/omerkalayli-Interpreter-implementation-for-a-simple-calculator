# Test cases

3 + 5

10 * 4

15 - 7

20 / 5

0 + 0

(1 + 2) * 4

(10 - 2) / 2

(5 * (3 + 2)) - 10

(20 / (4 + 1))

(3 + 5) * (2 - 1) / 4

((2 + 3) * (4 - 2)) + (10 / 2)

5 * (3 + (2 * 4)) - (6 / 2)

((1 + 1) + (2 * 2)) * (2 + 3)

10 / 0

(5 - 5) / 2

0 / 0

(2 + 3) / (5 - 5)


# Test case results

Sonuç: 8
Sonuç: 40
Sonuç: 8
Sonuç: 4
Sonuç: 0
Sonuç: 12
Sonuç: 4
Sonuç: 15
Sonuç: 4
Sonuç: 2
Sonuç: 15
Sonuç: 33
Sonuç: 30
Hata: Sıfıra bölme!
Sonuç: Tanımsız.

Hata: Sıfıra bölme!
Sonuç: Tanımsız.

Hata: Sıfıra bölme!
Sonuç: Belirsiz.

Hata: Sıfıra bölme!
Sonuç: Tanımsız.

# Design decisions

PLUS and MINUS are left-associative.
TIMES and DIVIDE are left-associative and have higher precedence.
Division by zero is handled. (Tanımsız, Belirsiz)
Other errors are handled, but all of them creates the same output: "Hata: syntax error"

# Implementation steps

Lex file ile tokenization yapildi. 
Verilmis grammer'e gore Yacc file yazildi.
Division by zero exception handling yapildi.

Floating point islemleri yapilamadi :). NUMBER tokeninin float donmesini bir turlu saglayamadim.

# How to run my code

bison -d calculator.y && flex calculator.l && gcc lex.yy.c calculator.tab.c -o calculator -lm
./calculator < test_cases.txt

(test case'lerdeki bosluk sorunundan dolayı terminale copy paste yapmak yerinde txt'den okutturup islem yaptirtiyorum.)