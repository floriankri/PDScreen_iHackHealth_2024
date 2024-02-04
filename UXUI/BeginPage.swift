import SwiftUI

struct BeginPage: View {
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.white,Color.white, Color.mint]),
                               startPoint: .topLeading,
                               endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    //hello user
                    HStack {
                        Spacer() // Push to the right
                        Text("Hello User!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.mint)
                            .frame(width: 50, height: 50)
                    }
                    .padding()
                    Spacer() // Push to the center
                    
                    //begin screening button!!
                    Button(action: {
                        // Handle button action here
                        print("Button pressed!")
                    }) {
                        
                        //begin screening box!
                        HStack {
                            Image(systemName: "figure.arms.open")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .foregroundColor(.white)
                            
                            Text("Begin Screening!")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.heavy)
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(Color.donaldDuck) // Set your desired color
                                .cornerRadius(15) // Set corner radius if needed
                        )
                        .padding() // Add padding as needed
                    }
                    
                    Spacer() // Push to the center
                    
                    // the questionnaeries box
                    VStack {
                        Text("Questionnaires")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                        
                        
                        HStack {
                            Image(systemName: "calendar.badge.plus")
                            Text("You have 1 survey to do")
                                .font(.headline)
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(Color.white) // Set your desired color
                                .cornerRadius(8) // Set corner radius if needed
                        )
                        .padding()
                    }
                    .padding(.all, 10.0)
                    //.border(Color.white, width: 2)
                    
                    Spacer() // Push to the bottom
                    
                    NavigationLink(destination: AboutPage()){
                        VStack{
                            HStack {
                                Spacer()
                                Image(systemName: "figure.run")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                                    .frame(width: 150, height: 150)
                                Spacer()
                                    .frame(width: 50.0)
                                
                                                        
                            }
                            HStack{
                                Spacer()
                                Text("About PDScreen")
                                    .font(.largeTitle)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                                    .underline()
                                Spacer()
                                    .frame(width: 30.0)
                            }
                        }
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                }
                .padding()
            }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BeginPage_Previews: PreviewProvider {
    static var previews: some View {
        BeginPage()
    }
}
