require_relative 'operations'

module Calculator
  class Menu
    def initialize
      op = new operations()
      puts "Escolha uma opção:"
      puts "1 - Média preconceituosa."
      puts "2 - Calculadora sem números."
      puts "3 - Filtro de filmes."
      puts "0 - Sair"
      n = gets.to_i
      if n == 1
        op.biased_mean({"Tomás":10, "Iury":10, "Vini":10, "Arnaldo": 9.2}, 'Iury Tomás')
      elsif n == 2
        puts "envie os numeros separados por espaço."
        num = gets
        op.no_integers(num)
      elsif n == 3
        op.filter_films('Action Fantasy War', '1985')
      end
    end
  end
end
