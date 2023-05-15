*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br
${MENU_MAISVENDIDOS}   //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${TITLE_PAGE}          //span[contains(@class,'a-size-extra-large a-color-base _p13n-zg-banner-landing-page-header_style_zgLandingPageBannerText__3HlJo')]

*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser  

Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 
    Wait Until Element Is Visible    locator=${MENU_MAISVENDIDOS} 

Entrar no menu "Mais Vendidos"
    Click Element    locator=${MENU_MAISVENDIDOS} 

Verificar se aparece a frase "${TITLE_TEXTO}"
    Wait Until Page Contains           text=${TITLE_TEXTO} 
    Wait Until Element Is Visible      locator=${TITLE_PAGE} 

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//h2[contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=//img[contains(@alt,'Console Xbox Series S')]
    Click Button    locator=add-to-cart-button

Verificar se o produto Console "${PRODUTO}" foi "${ADICIONADO}" com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'${ADICIONADO}')]
    Wait Until Element Is Visible    locator=//span[@class='a-size-base'][contains(.,'Xbox Series S')]

Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=//a[contains(@aria-label,'1 item no carrinho')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]
    Click Element    locator=//input[@value='Excluir']
    Wait Until Element Is Visible    locator=(//a[contains(.,'${PRODUTO}')])[1]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

    





# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Mais Vendidos"
   Entrar no menu "Mais Vendidos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"

E o texto "Mais Vendidos em Cozinha" deve ser exibido na página
    Verificar se aparece a categoria "Mais Vendidos em Cozinha"

E a categoria "Mais Vendidos em Moda" deve ser exibida na página
    Verificar se aparece a categoria "Mais Vendidos em Moda"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
   Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
