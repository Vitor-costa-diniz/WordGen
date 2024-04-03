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
    }
    static let mockThemes: [String: [String]] = [
        "Esportes": ["futebol", "basquete", "tênis", "natação", "atletismo", "vôlei", "handebol", "ginástica", "ciclismo", "boxe", "judô", "ginástica", "surfe", "skate", "hóquei", "rúgbi", "golfe", "escalada", "canoagem", "esgrima", "taekwondo", "triatlo", "patinação", "lutalivre", "corrida", "futsal", "pentatlo", "saltosornamentais", "marchaatlética", "hóqueisobregrama"],
        "Comidas": ["pizza", "hambúrguer", "sushi", "pasta", "churrasco", "salada", "tacos", "miojo", "risoto", "ramen", "sashimi", "queijo", "bolo", "café", "sanduíche", "nachos", "crepe", "fondue", "tapioca", "feijoada", "sorvete", "tiramisù", "cuscuz", "ovo", "lasanha", "empada", "arroz", "sopa", "strogonoff", "coxinha"],
        "Animais": ["gato", "cachorro", "elefante", "tigre", "leão", "zebra", "girafa", "macaco", "panda", "pássaro", "cavalo", "papagaio", "rato", "tartaruga", "coelho", "golfinho", "peixe", "tubarão", "coruja", "lontra", "foca", "camelo", "canguru", "pinguim", "crocodilo", "raposa", "urso", "lobo", "borboleta", "abelha", "macaco"],
        "Países": ["Brasil", "EstadosUnidos", "Canadá", "França", "Alemanha", "Itália", "Espanha", "Portugal", "ReinoUnido", "Japão", "China", "Índia", "Rússia", "México", "Argentina", "Chile", "Colômbia", "Austrália", "NovaZelândia", "ÁfricadoSul", "Nigéria", "Egito", "Marrocos", "Turquia", "Suécia", "Noruega", "Finlândia", "Dinamarca", "Holanda", "Bélgica"],
        "Estados do Brasil": ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "EspíritoSanto", "Goiás", "Maranhão", "MatoGrosso", "MatoGrossodoSul", "MinasGerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "RiodeJaneiro", "RioGrandedoNorte", "RioGrandedoSul", "Rondônia", "Roraima", "SantaCatarina", "SãoPaulo", "Sergipe", "Tocantins"],
        "Frutas e Hortaliças": ["amora", "maçã", "banana", "abacaxi", "laranja", "morango", "uva", "limão", "pêssego", "melancia", "kiwi", "pera", "manga", "abacate", "melão", "caqui", "jabuticaba", "cereja", "framboesa", "goiaba", "figo", "batata", "cenoura", "alface", "tomate", "cebola", "abóbora", "mandioca", "beterraba", "brócolis"]
    ]
}
