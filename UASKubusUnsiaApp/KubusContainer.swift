import SwiftUI
struct KubusContainer: View {
    var body: some View {
        PembungkusKubus();
    }
}

#Preview {
    KubusContainer();
}

struct PembungkusKubus: View {
	var body: some View {
		ZStack {
            Color.red.ignoresSafeArea();
            KubusView().offset(x:0, y: -95);
		}
	}
}

struct KubusView:View {
	var body: some View {
		ZStack{
			ForEach(0 ..< 10){index in
                KubusSetView()
                .offset(x:100)
                .rotationEffect(.degrees(Double(index) * 120 ));
			}
		}
	}
}

struct KubusSetView : View {
    @ObservedObject var viewModel = KubusModel();
	
	var body: some View {
		ZStack{
			ForEach(0..<viewModel.allCubes.count, id : \.self){index in
                kubusView(index:index);
			}
		}
        .onAppear(perform: viewModel.mulaiPutar);
	}
	
	private func kubusView(index: Int) -> some View{
        let offset = viewModel.semuaIndex[index];
		return viewModel.allCubes[index].view.offset(x: offset.0,y: offset.1).zIndex(offset.2);
	}
}
