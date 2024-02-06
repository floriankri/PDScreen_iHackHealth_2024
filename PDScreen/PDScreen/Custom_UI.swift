import SwiftUI

/*
struct PDScreen_Button: View {
    @State var destination: NavigationLink<Destination>
    @State var text: String
    
    var body: some View {
        NavigationLink(destination: destination)  {
            // Your button action here
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(40)
                .frame(width: 250, height: 90)
                .background(Color.donaldDuck)
                .cornerRadius(15)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}
*/

struct BetterNavigationLink<Label: View, Destination: View>: View {
    let label: () -> Label
    let destination: () -> Destination

    init(@ViewBuilder label: @escaping () -> Label,
         @ViewBuilder destination: @escaping () -> Destination) {
        self.label = label
        self.destination = destination
    }

    var body: some View {
        // HACK: ZStack with zero opacity + EmptyView
        // Hides default chevron accessory view for NavigationLink
        ZStack {
            NavigationLink {
                self.destination()
            } label: {
                EmptyView()
            }
            .opacity(0)

            self.label()
        }
    }
}

struct NavigationButtonWithIcon: View {
    @State var buttonText: String
    @State var buttonImage: String
    
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Image(systemName: buttonImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                Spacer()
                    .frame(width: 50.0)
                
                                        
            }
            HStack{
                Spacer()
                Text(buttonText)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .underline()
                Spacer()
                    .frame(width: 30.0)
            }
        }
    }
    
}
