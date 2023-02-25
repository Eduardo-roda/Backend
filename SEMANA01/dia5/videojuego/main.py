import pygame
import sys

ANCHO = 640 
ALTO = 480
FONDO = (0,0,64)

### CREAMOS LOS OBJETOS DEL VIDEOJUEGO

### CREAMOS LA CLASE BOLITA
class Bolita(pygame.sprite.Sprite):
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        #Cargar la imagen
        self.image = pygame.image.load('imagenes/bolita.png')
        #Obtener el rectangulo de la imagen
        self.rect = self.image.get_rect()
        #Posición inicial de la bolita en la pantalla
        #para centrarlo en la pantalla
        self.rect.centerx = ANCHO / 2
        self.rect.centery = ALTO / 2
        self.speed = [3,3]

    def update(self):
        #Verificar si la bolita se sale de pamtalla
        if self.rect.bottom >= ALTO or self.rect.top <= 0:
            self.speed[1] = -self.speed[1]
        elif self.rect.right >= ANCHO or self.rect.left <= 0:
            self.speed[0] = -self.speed[0]
        self.rect.move_ip(self.speed)

### CREAMOS LA CLASE PALETA
class Paleta(pygame.sprite.Sprite):
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        #cargar imagen
        self.image = pygame.image.load('imagenes/paleta.png')
        #obtenemos rectangulo 
        self.rect = self.image.get_rect()

        #posición inicial de la paleta central solo en el eje x de la pantalla
        self.rect.midbottom = (ANCHO/2, ALTO - 20)
        #establecemos el speed inicial
        self.speed = [0,0]

    def update(self, evento):
        #buscar si se presiono la tecla de la flecha izquierda
        if evento.key == pygame.K_LEFT and self.rect.left > 0:
            self.speed = [-5,0]
        elif evento.key == pygame.K_RIGHT and self.rect.right < ANCHO:
            self.speed = [5,0]
        else:
            self.speed = [0,0]
        self.rect.move_ip(self.speed)

### CREAMOS LA CLASE LADRILLO
class Ladrillo(pygame.sprite.Sprite):
    def __init__(self, posicion):
        pygame.sprite.Sprite.__init__(self)
        #cargar imagen
        self.image = pygame.image.load('imagenes/ladrillo.png')
        #obtenemos el rectangulo
        self.rect = self.image.get_rect()
        #posicion inicial
        self.rect.topleft = posicion

class Muro(pygame.sprite.Group):
    pass


pantalla = pygame.display.set_mode((ANCHO,ALTO))

pygame.display.set_caption('Juego de python de  Codigo G19')

#Crear un reloj para hacer de la bolita se mueva mas lento
reloj  = pygame.time.Clock()
#ajustar repeticion de enventos de presion de tecla(más rápido)
pygame.key.set_repeat(30)

#CREAMOS LOS OBJETOS DEL VIDEOJUEGO
bolita = Bolita()
jugador = Paleta()
ladrillo = Ladrillo((0,0))

while True:
    #Establecer el tiempo del relojs
    reloj.tick(60)
    #bucle para recorrer los eventos
    for evento in pygame.event.get():
        if evento.type == pygame.QUIT:
            #Cerrar el videojuego
            sys.exit()
        elif evento.type == pygame.KEYDOWN:
            jugador.update(evento)

    #Movemos la bolita
    bolita.update()

    #Pintamos la pantalla
    pantalla.fill(FONDO)
    #Dibijar la bolita en la pantalla
    pantalla.blit(bolita.image,bolita.rect)
    #Dibujar al jugador en la pantalla
    pantalla.blit(jugador.image,jugador.rect)
    #Actualizar los elementos en la pantalla

    pantalla.blit(ladrillo.image,ladrillo.rect)
    pygame.display.flip()