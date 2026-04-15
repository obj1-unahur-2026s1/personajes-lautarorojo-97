// ELEMENTOS

object aurora { // VACA
    var property altura = 1
    var estaViva = true

    method recibirAtaque(potencia) {
        if (potencia >= 10) {
            estaViva = false
        }
    }
    
    method valorOtorga() = 15
    
    method recibirTrabajo() { 
        // No le pasa nada, pero debe entender el mensaje para que Mario no rompa
    }
}


object tipa { // ARBOL
    var property altura = 8

    method recibirAtaque(potencia) {
        // No le pasa nada, queda vacío
    }
    
    method valorOtorga() = altura * 2
    
    method recibirTrabajo() {
        altura = altura + 1
    }
}


object castillo {
    var property altura = 20
    var defensa = 150

    method recibirAtaque(potencia) {
        defensa = defensa - potencia
    }
    
    method valorOtorga() = defensa * 0.20 // o defensa / 5
    
    method recibirTrabajo() {
        defensa = 200.min(defensa + 20) // Usamos min para el tope de 200
    }
}

// ARMAS
object jabalina {
    var estaCargada = true
    const property potencia = 30 // 'const property' le crea el getter automáticamente

    method estaCargada() = estaCargada // Retorna la variable

    method usar() {
        estaCargada = false // Se descarga al primer uso
    }
}

object ballesta {
    var flechas = 10
    const property potencia = 4

    method estaCargada() = flechas > 0 

    method usar() {
        flechas = flechas - 1
    }
}

// PERSONAJES Y JUGADORES


object luisa { // JUGADOR
    var property personajeActivo = mario // O puede no tener al nacer

    method aparece(elemento) {
        personajeActivo.encontrar(elemento)
    }
}

object floki { // personaje guerrero
    var property armaActual = ballesta

    method encontrar(elemento) {
        if (armaActual.estaCargada()) {
            elemento.recibirAtaque(armaActual.potencia())
            armaActual.usar()
        }
    }
}


object mario {
    var valorRecolectado = 0
    var ultimoElementoEncontrado = null // Arranca vacío

    method encontrar(elemento) {
        valorRecolectado = valorRecolectado + elemento.valorOtorga()
        elemento.recibirTrabajo()
        ultimoElementoEncontrado = elemento // Guardamos el último
    }

    method esFeliz() {
        return valorRecolectado >= 50 or ultimoElementoEncontrado.altura() >= 10
    }
}