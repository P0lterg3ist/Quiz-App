import SwiftUI

struct ContentView: View {
    
    var questions = [Question(title: "How long is the Swift Accelerator Programme Briefing 2021 on YouTube?",
                            option1: "1hr 2min 48s",
                            option2: "1hr 2min 43s",
                            option3: "1hr 2min 28s",
                            option4: "53min 35s",
                            correctOption: 1),
                     Question(title: "What framework is this app built in?",
                            option1: "UIKit",
                            option2: "SwiftUI",
                            option3: "Java",
                            option4: "Ruby",
                            correctOption: 2),
                     Question(title: "Which company created Swift?",
                            option1: "Orange",
                            option2: "Tinkercademy",
                            option3: "Google",
                            option4: "Apple",
                            correctOption: 4),
                    Question(title: "When was swift created?",
                            option1: "2016",
                            option2: "2018",
                            option3: "2014",
                            option4: "2012",
                            correctOption: 3),
                    Question(title: "What day was Microsoft founded?",
                            option1: "14 April 1963",
                            option2: "8 May 1979",
                            option3: "4 April 1975",
                            option4: "2 June 1982",
                            correctOption: 3),
                     Question(title: "Which is the oldest language",
                              option1: "C++",
                              option2: "Julia",
                              option3: "JavaScript",
                              option4: "Objective-C",
                              correctOption: 4)]
    
    @State var currentQuestion = 0
    @State var correctAnswers = 0
    @State var isAlertPresented = false
    @State var isCorrect = false
    @State var isModalPresented = false
    @State var darkModeOn = false
    @State var themeColour = Color.white
    @State var themeColourNegate = Color.black
    @State var toggleThemeText = "Dark Mode"
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(themeColour)
                .foregroundColor(themeColour)
            VStack {
                ProgressView (value: Double(currentQuestion), total: Double(questions.count))
                    .padding()
                Text(questions[currentQuestion].title)
                    .padding()
                    .foregroundColor(themeColourNegate)
                
                HStack {
                    VStack {
                        Button {
                            didTapOption(optionNumber: 1)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 175, height: 50)
                                    .foregroundColor(.red)
                                HStack{
                                    Image(systemName: "triangle.fill")
                                        .foregroundColor(Color.white)
                                    Text(questions[currentQuestion].option1)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
              }
                            Button {
                                    didTapOption(optionNumber: 2)
                            } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 175, height: 50)
                                    .foregroundColor(.green)
                                HStack{
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.white)
                                    Text(questions[currentQuestion].option2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding()
                    VStack {
                        Button {
                            didTapOption(optionNumber: 3)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 175, height: 50)
                                    .foregroundColor(.blue)
                                HStack{
                                    Image(systemName: "diamond.fill")
                                        .foregroundColor(.white)
                                    Text(questions[currentQuestion].option3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        Button {
                            didTapOption(optionNumber: 4)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 175, height: 50)
                                    .foregroundColor(.yellow)
                                HStack{
                                    Image(systemName: "square.fill")
                                        .foregroundColor(.white)
                                    Text(questions[currentQuestion].option4)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                Button {
                    darkModeOn = !darkModeOn
                    if darkModeOn {
                        themeColour = Color(red: 0.2, green: 0.2, blue: 0.2)
                        themeColourNegate = Color.white
                        toggleThemeText = "Light Mode ????"
                    }
                    else {
                        themeColour = Color.white
                        themeColourNegate = Color.black
                        toggleThemeText = "Dark Mode"
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 150, height: 50)
                            .foregroundColor(themeColourNegate)
                        Text("\(toggleThemeText)")
                            .foregroundColor(themeColour)
                    }
                }
            }
            .alert(isPresented: $isAlertPresented) {
                
                Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                      message: Text(isCorrect ? "Sheesh Le Poggeres" : "wow so dum"),
                      dismissButton: .default(Text(isCorrect ? "*gigachad handshake*" : "yes ik")) {
                        currentQuestion += 1
                        
                        if currentQuestion == questions.count {
                            isModalPresented = true
                            currentQuestion = 0
                        }
                      })
            }.sheet(isPresented: $isModalPresented) {
                ResultsScreen(score: correctAnswers, totalQuestions: questions.count, colour: themeColour, colourNegate: themeColourNegate)
            }
        }
    }
    
    func didTapOption(optionNumber: Int) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("not wrong ig")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("lol wrong")
            isCorrect = false
        }
        isAlertPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
