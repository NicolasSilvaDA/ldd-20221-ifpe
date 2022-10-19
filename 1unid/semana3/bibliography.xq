(:// -> Busca de todos os subelementos no documento
//book[@category="LP"] -> Busca por todos os elementos que possuem tal atributo

//book[@category="LP"]/title/text() -> Conteúdo textual

Qual o nome dos livros que possuem mais de um autor? -> //book[count(author) > 1]/title/text()

Qual a média de preços dos livros da categoria SO? -> avg(//book[@category="SO"]/price)

Quantos livros a partir de 2010 possuem preço maior que 150? -> count(//book[year >= 2010 and price > 150])

Quantos livros da categoria LP estão em inglês? -> count(//book[@category="LP"]/title[@lang="en"])

Quantos autores começam com a letra 'A'? -> count(distinct-values(//author[starts-with(., 'A')]))

Quais autores começam com a letra 'A'? -> distinct-values(//author[starts-with(., 'A')])

Quais os nomes dos livros em português? -> //book/title[@lang="pt-br"]/text()

A média de preço dos livros em português é maior que dos livros em inglês? -> Verdadeiro. avg(//book[title/@lang="pt-br"]/price) > avg(//book[title/@lang="en"]/price)

Quantos livros 'Abraham Silberschatz' publicou em 2012? -> count(//book[author/text()="Abraham Silberschatz" and year=2012])

Qual autor possui mais livros publicados? -> 

Quais e quantos são os autores, agrupados pela inicial? ->

Quantos são os livros publicados, agrupados por década? ->

Quantos e quais são os livros publicados, agrupados por ano? ->

:)

