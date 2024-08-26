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

### Operaciones sencillas
```
4*6
```
*Salida esperada: 24*

### Operaciones con complejidad jearquica
```
2342*524533-(92/8*(2-4))
```
*Salida esperada: 1228456309*
### Manejo de errores 
```
95746516/0
```
*Salida esperada: Error: division by zero*
