
class VagonesPasajeros {
	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	var pasajeros = 0
	
	method maximoPasajeros(){
		pasajeros = largo * if (ancho <= 3) 8 else 10
		pasajeros -= if (not estaOrdenado) 15 else 0
		
		return pasajeros
	}
	method maximoCarga() = if (tieneBanios) 300 else 800

	method pesoMaximo() = 2000 + 80 * self.maximoPasajeros() + self.maximoCarga()
	
	method hacerMantenimiento(){
		pasajeros += if (not estaOrdenado) 15 else 0
		estaOrdenado = true
	}
		
}


class VagonesCarga {
	var property maderasSueltas
	var property cargaMaxIdeal
	var property tieneBanios = false
	
	method maximoPasajeros() = 0
	
	method maximoCarga() = cargaMaxIdeal - 400 * maderasSueltas
	
	method pesoMaximo() = 1500 + self.maximoCarga()
	
	method hacerMantenimiento(){
		maderasSueltas -= if (maderasSueltas > 0) 2 else 1
	}
}


class VagonesDormitorio {
	var property compartimientos
	var property camasEnCompartimiento
	var property tieneBanios = true
	
	method maximoPasajeros() = compartimientos * camasEnCompartimiento
	
	method maximoCarga() = 1200
	
	method pesoMaximo() = 4000 + 80 * self.maximoPasajeros() + self.maximoCarga()

	method hacerMantenimiento(){}
}

