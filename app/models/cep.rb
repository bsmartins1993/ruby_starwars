require 'net/http'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class FILME
 attr_reader :title, :episode_id, :director, :release_date
 def initialize(id)
 filme_encontrado = encontrar(id)
 preencher_dados(filme_encontrado)
 end
 def filmes
 "#{@title} / #{@episode_id} / #{@director} - #{@release_date}"
 end

 private
 def preencher_dados(filme_encontrado)
 @title = filme_encontrado["title"]
 @episode_id = filme_encontrado["episode_id"]
 @director = filme_encontrado["director"]
 @release_date = filme_encontrado["release_date"]
 end
 def encontrar(id)
 ActiveSupport::JSON.decode(
 Net::HTTP.get(
 URI("https://swapi.dev/api/films/#{id}/?format=json")
 )
 )
 end
end


