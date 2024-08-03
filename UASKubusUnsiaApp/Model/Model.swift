import SwiftUI

enum Kubus: CaseIterable{
    static var indexOffset : Int = 0;
	
    case pertama, kedua, ketiga, kempat, hapus;
	
	var view: AnyView{
		switch self{
			case .pertama, .kedua, .ketiga, .kempat:
                return AnyView(Image(pilihNamaKubus()).resizable().frame(width: 70,height: 70));
			default:
                return AnyView(EmptyView());
		}
	}
	
	private func pilihNamaKubus() -> String{
		switch self {
            case .pertama: return "abuabu";
            case .kedua: return "barisKubus";
            case .ketiga: return "coklat";
            case .kempat: return "merah";
            default: return "";
		}
	}
}
