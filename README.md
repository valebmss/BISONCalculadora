# Estos son los pasos para correr la calculadora en BISON en Ubuntu 22
## 1. Instalacion de BISON

```
sudo apt-get update                    
sudo apt-get install bison
```

## 2. Clonacion del repositorio 

Usa este comando en la terminal
```
git clone https://github.com/valebmss/BISONCalculadora.git
```
Ingresa a la carpeta
```
cd BISONCalculadora
```

## 3. Ejecucion
```
bison -d calc.y
flex calc.l
gcc -o calc calc.tab.c lex.yy.c -lfl

```
```
./calc
```

## 4. Pruebas
