(: 
Qual a média de preços dos álbuns do catálogo? ->avg(//cd/price)
 
Qual o nome do álbum mais antigo do catálogo? -> //cd[year=min(//year)]/title/text()

Qual o álbum mais caro do catálogo? -> //cd[price=max(//price)]/title/text()

Quantos álbuns possuem artistas com nomes começando pela letra 'B'? -> count(//cd[artist[starts-with(., 'B')]])

Quantos álbuns foram lançados na década de 1980? -> count(//cd[year >= 1971 and year <= 1980])

Quais artistas lançaram álbuns pela Polydor? -> //cd[company="Polydor"]/artist

Em que ano foi lançado o álbum mais barato do catálogo? -> //cd[price=min(//price)]/year

Qual o álbum mais caro lançado no ano de 1987? ->//cd[year=1987 and price=max(//cd[year=1987]/price)]/title/text() 

Em que países os álbuns foram lançados? -> distinct-values(//cd/country)

Quantos artistas distintos existem no catálogo? -> count(distinct-values(//cd/artist))

:)
