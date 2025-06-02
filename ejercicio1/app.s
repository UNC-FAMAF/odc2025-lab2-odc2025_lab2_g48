	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x10, 0x0F, lsl 16
	movk x10, 0xC4C4, lsl 00

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size

cielo:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,cielo  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto


mov x2, 200 // contador
movz x10, 0x14, lsl 16 //color
movk x10, 0x1D9A, lsl 00 //color

mov x0, x20 // x0 direccion base
movz x4, 0x2, lsl 16
movk x4, 0xB980, lsl 00
lsl x4, x4, 2 // x4 nro x 4
add x0, x0, x4 // x0 + x4, direccion de inicio + direccion pixel

loop2:
    mov x1, SCREEN_WIDTH 

agua:
    stur w10, [x0] // pinta x0, primer pixel
	add x0, x0, 4 // siguiente pixel
    sub x1, x1, 1 // restamos contador X pixel
    cbnz x1, agua // si no termino, salto a agua
    sub x2, x2, 1 // restamos contador Y filas
    cbnz x2, loop2 // si no termino, salto a loop2


mov x2, 4
movz x10, 0x59, lsl 16
movk x10, 0x9DE9, lsl 0 

mov x0, x20
movz x4, 0x2, lsl 16
movk x4, 0xF0A8, lsl 0
lsl x4, x4, 2 
add x0, x0, x4

loop3:
	mov x1, 100

movimiento_agua:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, movimiento_agua
	sub x2, x2, 1
	sub x0, x0, 400 // le resto a la direccion lo que avanze en X
	add x0, x0, 2560 // le sumo 2560 osea 640 x 4, para pasar a la linea siguiente en el mismo punto X
	cbnz x2, loop3
	add x0, x0, 1200

	




	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//---------------------------------------------------------------
	// Infinite Loop


InfLoop:
	b InfLoop
