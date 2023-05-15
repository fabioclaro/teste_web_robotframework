*** Settings ***
Documentation   Essa suite testa o site da amazon.com.br
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
#      Test Teardown   Fechar o navegador

*** test cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]   Esse teste verifica o menu eletrônicos do site amazon.com.br
    ...               e verifica a categoria Computadores e Informática
    [Tags]             menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Mais Vendidos"
    Verificar se aparece a frase "Mais Vendidos"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se aparece a categoria "Mais Vendidos em Cozinha"
    Verificar se aparece a categoria "Mais Vendidos em Moda"

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"