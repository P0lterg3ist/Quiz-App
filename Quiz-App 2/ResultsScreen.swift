import SwiftUI

struct ResultsScreen: View {
    
    var score: Int
    var totalQuestions: Int
    var colour: Color
    var colourNegate: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(colour)
                .foregroundColor(colour)
            VStack {
                CircularProgressView(progress: CGFloat(score) / CGFloat(totalQuestions))
                    .frame(width: 150, height: 150)
                
                Text("You got")
                    .padding()
                    .foregroundColor(colourNegate)
                Text("\(score) / \(totalQuestions) correct!")
                    .foregroundColor(colourNegate)
            }
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen(score: 3, totalQuestions: 6, colour: Color.white, colourNegate: Color.black)
    }
}
