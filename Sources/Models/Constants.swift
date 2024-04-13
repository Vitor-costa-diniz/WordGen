//
//  File.swift
//  
//
//  Created by Vitor on 03/04/24.
//

import Foundation

enum Constants {
    enum UseCases {
        static let youGotIt = #"""
         __   __                        _     _ _        __
         \ \ / /__  _   _    __ _  ___ | |_  (_) |_   _  \ \
          \ V / _ \| | | |  / _` |/ _ \| __| | | __| (_)  | |
           | | (_) | |_| | | (_| | (_) | |_  | | |_   _   | |
           |_|\___/ \__,_|  \__, |\___/ \__| |_|\__| ( )  | |
                            |___/                    |/  /_/
"""#
        static let tryAgain = #"""
          _____                               _            __
         |_   _| __ _   _    __ _  __ _  __ _(_)_ __    _  \ \
           | || '__| | | |  / _` |/ _` |/ _` | | '_ \  (_)  | |
           | || |  | |_| | | (_| | (_| | (_| | | | | |  _   | |
           |_||_|   \__, |  \__,_|\__, |\__,_|_|_| |_| ( )  | |
                    |___/         |___/                |/  /_/
"""#
        static let hint = #"""
          _   _ _       _
         | | | (_)_ __ | |_
         | |_| | | '_ \| __|
         |  _  | | | | | |_
         |_| |_|_|_| |_|\__|
"""#
        static let resolve = #"""
          ____                 _               _   _
         |  _ \ ___  ___  ___ | |_   _____  __| | | |
         | |_) / _ \/ __|/ _ \| \ \ / / _ \/ _` | | |
         |  _ <  __/\__ \ (_) | |\ V /  __/ (_| | |_|
         |_| \_\___||___/\___/|_| \_/ \___|\__,_| (_)
                                             
"""#
        static let quit = #"""
          ____                                  _       _              _
         / ___|  ___  ___   _   _  ___  _   _  | | __ _| |_ ___ _ __  | |
         \___ \ / _ \/ _ \ | | | |/ _ \| | | | | |/ _` | __/ _ \ '__| | |
          ___) |  __/  __/ | |_| | (_) | |_| | | | (_| | ||  __/ |    |_|
         |____/ \___|\___|  \__, |\___/ \__,_| |_|\__,_|\__\___|_|    (_)
                            |___/
"""#
        static let win = #"""
           ____                            _         _       _   _                   _
          / ___|___  _ __   __ _ _ __ __ _| |_ _   _| | __ _| |_(_) ___  _ __  ___  | |
         | |   / _ \| '_ \ / _` | '__/ _` | __| | | | |/ _` | __| |/ _ \| '_ \/ __| | |
         | |__| (_) | | | | (_| | | | (_| | |_| |_| | | (_| | |_| | (_) | | | \__ \ |_|
          \____\___/|_| |_|\__, |_|  \__,_|\__|\__,_|_|\__,_|\__|_|\___/|_| |_|___/ (_)
                           |___/
"""#
    }
    static let mockThemes: [String: [String]] = [
        "Sports": ["football", "basketball", "tennis", "swimming", "athletics", "volleyball", "handball", "gymnastics", "cycling", "boxing", "judo", "surfing", "skateboarding", "hockey", "rugby", "golf", "climbing", "canoeing", "fencing", "taekwondo", "triathlon", "skating", "wrestling", "running", "futsal", "pentathlon", "diving", "racewalking", "fieldhockey"],
        "Foods": ["pizza", "burger", "sushi", "pasta", "barbecue", "salad", "tacos", "instant noodles", "risotto", "ramen", "sashimi", "cheese", "cake", "coffee", "sandwich", "nachos", "crepe", "fondue", "tapioca", "feijoada", "ice cream", "tiramisu", "couscous", "egg", "lasagna", "empanada", "rice", "soup", "beef stroganoff", "coxinha"],
        "Animals": ["cat", "dog", "elephant", "tiger", "lion", "zebra", "giraffe", "monkey", "panda", "bird", "horse", "parrot", "rat", "turtle", "rabbit", "dolphin", "fish", "shark", "owl", "otter", "seal", "camel", "kangaroo", "penguin", "crocodile", "fox", "bear", "wolf", "butterfly", "bee", "monkey"],
        "Countries": ["Brazil", "United States", "Canada", "France", "Germany", "Italy", "Spain", "Portugal", "United Kingdom", "Japan", "China", "India", "Russia", "Mexico", "Argentina", "Chile", "Colombia", "Australia", "New Zealand", "South Africa", "Nigeria", "Egypt", "Morocco", "Turkey", "Sweden", "Norway", "Finland", "Denmark", "Netherlands", "Belgium"],
        "States of Brazil": ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"],
        "Fruits and Vegetables": ["blackberry", "apple", "banana", "pineapple", "orange", "strawberry", "grape", "lemon", "peach", "watermelon", "kiwi", "pear", "mango", "avocado", "melon", "persimmon", "jabuticaba", "cherry", "raspberry", "guava", "fig", "potato", "carrot", "lettuce", "tomato", "onion", "pumpkin", "cassava", "beetroot", "broccoli"]
    ]
}
