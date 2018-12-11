# Bookizer

## Cómo utilizar estos scripts

Supongamos que tenemos un pdf con 125 páginas y queremos que cada
signature tenga 6 hojas papel.

En una terminal en Linux escribimos:

    python3 impostador.py

El programa nos pide que ingresemos el número de páginas. Para esto
escribimos 125 y presionamos ENTER. Luego nos pide que ingresemos la
cantidad de hojas por signature. Para esto escribimos 6 y presionamos
ENTER.

El programa responde con la siguiente información:

    Número de páginas en blanco que hay que agregar: 3

    Numeración del libro
    --------------------
    24, 1, 2, 23, 22, 3, 4, 21, 20, 5, 6, 19, 18, 7, 8, 17, 16, 9, 10,
    15, 14, 11, 12, 13, 48, 25, 26, 47, 46, 27, 28, 45, 44, 29, 30,
    43, 42, 31, 32, 41, 40, 33, 34, 39, 38, 35, 36, 37, 72, 49, 50,
    71, 70, 51, 52, 69, 68, 53, 54, 67, 66, 55, 56, 65, 64, 57, 58,
    63, 62, 59, 60, 61, 96, 73, 74, 95, 94, 7 5, 76, 93, 92, 77, 78,
    91, 90, 79, 80, 89, 88, 81, 82, 87, 86, 83, 84, 85, 120, 97, 98,
    119, 118, 99, 100, 117, 116, 101, 102, 115, 114, 103, 104, 113 ,
    112, 105, 106, 111, 110, 107, 108, 109, 128, 121, 122, 127, 126,
    123, 124, 125

Copiamos la numeración y utilizando una impresora a pdf (en un lector
de pdfs en linux como evince o atril), imprimimos el archivo
utilizando esta numeración.
