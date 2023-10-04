import SwiftUI

struct Summary02CellsView: View {

    var cell1: String
    var cell2: String
    var cell3: String
    
    var body: some View {
        VStack {

            HStack{
                VStack{
                    Text("Cell 1")
                        .font(.headline)
                    Text("\(cell1)")
                }
                Spacer()
                VStack{
                    Text("Cell 2")
                        .font(.headline)
                    Text("\(cell2)")
                }
                Spacer()
                VStack{
                    Text("Cell 3")
                        .font(.headline)
                    Text("\(cell2)")
                }
            }
        }
        .padding()
    }
}

struct Summary02CellsView_Previews: PreviewProvider {
    static var previews: some View {
        Summary02CellsView( cell1: "0.21", cell2: "0.21", cell3: "0.21")
    }
}
