import SwiftUI

struct Patch: Identifiable {
    let id = UUID()
    let name: String
    let rules: Int
    var applied: Bool = false
}

struct ContentView: View {
    @State private var patches: [Patch] = [
        Patch(name: "Mi Primer Parche", rules: 2, applied: false)
    ]
    @State private var selectedPatch: Patch?

    var body: some View {
        TabView {
            NavigationStack {
                List {
                    ForEach($patches) { $patch in
                        Button { selectedPatch = patch } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(patch.name).bold().foregroundColor(.white)
                                    Text("\(patch.rules) replacement rules")
                                        .font(.caption).foregroundColor(.gray)
                                }
                                Spacer()
                                if patch.applied {
                                    Text("APPLIED").font(.caption2.bold())
                                        .padding(6).background(Color.green).foregroundColor(.white).cornerRadius(6)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Installed")
            }
            .tabItem { Label("Installed", systemImage: "house.fill") }

            VStack(spacing: 20) {
                Text("TYRONE XIT").font(.largeTitle.bold()).foregroundColor(.purple)
                Text("Importa tu archivo .3105").foregroundColor(.gray)
                Text("Bundle ID: com.tyrone.xit").font(.caption).foregroundColor(.gray)
                Spacer()
            }.padding()
            .tabItem { Label("Import", systemImage: "plus.circle.fill") }
        }
        .preferredColorScheme(.dark)
        .sheet(item: $selectedPatch) { patch in
            VStack(spacing: 16) {
                Text(patch.name).font(.title.bold())
                Text("\(patch.rules) replacement rules").foregroundColor(.gray)
                Button("Apply Patch") {}.padding().frame(maxWidth: .infinity).background(Color.purple).foregroundColor(.white).cornerRadius(12)
                Button("Restore Originals") {}.padding().frame(maxWidth: .infinity).background(Color.gray.opacity(0.2)).cornerRadius(12)
                Button("Export .3105") {}.padding().frame(maxWidth: .infinity).background(Color.black).foregroundColor(.white).cornerRadius(12)
                Spacer()
            }.padding()
        }
    }
}
