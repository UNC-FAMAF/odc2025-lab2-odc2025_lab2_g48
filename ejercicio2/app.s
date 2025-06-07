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

//--------------------------------------
// Cielo
//--------------------------------------

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

//--------------------------------------
// Hojas de la palmera
//--------------------------------------

bl draw_hoja_palmera_1                                                                 // Llama al procedimiento que dibuja el coco

draw_hoja_palmera_1:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x1B, lsl 16
    movk x10, 0x5E20, lsl 00
    mov x23, x10

    mov x15, #487                                                           // Coordenada X del centro
    mov x21, #207                                                            // Coordenada Y del centro
    mov x22, #34                                                            // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


bl draw_correccion_cielo_1                                                                 // Llama al procedimiento que dibuja el coco

draw_correccion_cielo_1:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x0F, lsl 16
    movk x10, 0xC4C4, lsl 00
    mov x23, x10

    mov x15, #490                                                           // Coordenada X del centro
    mov x21, #238                                                            // Coordenada Y del centro
    mov x22, #58                                                            // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


bl draw_hoja_palmera_2                                                                 // Llama al procedimiento que dibuja el coco

draw_hoja_palmera_2:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x1B, lsl 16
    movk x10, 0x5E20, lsl 00
    mov x23, x10

    mov x15, #431                                                           // Coordenada X del centro
    mov x21, #201                                                            // Coordenada Y del centro
    mov x22, #29                                                            // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


bl draw_correccion_cielo_2                                                                 // Llama al procedimiento que dibuja el coco

draw_correccion_cielo_2:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x0F, lsl 16
    movk x10, 0xC4C4, lsl 00
    mov x23, x10

    mov x15, #429                                                           // Coordenada X del centro
    mov x21, #224                                                            // Coordenada Y del centro
    mov x22, #44                                                            // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


bl draw_hoja_palmera_3                                                                 // Llama al procedimiento que dibuja el coco

draw_hoja_palmera_3:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x1B, lsl 16
    movk x10, 0x5E20, lsl 00
    mov x23, x10

    mov x15, #443                                                           // Coordenada X del centro
    mov x21, #209                                                            // Coordenada Y del centro
    mov x22, #27                                                            // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64

bl draw_hoja_palmera_4                                                                 // Llama al procedimiento que dibuja el coco

draw_hoja_palmera_4:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x1B, lsl 16
    movk x10, 0x5E20, lsl 00
    mov x23, x10

    mov x15, #474                                                           // Coordenada X del centro
    mov x21, #209                                                            // Coordenada Y del centro
    mov x22, #26                                                           // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


bl draw_correccion_cielo_3                                                                 // Llama al procedimiento que dibuja el coco

draw_correccion_cielo_3:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del sol
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x0F, lsl 16
    movk x10, 0xC4C4, lsl 00
    mov x23, x10

    mov x15, #458                                                           // Coordenada X del centro
    mov x21, #231                                                            // Coordenada Y del centro
    mov x22, #42                                                            // Radio

    bl dibujar_circulo_relleno                                              // Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


//--------------------------------------
// Mar
//--------------------------------------

mov x2, 201 // contador
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
    stur w10, [x0]                               // pinta x0, primer pixel
	add x0, x0, 4                                // siguiente pixel
    sub x1, x1, 1                                // restamos contador X pixel
    cbnz x1, agua                                // si no termino, salto a agua
    sub x2, x2, 1                                // restamos contador Y filas
    cbnz x2, loop2                               // si no termino, salto a loop2


//--------------------------------------
// Oleaje
//--------------------------------------

mov x2, 6
movz x10, 0x59, lsl 16
movk x10, 0x9DE9, lsl 0 

mov x0, x20
movz x4, 0x2, lsl 16 // numero de pixel
movk x4, 0xF0A8, lsl 0
lsl x4, x4, 2 // direccion de la memoria del pixel
add x0, x0, x4 // base + pixel 

loop3:
    mov x1, 100

movimiento_agua:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, movimiento_agua
    sub x2, x2, 1
    sub x0, x0, 380                              // le resto a la direccion lo que avanze en X
    add x0, x0, 2560                             // le sumo 2560 osea 640 x 4, para pasar a la linea siguiente en el mismo punto X
    cbnz x2, loop3

mov x2, 4
movz x10, 0x59, lsl 16
movk x10, 0x9DE9, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0x1A60, lsl 0
lsl x4, x4, 2
add x0, x0, x4

loop4:
    mov x1, 100

movimiento_agua2:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, movimiento_agua2
    sub x2, x2, 1
    sub x0, x0, 380
    add x0, x0, 2560
    cbnz x2, loop4

mov x2, 4
movz x10, 0x59, lsl 16
movk x10, 0x9DE9, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xEFB9, lsl 0
lsl x4, x4, 2
add x0, x0, x4

loop5:
    mov x1, 100

movimiento_agua3:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, movimiento_agua3
    sub x2, x2, 1
    sub x0, x0, 380
    add x0, x0, 2560
    cbnz x2, loop5



mov x2, 6
movz x10, 0x59, lsl 16
movk x10, 0x9DE9, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xBF51, lsl 0
lsl x4, x4, 2
add x0, x0, x4

loop5_1:
    mov x1, 100

movimiento_agua4:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, movimiento_agua4
    sub x2, x2, 1
    sub x0, x0, 380
    add x0, x0, 2560
    cbnz x2, loop5_1



mov x2, 3
movz x10, 0x59, lsl 16
movk x10, 0x9DE9, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xFCFA, lsl 0
lsl x4, x4, 2
add x0, x0, x4

loop5_2:
    mov x1, 100

movimiento_agua5:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, movimiento_agua5
    sub x2, x2, 1
    sub x0, x0, 380
    add x0, x0, 2560
    cbnz x2, loop5_2


//--------------------------------------
// Base del barco
//--------------------------------------

mov x2, 22

movz x10, 0xFF, lsl 16  
movk x10, 0xFFFF, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0x9DF0, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x3, 129

loop6:
	mov x1, x3
	 
base_barco:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, base_barco

	sub x2, x2, 1                                                                      //contador Y
	lsl x1, x3, 2                                                                      // cantidad que pinte, en memoria

	sub x0, x0, x1 																	   // nueva direccion 
	add x0, x0, 2560                                                                   //paso linea
	add x0, x0, 4 
	
	sub x3, x3, 2                                                                      //cantidad de pixeles que voy a pintar en la proxima 129 - 2n
	cbnz x2, loop6

// Inscripcion ODC 2025

// Letra O

movz x10, 0x00, lsl 16  
movk x10, 0x0000, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA80D, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 12                                                                         	   // Contador y
mov x3, 8                   														   // Contador x

loop_o1:
	mov x1, x3
	 
letra_o1:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, letra_o1

	sub x2, x2, 1                           										   // contador Y
	lsl x1, x3, 2                         											   // cantidad que pinte, en memoria

	sub x0, x0, x1                       											   // nueva direccion 
	add x0, x0, 2560                    											   //paso linea

	cbnz x2, loop_o1



movz x10, 0xFF, lsl 16  
movk x10, 0xFFFF, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD0F, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 8                     														   // Contador y
mov x3, 4                     														   // Contador x

loop_o2:
	mov x1, x3
	 
letra_o2:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, letra_o2

	sub x2, x2, 1                        											   // contador Y
	lsl x1, x3, 2                        											   // cantidad que pinte, en memoria

	sub x0, x0, x1                       											   // nueva direccion 
	add x0, x0, 2560                     											   //  paso linea

	cbnz x2, loop_o2


// Letra D


movz x10, 0x00, lsl 16  
movk x10, 0x0000, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA818, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 12                     														   // Contador y
mov x3, 8                     														   // Contador x

loop_d1:
	mov x1, x3
	 
letra_d1:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, letra_d1

	sub x2, x2, 1                          	 										   // contador Y
	lsl x1, x3, 2                         											   // cantidad que pinte, en memoria

	sub x0, x0, x1                      	 										   // nueva direccion 
	add x0, x0, 2560                    											   //paso linea

	cbnz x2, loop_d1



movz x10, 0xFF, lsl 16  
movk x10, 0xFFFF, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD1A, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 8                     														   // Contador y
mov x3, 4                     														   // Contador x

loop_d2:
	mov x1, x3
	 
letra_d2:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, letra_d2

	sub x2, x2, 1                        											   // contador Y
	lsl x1, x3, 2                        											   // cantidad que pinte, en memoria

	sub x0, x0, x1                      	 										   // nueva direccion 
	add x0, x0, 2560                     											   //  paso linea

	cbnz x2, loop_d2


mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA81E, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 2                     														   // Contador y
mov x3, 2                     														   // Contador x

loop_d3:
	mov x1, x3
	 
letra_d3:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, letra_d3

	sub x2, x2, 1                        											   // contador Y
	lsl x1, x3, 2                        											   // cantidad que pinte, en memoria

	sub x0, x0, x1                       											   // nueva direccion 
	add x0, x0, 2560                     											   //  paso linea

	cbnz x2, loop_d3


mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xC11E, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 2                     														   // Contador y
mov x3, 2                     														   // Contador x

loop_d4:
	mov x1, x3
	 
letra_d4:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, letra_d4

	sub x2, x2, 1                        											   // contador Y
	lsl x1, x3, 2                        											   // cantidad que pinte, en memoria

	sub x0, x0, x1                       											   // nueva direccion 
	add x0, x0, 2560                     											   //  paso linea

	cbnz x2, loop_d4


// Letra c

movz x10, 0x00, lsl 16
movk x10, 0x0000, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA823, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 12                     														   // Contador y
mov x3, 7                     														   // Contador x

loop_c1:
    mov x1, x3

letra_c1:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, letra_c1

    sub x2, x2, 1                           										   // contador Y
    lsl x1, x3, 2                         											   // cantidad que pinte, en memoria

    sub x0, x0, x1                       											   // nueva direccion 
    add x0, x0, 2560                    											   //paso linea

    cbnz x2, loop_c1



movz x10, 0xFF, lsl 16
movk x10, 0xFFFF, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD25, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 8                     														   // Contador y
mov x3, 3                     														   // Contador x

loop_c2:
    mov x1, x3

letra_c2:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, letra_c2

    sub x2, x2, 1                        											   // contador Y
    lsl x1, x3, 2                        											   // cantidad que pinte, en memoria

    sub x0, x0, x1                       											   // nueva direccion 
    add x0, x0, 2560                     										 	   //  paso linea

    cbnz x2, loop_c2


movz x10, 0xFF, lsl 16
movk x10, 0xFFFF, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xB228, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 4                     														   // Contador y
mov x3, 2                     														   // Contador x

loop_c3:
    mov x1, x3

letra_c3:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, letra_c3

    sub x2, x2, 1                        											   // contador Y
    lsl x1, x3, 2                        											   // cantidad que pinte, en memoria

    sub x0, x0, x1                                                                 	   // nueva direccion 
    add x0, x0, 2560                     											   //  paso linea

    cbnz x2, loop_c3


// 2025

// 2

mov x10, 0
mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA830, lsl 00
lsl x4, x4, 2
add x0, x0, x4

mov x2, 2
mov x3, 3
mov x5, 7680

loop_linea:
    mov x1, 7 

linea_horizontal:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, linea_horizontal
    sub x2, x2, 1  																		//contador Y
    sub x0, x0, 28																		// Nueva direccion 
    add x0, x0, 2560 																	// Paso de linea
    cbnz x2, loop_linea
    add x0, x0, x5
    mov x2, 2
    sub x3, x3, 1
    cbnz x3, loop_linea


mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD35, lsl 00
lsl x4, x4, 2
add x0, x0, x4

mov x2, 3
mov x3, 2
mov x5, 5100

loop_linea1:
    mov x1, 2

linea_vertical:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, linea_vertical
    sub x2, x2, 1
    sub x0, x0, 8
    add x0, x0, 2560
    cbnz x2, loop_linea1
    add x0, x0, x5
    mov x2, 3
    sub x3, x3, 1
    cbnz x3, loop_linea1


// 0

movz x10, 0x00, lsl 16  
movk x10, 0x0000, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA83A, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 12                     														   // Contador y
mov x3, 7                     														   // Contador x

loop_0_1:
	mov x1, x3
	 
numero_0_1:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, numero_0_1

	sub x2, x2, 1                           										   // contador Y
	lsl x1, x3, 2                         											   // cantidad que pinte, en memoria

	sub x0, x0, x1                       											   // nueva direccion 
	add x0, x0, 2560                    											   // paso linea

	cbnz x2, loop_0_1

movz x10, 0xFF, lsl 16  
movk x10, 0xFFFF, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD3C, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 8                     														   // Contador y
mov x3, 3                     															// Contador x

loop_0_2:
	mov x1, x3
	 
numero_0_2:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, numero_0_2

	sub x2, x2, 1                        												// contador Y
	lsl x1, x3, 2                        												// cantidad que pinte, en memoria

	sub x0, x0, x1                       												// nueva direccion 
	add x0, x0, 2560                     												//  paso linea

	cbnz x2, loop_0_2

// 2

mov x10, 0
mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA844, lsl 00
lsl x4, x4, 2
add x0, x0, x4

mov x2, 2
mov x3, 3
mov x5, 7680

loop_linea2:
    mov x1, 7 

linea_horizontal1:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, linea_horizontal1
    sub x2, x2, 1  																		//contador Y
    sub x0, x0, 28																		// Nueva direccion 
    add x0, x0, 2560 																	//Paso de linea
    cbnz x2, loop_linea2
    add x0, x0, x5
    mov x2, 2
    sub x3, x3, 1
    cbnz x3, loop_linea2


mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD49, lsl 00
lsl x4, x4, 2
add x0, x0, x4

mov x2, 3
mov x3, 2
mov x5, 5100

loop_linea3:
    mov x1, 2

linea_vertical1:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, linea_vertical1
    sub x2, x2, 1
    sub x0, x0, 8
    add x0, x0, 2560
    cbnz x2, loop_linea3
    add x0, x0, x5
    mov x2, 3
    sub x3, x3, 1
    cbnz x3, loop_linea3


// 5


mov x10, 0
mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xA84E, lsl 00
lsl x4, x4, 2
add x0, x0, x4

mov x2, 2
mov x3, 3
mov x5, 7680
loop_linea4:
    mov x1, 7 

linea_horizontal2:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, linea_horizontal2
    sub x2, x2, 1
    sub x0, x0, 28
    add x0, x0, 2560
    cbnz x2, loop_linea4
    add x0, x0, x5
    mov x2, 2
    sub x3, x3, 1
    cbnz x3, loop_linea4


mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0xAD4E, lsl 00
lsl x4, x4, 2
add x0, x0, x4

mov x2, 3
mov x3, 2
mov x5, 5140

loop_linea5:
    mov x1, 2

linea_vertical2:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, linea_vertical2
    sub x2, x2, 1
    sub x0, x0, 8
    add x0, x0, 2560
    cbnz x2, loop_linea5
    add x0, x0, x5
    mov x2, 3
    sub x3, x3, 1
    cbnz x3, loop_linea5



//--------------------------------------
// Vela del barco
//--------------------------------------

mov x2, 34

movz x10, 0xF4, lsl 16 
movk x10, 0x4336, lsl 0

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0x6E8F, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x3, 68

loop7:
	mov x1, x3
	 
vela_barco:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, vela_barco
	sub x2, x2, 1 																		//contador Y

	lsl x1, x3, 2 																		// cantidad que pinte, en memoria
	sub x0, x0, x1 																		// nueva direccion 
	sub x0, x0, 2560 																	//paso linea
	add x0, x0, 4 
	sub x3, x3, 2 																		//cantidad de pixeles que voy a pintar en la proxima 129 - 2n

	cbnz x2, loop7

//--------------------------------------
// Mastil del barco
//--------------------------------------

mov x2, 51
movz x10, 0x4c, lsl 16
movk x10, 0x2d17, lsl 00

mov x0, x20
movz x4, 0x3, lsl 16
movk x4, 0x1C30, lsl 00
lsl x4, x4, 2
add x0, x0, x4

loop_mastil:
    mov x1, 3

mastil_barco:
    stur w10, [x0]
    add x0, x0, 4
    sub x1, x1, 1
    cbnz x1, mastil_barco
    sub x2, x2, 1 																		// contador Y
    sub x0, x0, 12 																		// Nueva direccion 
    add x0, x0, 2560  																	//paso linea
    cbnz x2, loop_mastil

//--------------------------------------
// Playa
//--------------------------------------

// Color
movz x10, 0xFF, lsl 16 
movk x10, 0x9800, lsl 0

//Direccion inicial
mov x0, x20
movz x4, 0x2, lsl 16
movk x4, 0xB894, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 10                 																// contador x
mov x3, 100                																// contador y

mov x6, 2                  																// contador lineas
mov x7, 2                  																// contador de cantidad de pixeles que van a dejarse de dibujar en la siguiente linea

loop8:
	mov x1, x3

playa_isla:                																// es el procedimiento que dibuja la isla
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, playa_isla

	sub x2, x2, 1
	lsl x1, x3, 2
	sub x0, x0, x1         																// nueva direccion
	sub x0, x0, 2560       																// paso a la linea de arriba
	lsr x8, x7, 1          																// x8 = x7 / 2 (mitad de la reducción)
	lsl x8, x8, 2          																// Convertir a bytes (offset)
	add x0, x0, x8         																// Desplaza el inicio solo la mitad

	sub x6, x6, 1
	cmp x6, 0
	b.ne skip
	add x7, x7, 2
	mov x6, 2

	// cuando el contador llegue a 0, añade 2 al registro x7 y resetea el valor del contador. Si no, salta directamente a la linea de skip.

	skip:
	sub x3, x3, x7         																// cantidad de pixeles que voy a pintar en la proxima por derecha

	cbnz x2, loop8


//--------------------------------------
// Tronco de la palmera
//--------------------------------------

movz x10, 0x4C, lsl 16 
movk x10, 0x2D17, lsl 0

//Direccion inicial
mov x0, x20
movz x4, 0x2, lsl 16
movk x4, 0xA241, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 81                     															// contador y
mov x3, 10                     															// contador X

mov x6, 15                     															// contador lineas
mov x7, 0

loop_tronco_palmera:
	mov x1, x3
	 
tronco_palmera:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, tronco_palmera
	sub x2, x2, 1              															// contador Y

	lsl x1, x3, 2              															// cantidad que pinte, en memoria
	sub x0, x0, x1             															// nueva direccion 
	sub x0, x0, 2560           															// paso linea
    
	sub x6, x6, 1
	cmp x6, 0
	b.ne skip2
	add x0, x0, 4
	mov x6, 15

	skip2:

	cbnz x2, loop_tronco_palmera


//--------------------------------------
// Cocos
//--------------------------------------

bl draw_coco1                                                               			// Llama al procedimiento que dibuja el coco

draw_coco1:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     			// Guardar dirección de retorno

    // Se configuran los parámetros del coco
    mov x19, x20                                                           				// Base del framebuffer
    movz x10, 0x2d, lsl 16
    movk x10, 0x1304, lsl 00 // 2d1304
    mov x23, x10

    mov x15, #436                                                           			// Coordenada X del centro
    mov x21, #266                                                           			// Coordenada Y del centro
    mov x22, #3                                                             			// Radio

    bl dibujar_circulo_relleno                                              			// Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64



bl draw_coco2                                                               			// Llama al procedimiento que dibuja el coco

draw_coco2:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     			// Guarda la dirección de retorno

    // Se configuran los parámetros del coco
    mov x19, x20                                                            			// Base del framebuffer
    movz x10, 0x2d, lsl 16
    movk x10, 0x1304, lsl 00
    mov x23, x10

    mov x15, #469                                                           			// Coordenada X del centro
    mov x21, #266                                                           			// Coordenada Y del centro
    mov x22, #3                                                             			// Radio

    bl dibujar_circulo_relleno                                              			// Llama al procedimiento que dibuja el circulo

    // Ahora se restauran los registros
    ldur x30, [sp, #56]
    ldur x22, [sp, #48]
    ldur x21, [sp, #40]
    ldur x10, [sp, #24]
    ldur x2, [sp, #16]
    ldur x1, [sp, #8]
    ldur x0, [sp, #0]
    add sp, sp, #64


//--------------------------------------
// Animacion
//--------------------------------------

b animation_section

//--------------------------------------
// Bucle de Animación (Mover el sol)
//--------------------------------------

animation_section:
    // Inicializar posición y colores
    mov x24, 639           // Posición X inicial del sol
    mov x25, 81            // Posición Y fija del sol
    mov x22, 35            // Radio del sol

    // Colores
    movz x26, 0x0F, lsl 16                       // Color del cielo (0x0FC4C4)
    movk x26, 0xC4C4, lsl 0
    movz x27, 0xFF, lsl 16                       // Color del sol (0xFFFF00)
    movk x27, 0xFF00, lsl 0

animation_loop:
    // 1. Restaura la posición anterior del sol (dibuja el cielo a medida que pasa el sol)
    mov x15, x28        // Usar posición guardada (X anterior)
    mov x21, x25        // Y
    mov x23, x26        // Color cielo
    bl dibujar_circulo_relleno

    // 2. Actualiza la posición: mueve el sol a la izquierda
    sub x24, x24, 1    // Decrementar X

    // 3. Verifica el límite izquierdo (reinicia si sale)
    add x0, x24, x22    // X + radio
    cmp x0, 0
    b.ge no_reset
    mov x24, 570        // Reiniciar a la derecha (SCREEN_WIDTH)
    add x24, x24, 35    // + radio

no_reset:
    // 4. Dibujar sol en nueva posición
    mov x15, x24        // Nueva X
    mov x21, x25        // Y
    mov x23, x27        // Color sol
    bl dibujar_circulo_relleno

    // 5. Dibujar nubes (encima del sol)
    bl draw_clouds

    // 6. Guarda la posición actual para el siguiente fotograma
    mov x28, x24

    // 7. Establece la velocidad de movimiento
    ldr x29, =0x3000000   // Valor del delay
    delay_loop:
    sub x29, x29, 1
    cbnz x29, delay_loop

    // 8. Repite el loop
    b animation_loop


//-------------------------------------------
// Subrutina para dibujar todas las nubes
//-------------------------------------------

draw_clouds:
    // Guardar registros
    stp x30, x19, [sp, -48]!
    stp x20, x21, [sp, 16]
    stp x22, x23, [sp, 32]

    mov x19, x20                                                                       // Base del framebuffer
    mov x23, 0xFFFFFFFF                                                                // Color blanco (nubes)

    // Nube 1
    mov x15, #314                                                                      // Centro X
    mov x21, #65                                                                       // Centro Y
    mov x22, #20                                                                       // Radio
    bl dibujar_circulo_relleno

    // Nube 2
    mov x15, #344
    mov x21, #63
    mov x22, #20
    bl dibujar_circulo_relleno

    // Nube 3
    mov x15, #297
    mov x21, #86
    mov x22, #20
    bl dibujar_circulo_relleno

    // Nube 4
    mov x15, #328
    mov x21, #88
    mov x22, #20
    bl dibujar_circulo_relleno

    // Nube 5
    mov x15, #360
    mov x21, #86
    mov x22, #20
    bl dibujar_circulo_relleno

    // Nube 6
    mov x15, #509
    mov x21, #90
    mov x22, #16
    bl dibujar_circulo_relleno

    // Nube 7
    mov x15, #530
    mov x21, #90
    mov x22, #16
    bl dibujar_circulo_relleno

    // Nube 8
    mov x15, #498
    mov x21, #110
    mov x22, #17
    bl dibujar_circulo_relleno

    // Nube 9
    mov x15, #524
    mov x21, #110
    mov x22, #17
    bl dibujar_circulo_relleno

    // Nube 10
    mov x15, #545
    mov x21, #109
    mov x22, #17
    bl dibujar_circulo_relleno

    // Restaurar registros y retornar
    ldp x22, x23, [sp, 32]
    ldp x20, x21, [sp, 16]
    ldp x30, x19, [sp], 48
    ret



//---------------------------------------------
// Subrutinas para dibujar un circulo relleno
//---------------------------------------------

//--------------------------------------------------------------
// Procedimiento que dibuja un circulo relleno
// Parámetros:
//   x19: Base del framebuffer
//   x15: Centro X (cx)
//   x21: Centro Y (cy)
//   x22: Radio (r)
//   x23: Color
//--------------------------------------------------------------

dibujar_circulo_relleno:
    sub sp, sp, #48
    stur x4, [sp, #0]     // Guardar registros
    stur x5, [sp, #8]
    stur x6, [sp, #16]
    stur x7, [sp, #24]
    stur x8, [sp, #32]
    stur x30, [sp, #40]

    mov x4, #0            // x = 0
    mov x5, x22           // y = radio
    mov x6, #1            
    sub x6, x6, x22       // d = 1 - radio

relleno_loop:
    cmp x4, x5
    b.gt fin_relleno

    // Dibujar líneas horizontales
    // Línea 1: (cx - y, cy + x) a (cx + y, cy + x) [Se dibujan lineas horizontales desde el centro para abajo]
    sub x7, x15, x5       // x_start = cx - y
    add x8, x15, x5       // x_end = cx + y
    add x9, x21, x4       // y_line = cy + x
    bl dibujar_linea_horizontal_simple

    // Línea 2: (cx - y, cy - x) a (cx + y, cy - x) [Se dibujan lineas horizontales desde el centro para arriba]
    sub x9, x21, x4       // y_line = cy - x
    bl dibujar_linea_horizontal_simple

    // Línea 3: (cx - x, cy + y) a (cx + x, cy + y) [Se dibujan lineas horizontales desde abajo para arriba]
    sub x7, x15, x4       // x_start = cx - x
    add x8, x15, x4       // x_end = cx + x
    add x9, x21, x5       // y_line = cy + y
    bl dibujar_linea_horizontal_simple

    // Línea 4: (cx - x, cy - y) a (cx + x, cy - y) [Se dibujan lineas horizontales desde arriba para abajo]
    sub x9, x21, x5       // y_line = cy - y
    bl dibujar_linea_horizontal_simple

    // Actualizar parámetro de decisión
    cmp x6, #0
    b.ge relleno_else
    // d < 0
    lsl x7, x4, #1        // 2*x
    add x6, x6, x7
    add x6, x6, #3        // d = 2*x + 3
    b relleno_next

relleno_else:              // d >= 0
    sub x7, x4, x5        // x - y
    lsl x7, x7, #1        // 2*(x - y)
    add x6, x6, x7
    add x6, x6, #5        // d += 2*(x - y) + 5
    sub x5, x5, #1        // y--

relleno_next:
    add x4, x4, #1        // x++
    b relleno_loop

fin_relleno:
    ldur x30, [sp, #40]
    ldur x8, [sp, #32]
    ldur x7, [sp, #24]
    ldur x6, [sp, #16]
    ldur x5, [sp, #8]
    ldur x4, [sp, #0]
    add sp, sp, #48
    ret



//--------------------------------------------------------------
// procedimiento que dibuja una linea horizontal
// Parámetros:
//   x7: x_start
//   x8: x_end
//   x9: y
//   x19: Base framebuffer
//   x23: Color
//--------------------------------------------------------------

dibujar_linea_horizontal_simple:
    // Asegurar que x_start <= x_end
    cmp x7, x8
    b.le 1f
    // Intercambiar si es necesario
    mov x0, x7
    mov x7, x8
    mov x8, x0
1:
    // Calcular dirección base para esta línea
    mov x0, SCREEN_WIDTH

    mul x9, x9, x0        // y = y * SCREEN_WIDTH
    add x1, x9, x7        // offset = y + x_start

    lsl x1, x1, #2        // offset *= 4 (bytes per pixel)
    add x1, x19, x1       // dirección actual
    
    // Calcular longitud de la línea
    sub x2, x8, x7        // longitud = x_end - x_start
    add x2, x2, #1        // +1 para incluir ambos extremos
    
    // Dibujar línea
    mov x3, #0            // contador
2:
    stur w23, [x1]        // Almacenar color
    add x1, x1, #4        // Siguiente píxel
    add x3, x3, #1        // Incrementar contador
    cmp x3, x2
    b.lt 2b
    
    ret

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
