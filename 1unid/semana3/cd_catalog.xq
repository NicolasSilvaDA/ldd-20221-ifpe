(: 
Qual a média de preços dos álbuns do catálogo? ->avg(//cd/price)
 
Qual o nome do álbum mais antigo do catálogo? -> //cd[year=min(//year)]/title/text()

Qual o álbum mais caro do catálogo? -> //cd[price=max(//price)]/title/text()

Quantos álbuns possuem artistas com nomes começando pela letra 'B'? -> count(//cd[artist[starts-with(., 'B')]])

Quantos álbuns foram lançados na década de 1980? -> count(//cd[year >= 1971 and year <= 1980])

Quais artistas lançaram álbuns pela Polydor? -> //cd[company="Polydor"]/artist

:)
