//
//  ContentView.swift
//  United Airlines
//
//  Created by Krishna Babani on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            ScrollView {
                VStack(spacing: 0) {
                    HeaderView()
                        .padding(.bottom, 20)
                    
                    FlightCardView()
                }
            }
            .contentMargins(.horizontal, 20)
            .overlay(alignment: .bottom) {
                BookingButtonView()
            }
        }
    }
}

// MARK: - Background Components
struct BackgroundGradientView: View {
    var body: some View {
        MeshGradient(
            width: 5,
            height: 7,
            points: [
                // row 0 (y = 0.00)
                .init(0.00, 0.00), .init(0.25, 0.00), .init(0.50, 0.00), .init(0.75, 0.00), .init(1.00, 0.00),
                // row 1 (y = 0.1667)
                .init(0.00, 0.1667), .init(0.25, 0.1667), .init(0.50, 0.1667), .init(0.75, 0.1667), .init(1.00, 0.1667),
                // row 2 (y = 0.3333)
                .init(0.00, 0.3333), .init(0.25, 0.3333), .init(0.50, 0.3333), .init(0.75, 0.3333), .init(1.00, 0.3333),
                // row 3 (y = 0.5000)
                .init(0.00, 0.5000), .init(0.25, 0.5000), .init(0.50, 0.5000), .init(0.75, 0.5000), .init(1.00, 0.5000),
                // row 4 (y = 0.6667)
                .init(0.00, 0.6667), .init(0.25, 0.6667), .init(0.50, 0.6667), .init(0.75, 0.6667), .init(1.00, 0.6667),
                // row 5 (y = 0.8333)
                .init(0.00, 0.8333), .init(0.25, 0.8333), .init(0.50, 0.8333), .init(0.75, 0.8333), .init(1.00, 0.8333),
                // row 6 (y = 1.0000)
                .init(0.00, 1.0000), .init(0.25, 1.0000), .init(0.50, 1.0000), .init(0.75, 1.0000), .init(1.00, 1.0000)
            ],
            colors: [
                // rows 0–2 (blue)
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 1.0)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 1.0)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 1.0)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 1.0)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 1.0)),

                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.5)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.5)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.5)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.5)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.5)),

                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.2509628081)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.2509628081)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.2509628081)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.2509628081)),
                Color(#colorLiteral(red: 0.0667, green: 0.1882, blue: 0.6078, alpha: 0.2509628081)),
                
                // rows 3–6 (system background)
                Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground),
                Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground),
                Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground),
                Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground)
            ]
        )
        .ignoresSafeArea()
    }
}

// MARK: - Header Components
struct HeaderView: View {
    var body: some View {
        HStack {
            LogoView()
            Spacer()
            AddButtonView()
        }
    }
}

struct LogoView: View {
    var body: some View {
        Image("UA_Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
            .frame(width: 150, height: 34)
    }
}

struct AddButtonView: View {
    var body: some View {
        Button {} label: {
            Image(systemName: "plus")
                .resizable()
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .padding(10)
                .frame(width: 34, height: 34)
                .background(Circle().fill(Color.gray.gradient))
                .glassEffect(.regular.interactive(), in: .circle)
        }
    }
}

// MARK: - Flight Card Components
struct FlightCardView: View {
    var body: some View {
        VStack(spacing: 30) {
            FlightRouteView()
            PlaneImageView()
            FlightDetailsView()
        }
        .padding(30)
        .frame(alignment: .top)
        .glassEffect(.clear, in: .rect(cornerRadius: 30, style: .continuous))
    }
}

struct FlightRouteView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -3) {
                Text("LAS")
                    .font(.system(size: 44, weight: .semibold))
                
                Text("24 Jul, 12:45")
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 24, weight: .semibold))
            
            Spacer()
            
            VStack(alignment: .leading, spacing: -3) {
                Text("NYC")
                    .font(.system(size: 44, weight: .semibold))
                
                Text("16:05")
            }
        }
    }
}

struct PlaneImageView: View {
    var body: some View {
        Image("Plane")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
    }
}

struct FlightDetailsView: View {
    var body: some View {
        HStack {
            FlightDetailItem(title: "Flight", value: "AR 712")
            Spacer()
            FlightDetailItem(title: "Class", value: "First")
            Spacer()
            FlightDetailItem(title: "Boarding", value: "12:15")
            Spacer()
            FlightDetailItem(title: "Terminal", value: "B")
        }
    }
}

struct FlightDetailItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.body)
                .foregroundStyle(.secondary)
            
            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        }
    }
}

// MARK: - Booking Components
struct BookingButtonView: View {
    var body: some View {
        Button {} label: {
            Text("Book Flight")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .padding(10)
                .padding(.horizontal, 20)
                .frame(height: 60)
                .glassEffect(.regular.tint(.blue).interactive(), in: .capsule)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
