import SwiftUI

class KubusModel: ObservableObject{
	@Published var allCubes = Kubus.allCases
	@Published var semuaIndex: [(CGFloat,CGFloat,Double,Bool)] = [
		(-80, 40, 5, true),
		(-40, 20, 3, false),
		(0, 0, 1, false),
		(40, 20, 2, true),
		(0, 40, 4, false),
		(-40, 60, 6, false)
	]
	@Published var indexSaatIni : Int = 4
	
	func mulaiPutar(){
		withAnimation{
            putar()
		}
	}
	
	private func putar(){
		let hapusPosisiSaatIni = semuaIndex[5]
		
        semuaIndex[5] = semuaIndex[indexSaatIni]
        semuaIndex[indexSaatIni] = hapusPosisiSaatIni
		
        indexSaatIni = indexSaatIni - 1
		
		if indexSaatIni == -1 {
            indexSaatIni = 4
		}
		
		if semuaIndex[indexSaatIni].3 {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
				withAnimation{
					self.putar()
				}
			}
		} else{
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
				withAnimation{
					self.putar()
				}
			}
		}
	}
}
