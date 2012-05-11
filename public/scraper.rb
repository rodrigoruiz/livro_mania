# -*- coding: utf-8 -*-
class Scraper
require 'public\address'
    
    def initialize(str)
        @address = str
    end
    def correct(str)
        str = str.gsub('\u00c1', "Á")
        str = str.gsub('\u00c2', "Â")
        str = str.gsub('\u00c9', "É")
        str = str.gsub('\u00ca', "Ê")
        str = str.gsub('\u00cd', "Í")
        str = str.gsub('\u00d3', "Ó")
        str = str.gsub('\u00d4', "Ô")
        str = str.gsub('\u00da', "Ú")
        str = str.gsub('\u00e0', "à")
        str = str.gsub('\u00e1', "á")
        str = str.gsub('\u00e2', "â")
        str = str.gsub('\u00e3', "ã")
        str = str.gsub('\u00e7', "ç")
        str = str.gsub('\u00e9', "é")
        str = str.gsub('\u00ea', "ê")
        str = str.gsub('\u00ed', "í")
        str = str.gsub('\u00ee', "î")
        str = str.gsub('\u00f3', "ó")
        str = str.gsub('\u00f4', "ô")
        str = str.gsub('\u00f5', "õ")
        str = str.gsub('\u00fa', "ú")
    end
    def execute
    	addr = Address.new("http://feliperoberto.com.br/api/correios/cep.php?cep="+@address)
    	str = addr.localizate.to_s()
    	lista = str.split('"')

        lista_rua = lista[3].split('-')
        
        lista[3] = lista_rua[0]
    	lista[3] = correct(lista[3])
    	lista[15] = correct(lista[15])
    	saida = lista[3]+","+lista[7]+","+lista[15]+","+lista[19]
    end
end