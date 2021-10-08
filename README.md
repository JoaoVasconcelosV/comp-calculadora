## :wrench: Tecnologias

- [GCC](https://gcc.gnu.org/)
- [Bison](https://www.gnu.org/software/bison/)
- [Flex](hhttps://westes.github.io/flex/manual/)

## :rocket: Como iniciar

- **Pré Requisitos**: É necessário ter **GCC**, **Bison** e **Flex** para executar esse projeto

- **Clone o repositório**:

```
    $ git clone https://github.com/JoaoVasconcelosV/comp-calculadora
```

- **Crie um makefile na raiz do projeto**

```
  all: calc.l calc.y
    flex -i calc.l
    bison calc.y
    gcc calc.tab.c -o Calculadora -lfl -lm
    ./Calculadora
```

**Execute em um terminal:**

```
  make
```

## :rocket: Como utilizar a linguagem

**Início e fim do programa**
```
  inicio
    ...
  final
```

**Atribuição de valores às variáveis**
```
 x = 10
```

**Ler variáveis**
```
 ler(a)
```

**Escrever variáveis**
```
 mostrar(a)
```