(:
// -> Busca de todos os subelementos no documento

//book[@category="LP"] -> Busca por todos os elementos que possuem tal atributo

//book[@category="LP"]/title/text() -> Conteúdo textual

for $n in //book
where $n/year > 2010
order by $n/title
return $n/title/text() -> Exemplo de estrutura de busca e ordenação

return <data p="{$n/title/text()}" /> -> Exemplo de retorno para XML

let $var as xs:type := info | return $var -> Exemplo de declaração de variável

format-number(number, "###,###.00") -> Formatação de números



Qual o nome dos livros que possuem mais de um autor? -> //book[count(author) > 1]/title/text()

Qual a média de preços dos livros da categoria SO? -> avg(//book[@category="SO"]/price)

Quantos livros a partir de 2010 possuem preço maior que 150? -> count(//book[year >= 2010 and price > 150])

Quantos livros da categoria LP estão em inglês? -> count(//book[@category="LP"]/title[@lang="en"])

Quantos autores começam com a letra 'A'? -> count(distinct-values(//author[starts-with(., 'A')]))

Quais autores começam com a letra 'A'? -> distinct-values(//author[starts-with(., 'A')])

Quais os nomes dos livros em português? -> //book/title[@lang="pt-br"]/text()

A média de preço dos livros em português é maior que dos livros em inglês? -> Verdadeiro. avg(//book[title/@lang="pt-br"]/price) > avg(//book[title/@lang="en"]/price)

Quantos livros 'Abraham Silberschatz' publicou em 2012? -> count(//book[author/text()="Abraham Silberschatz" and year=2012])

Qual autor possui mais livros publicados? -> let $authors := distinct-values(//author)

let $autCount := for $aut in $authors
return <author name="{$aut}" qtd="{count(//book/author[. = $aut])}"/>

let $max := max(//$autCount/@qtd)

return $autCount[@qtd = $max]/@name/string()


Quais e quantos são os autores, agrupados pela inicial? ->

Quantos são os livros publicados, agrupados por década? ->

Quantos e quais são os livros publicados, agrupados por ano? ->

:)

let $autores := distinct-values(//author)

let $autores := for $aut in $autores
order by $aut
group by $i := $aut/substring(./string(), 1, 1)
return <authors initial="{$i}" qtd="{count(distinct-values(//author[substring(., 1, 1) = $i]))}">
{
  return <author>{//}</author>
}
  
</authors>

return $autores