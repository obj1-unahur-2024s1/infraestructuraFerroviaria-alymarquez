import vagones.*

class Formacion {
	const property vagones = []
	const property locomotoras = []
	
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	
	method eliminarVagon(vagon){
		vagones.remove(vagon)
	}
	
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	
	method eliminarLocomotora(locomotora){
		locomotoras.remove(locomotora)
	}
	
	method maximoPasajeros() = vagones.sum({x => x.maximoPasajeros()})
	
	method vagonesPopulares() = vagones.count({x => x.maximoPasajeros() > 50})
	
	method formacionCarguera() = vagones.all({x => x.maximoCarga() >= 1000})
	
	method dispersionDePesos() = 
		vagones.map({x => x.pesoMaximo()}).max() - vagones.map({x => x.pesoMaximo()}).min()
	
	method cantidadBanios() =
		vagones.count({x => x.tieneBanios()})
	
	method hacerMantenimiento() {
        vagones.forEach({ vagon => vagon.hacerMantenimiento() })
    }
	
	
	method equilibradaEnPasajeros(){
		var pasajeros = vagones.filter({x => x.maximoPasajeros() > 0}).map({vagon => vagon.maximoPasajeros()})
		
		return pasajeros.max() - pasajeros.min() <= 20 
	}
	
	method estaOrganizada(){
		var pasajerosEncontrados = false
        return vagones.all({vagon =>
            if (vagon.maximoPasajeros() > 0) {
                pasajerosEncontrados = true
                true
            } else {
                not pasajerosEncontrados
            }
        })
    }
    
    method velocidadMaxima() = locomotoras.map({x => x.velocidadMaxima()}).min()
    
    method esEficiente() = locomotoras.all({x => x.esEficiente()})
    
    method pesoMaximo() = 
    	vagones.sum({x => x.pesoMaximo()}) + locomotoras.sum({x => x.peso()})
    
    method puedeMoverse() = 
    	locomotoras.sum({x => x.arrastre()}) > self.pesoMaximo()
	
	method kilosDeEmpujeQueFaltan() =
		if (self.puedeMoverse()) 0 else locomotoras.sum({x => x.arrastre()}) - self.pesoMaximo()
		
	method vagonMasPesado() =
		vagones.max({x => x.pesoMaximo()})
	
	method esCompleja()=
		self.pesoMaximo() > 80000 or ( (vagones.size() + locomotoras.size()) > 8 )
}

