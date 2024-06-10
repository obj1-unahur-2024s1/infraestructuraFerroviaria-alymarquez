import vagones.*
import formacion.*
import locomotoras.*

class Deposito {
	var property formaciones = []
	var property locomotoras = []
	
	method vagonesMasPesados(){
		var vagones = formaciones.map({ formacion => formacion.vagonMasPesado()})
		var conjuntoVagones = #{}
		
		vagones.forEach({ x => conjuntoVagones.add(x)})
		
		return conjuntoVagones
	}
	
	method necesitaConductorExperimentado() =
		formaciones.any({x => x.esCompleja()})

	
	method agregarLocomotora(formacion){
		if (not formacion.puedeMoverse()){
			const kilos = formacion.kilosDeEmpujeQueFaltan()
			const locomotoraAdecuada = locomotoras.find({ x => x.peso() >= kilos})
			
			if (locomotoraAdecuada != null){
				formacion.agregarLocomotora(locomotoraAdecuada)
				locomotoras.remove(locomotoraAdecuada)
			}
		}
		return null
	}
}
