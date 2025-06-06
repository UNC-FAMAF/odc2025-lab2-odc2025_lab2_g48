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




// Mar

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
    stur w10, [x0] // pinta x0, primer pixel
	add x0, x0, 4 // siguiente pixel
    sub x1, x1, 1 // restamos contador X pixel
    cbnz x1, agua // si no termino, salto a agua
    sub x2, x2, 1 // restamos contador Y filas
    cbnz x2, loop2 // si no termino, salto a loop2



// Oleaje

mov x2, 4
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
	sub x0, x0, 380 // le resto a la direccion lo que avanze en X
	add x0, x0, 2560 // le sumo 2560 osea 640 x 4, para pasar a la linea siguiente en el mismo punto X
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



// Base del barco

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

	sub x2, x2, 1 //contador Y
	lsl x1, x3, 2 // cantidad que pinte, en memoria

	sub x0, x0, x1 // nueva direccion 
	add x0, x0, 2560 //paso linea
	add x0, x0, 4 
	
	sub x3, x3, 2 //cantidad de pixeles que voy a pintar en la proxima 129 - 2n
	cbnz x2, loop6



// Vela del barco

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
	sub x2, x2, 1 //contador Y

	lsl x1, x3, 2 // cantidad que pinte, en memoria
	sub x0, x0, x1 // nueva direccion 
	sub x0, x0, 2560 //paso linea
	add x0, x0, 4 
	sub x3, x3, 2 //cantidad de pixeles que voy a pintar en la proxima 129 - 2n

	cbnz x2, loop7



// Mastil del barco

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
    sub x2, x2, 1
    sub x0, x0, 12
    add x0, x0, 2560
    cbnz x2, loop_mastil



// Playa

// Color
movz x10, 0xFF, lsl 16 
movk x10, 0x9800, lsl 0

//Direccion inicial
mov x0, x20
movz x4, 0x2, lsl 16
movk x4, 0xB894, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 10                 // contador x
mov x3, 100                // contador y

mov x6, 2                  // contador lineas
mov x7, 2                  // contador de cantidad de pixeles que van a dejarse de dibujar en la siguiente linea

loop8:
	mov x1, x3

playa_isla:                // es el procedimiento que dibuja la isla
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, playa_isla

	sub x2, x2, 1
	lsl x1, x3, 2
	sub x0, x0, x1         // nueva direccion
	sub x0, x0, 2560       // paso a la linea de arriba
	lsr x8, x7, 1          // x8 = x7 / 2 (mitad de la reducción)
	lsl x8, x8, 2          // Convertir a bytes (offset)
	add x0, x0, x8         // Desplaza el inicio solo la mitad

	sub x6, x6, 1
	cmp x6, 0
	b.ne skip
	add x7, x7, 2
	mov x6, 2

	// cuando el contador llegue a 0, añade 2 al registro x7 y resetea el valor del contador. Si no, salta directamente a la linea de skip.

	skip:
	sub x3, x3, x7         // cantidad de pixeles que voy a pintar en la proxima por derecha

	cbnz x2, loop8



// Tronco de la palmera

movz x10, 0x4C, lsl 16 
movk x10, 0x2D17, lsl 0

//Direccion inicial
mov x0, x20
movz x4, 0x2, lsl 16
movk x4, 0xA241, lsl 0
lsl x4, x4, 2
add x0, x0, x4

mov x2, 57                     // contador y
mov x3, 10                     // contador X

mov x6, 15                     // contador lineas
mov x7, 0

loop_tronco_palmera:
	mov x1, x3
	 
tronco_palmera:
	stur w10, [x0]
	add x0, x0, 4
	sub x1, x1, 1
	cbnz x1, tronco_palmera
	sub x2, x2, 1              // contador Y

	lsl x1, x3, 2              // cantidad que pinte, en memoria
	sub x0, x0, x1             // nueva direccion 
	sub x0, x0, 2560           // paso linea
    
	sub x6, x6, 1
	cmp x6, 0
	b.ne skip2
	add x0, x0, 4
	mov x6, 15

	skip2:

	cbnz x2, loop_tronco_palmera


// Cocos


bl draw_coco1                                                               // Llama al procedimiento que dibuja el coco

draw_coco1:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guardar dirección de retorno

    // Se configuran los parámetros del coco
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x2d, lsl 16
    movk x10, 0x1304, lsl 00 // 2d1304
    mov x23, x10

    mov x15, #436                                                           // Coordenada X del centro
    mov x21, #266                                                           // Coordenada Y del centro
    mov x22, #3                                                             // Radio

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



bl draw_coco2                                                               // Llama al procedimiento que dibuja el coco

draw_coco2:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del coco
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0x2d, lsl 16
    movk x10, 0x1304, lsl 00
    mov x23, x10

    mov x15, #469                                                           // Coordenada X del centro
    mov x21, #266                                                           // Coordenada Y del centro
    mov x22, #3                                                             // Radio

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


// Nubes

bl draw_nube_1                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_1:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #314                                                           // Coordenada X del centro
    mov x21, #65                                                            // Coordenada Y del centro
    mov x22, #20                                                            // Radio

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


bl draw_nube_2                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_2:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #344                                                           // Coordenada X del centro
    mov x21, #63                                                            // Coordenada Y del centro
    mov x22, #20                                                            // Radio

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



bl draw_nube_3                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_3:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #297                                                           // Coordenada X del centro
    mov x21, #86                                                            // Coordenada Y del centro
    mov x22, #20                                                            // Radio

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



bl draw_nube_4                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_4:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #328                                                           // Coordenada X del centro
    mov x21, #88                                                            // Coordenada Y del centro
    mov x22, #20                                                            // Radio

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



bl draw_nube_5                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_5:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #360                                                           // Coordenada X del centro
    mov x21, #86                                                            // Coordenada Y del centro
    mov x22, #20                                                            // Radio

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



bl draw_nube_6                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_6:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #509                                                           // Coordenada X del centro
    mov x21, #90                                                            // Coordenada Y del centro
    mov x22, #16                                                            // Radio

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




bl draw_nube_7                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_7:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #530                                                           // Coordenada X del centro
    mov x21, #90                                                            // Coordenada Y del centro
    mov x22, #16                                                            // Radio

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



bl draw_nube_8                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_8:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #498                                                           // Coordenada X del centro
    mov x21, #110                                                           // Coordenada Y del centro
    mov x22, #17                                                            // Radio

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



bl draw_nube_9                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_9:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #524                                                           // Coordenada X del centro
    mov x21, #110                                                           // Coordenada Y del centro
    mov x22, #17                                                            // Radio

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




bl draw_nube_10                                                              // Llama al procedimiento que dibuja un pedazo de la nube

draw_nube_10:
    // Se guardan registros importantes
    sub sp, sp, #64
    stur x0, [sp, #0]
    stur x1, [sp, #8]
    stur x2, [sp, #16]
    stur x10, [sp, #24]
    stur x21, [sp, #40]
    stur x22, [sp, #48]
    stur x30, [sp, #56]                                                     // Guarda la dirección de retorno

    // Se configuran los parámetros del pedazo de nube
    mov x19, x20                                                            // Base del framebuffer
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00
    mov x23, x10

    mov x15, #545                                                           // Coordenada X del centro
    mov x21, #109                                                           // Coordenada Y del centro
    mov x22, #17                                                            // Radio

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



// Sol


bl draw_sun                                                                 // Llama al procedimiento que dibuja el coco

draw_sun:
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
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00
    mov x23, x10

    mov x15, #150                                                           // Coordenada X del centro
    mov x21, #81                                                            // Coordenada Y del centro
    mov x22, #35                                                            // Radio

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



// ================================================================
// Subrutinas para dibujar un circulo relleno
// ================================================================

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
    // Línea 1: (cx - y, cy + x) a (cx + y, cy + x)
    sub x7, x15, x5       // x_start = cx - y
    add x8, x15, x5       // x_end = cx + y
    add x9, x21, x4       // y_line = cy + x
    bl dibujar_linea_horizontal_simple

    // Línea 2: (cx - y, cy - x) a (cx + y, cy - x)
    sub x9, x21, x4       // y_line = cy - x
    bl dibujar_linea_horizontal_simple

    // Línea 3: (cx - x, cy + y) a (cx + x, cy + y)
    sub x7, x15, x4       // x_start = cx - x
    add x8, x15, x4       // x_end = cx + x
    add x9, x21, x5       // y_line = cy + y
    bl dibujar_linea_horizontal_simple

    // Línea 4: (cx - x, cy - y) a (cx + x, cy - y)
    sub x9, x21, x5       // y_line = cy - y
    bl dibujar_linea_horizontal_simple

    // Actualizar parámetro de decisión
    cmp x6, #0
    b.ge relleno_else
    // d < 0
    lsl x7, x4, #1        // 2*x
    add x6, x6, x7
    add x6, x6, #3        // d += 2*x + 3
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
    madd x1, x9, x0, x7   // offset = y * SCREEN_WIDTH + x_start
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
