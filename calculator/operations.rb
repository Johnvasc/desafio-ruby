require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      lista = []
      blckl = blacklist.split()
      gra = JSON.parse(grades)
      gra.each do |key, value|
      if blckl.include?(key) == false
          lista.append("#{key}:#{value}")
      end
      return lista
    end
  
    def no_integers(numbers)
      numeros = numbers.split()
      resp = []
      j = 0
      numeros.each do |i|
          if i.size() < 2
              resp[j] = 'n'
          else
              if i[-2..-1] == '75' or i[-2..-1] == '25' or i[-2..-1] == '50' or (i[-2..-1] == '00' and i.size()>2)
                  resp[j] = 's'
              else
                  resp[j] = 'n'
              end
          end
          j = j+1
      end
      return resp
    end
  
    def filter_films(genres, year)
      films = get_films
  
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
