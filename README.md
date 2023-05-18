## Version Facil

## 1.1 Averiguar si una carpeta contiene un archivo con un nombre dado
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/101006860/c7b3d631-7d75-4b3d-a369-38da8344f9f2)


## 1.2 Realizar un determinado cambio en una carpeta, en caso que se pueda realizar.
Dada una carpeta pdep con 2 archivos, "leeme.md" y "vacio.md". Se realizan 2 acciones: En la primera, se crea un archivo nuevo llamado "nuevo.txt", y en la segunda se elimina el archivo "leeme.md"
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/101006860/cd9e8dd8-ab5d-402a-b1b8-5fb248ab4d5d)

## 2 En una carpeta vacía llamada “pdep” se aplican los 3 cambios de un commit con descripcion "commit inicial”: uno que crea el archivo “leeme.md”, otro que crea el archivo “parcial.hs” y otro que agrega “Este es un TP” al archivo “leeme.md”. Finalmente, la carpeta debe quedar con 2 archivos: “leeme.md” con el contenido “Este es un TP” y el archivo “parcial.hs” vacío.
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/101006860/be18f248-1870-4632-aef9-458b1c8d662e)
## 3 Determinar si un commit es inutil para una carpeta, lo cual se deduce de que la carpeta quede igual que antes luego de "cometerlo". 

![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/101006860/b25e6c15-d6b8-494d-8b7c-62749c97a95c)

## 4 Determinar si un commit que resulta inutil para una carpeta, dejaría de serlo si se realizaran sus cambios en la misma carpeta en orden inverso.  
En este caso no se puede realizar ya que cada commit tiene 1 solo cambio

## PARTE 2 

## 2.5 Hacer el checkout de una branch en una carpeta: Consiste en aplicar sucesivamente los cambios de todos los commits de la branch en la carpeta.
Partimos de una carpeta de prueba que tiene 3 ramas, una "main" con un commit1 (vacia la carpeta), una "alternativa" con commit2 (crea 2 archivos), y una "alternativa2" con commit2 y commit1 (crea 2 archivos y luego vacia la carpeta).
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/39249478/af50f333-2291-496d-91fa-be650adaa58d)

Estando parados en la rama "main", hacemos un checkout hacia la rama "alternativa", con lo cual la carpeta ahora tiene 2 archivos
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/39249478/02deed46-6ca1-4bbb-8a2c-9cb7841e99c2)


## 2.1 Definir las estructuras necesarias y funciones básicas para representar el nuevo modelo.
Estructuras:
La estructura Carpeta ahora cuenta con una lista de Branch y un indicador para saber cuál branch esta apuntando en un momento dado.
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/39249478/e4486e31-5edb-44f2-84bd-03c15892dc4e)

## 2.2 Hacer una nueva versión del checkout de una branch, en este caso a partir de un commit cualquiera, que implica aplicar sucesivamente los cambios desde dicho commit hasta el inicial.
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/39249478/d3bae95a-669a-41c6-a46e-afc90588f6ab)
Siguiendo el ejemplo del inciso 2.5, si hacemos un checkout hacia la rama "alternativa2", no hay ningún archivo, ya que primero aplica los cambios del commit2 y luego los del 1. Pero si usamos checkout2 para decirle que ejecute solamente el primer commit (el commit2) quedaria con 2 archivos:
![image](https://github.com/pdepviernestm/2023-tpf-grupal-bondiola/assets/39249478/4ead9fff-3b87-4dc4-9a7c-dcfb040424fb)
